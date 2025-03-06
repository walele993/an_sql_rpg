USE rpg;

CREATE TABLE combat (
    combat_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    enemy_id INT NOT NULL,
    start_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    end_time DATETIME,
    result ENUM('Win', 'Lose', 'Flee') NOT NULL,
    FOREIGN KEY (character_id) REFERENCES characters(character_id),
    FOREIGN KEY (enemy_id) REFERENCES enemies(enemy_id)
);

CREATE TABLE combat_turns (
    turn_id INT AUTO_INCREMENT PRIMARY KEY,
    combat_id INT NOT NULL,
    turn_number INT NOT NULL,
    attacker_type ENUM('Character', 'Enemy') NOT NULL,
    damage_dealt INT NOT NULL,
    hp_remaining INT NOT NULL,
    turn_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (combat_id) REFERENCES combat(combat_id)
);

DELIMITER //

CREATE PROCEDURE StartCombat(IN char_id INT, IN enemy_id INT)
BEGIN
    DECLARE char_hp, enemy_hp, char_attack, enemy_attack, char_defense, enemy_defense, char_speed, enemy_speed INT;
    DECLARE turn_time, char_attack_interval, enemy_attack_interval FLOAT;
    DECLARE combat_result ENUM('Win', 'Lose', 'Flee') DEFAULT NULL;
    DECLARE combat_id INT;

    -- Ottieni le statistiche del personaggio e del nemico
    SELECT hp, attack, defense, speed INTO char_hp, char_attack, char_defense, char_speed
    FROM characters WHERE character_id = char_id;

    SELECT hp, attack, defense, speed INTO enemy_hp, enemy_attack, enemy_defense, enemy_speed
    FROM enemies WHERE enemy_id = enemy_id;

    -- Inserisci un nuovo combattimento
    INSERT INTO combat (character_id, enemy_id, start_time) VALUES (char_id, enemy_id, NOW());
    SET combat_id = LAST_INSERT_ID();

    -- Calcola gli intervalli di attacco
    SET char_attack_interval = 1.0 / char_speed;
    SET enemy_attack_interval = 1.0 / enemy_speed;

    -- Simula il combattimento
    WHILE char_hp > 0 AND enemy_hp > 0 DO
        -- Personaggio attacca
        SET turn_time = char_attack_interval;
        CALL PerformAttack(combat_id, 'Character', char_attack, enemy_defense, enemy_hp, turn_time);
        
        -- Nemico attacca
        SET turn_time = enemy_attack_interval;
        CALL PerformAttack(combat_id, 'Enemy', enemy_attack, char_defense, char_hp, turn_time);
    END WHILE;

    -- Determina il risultato
    IF char_hp > 0 THEN
        SET combat_result = 'Win';
        -- Assegna EXP e soldi al personaggio
        UPDATE characters 
        SET exp = exp + (SELECT exp_drop FROM enemies WHERE enemy_id = enemy_id),
            money = money + (SELECT money_drop FROM enemies WHERE enemy_id = enemy_id)
        WHERE character_id = char_id;
    ELSE
        SET combat_result = 'Lose';
    END IF;

    -- Aggiorna il risultato del combattimento
    UPDATE combat SET end_time = NOW(), result = combat_result WHERE combat_id = combat_id;
END //

CREATE PROCEDURE PerformAttack(IN combat_id INT, IN attacker_type ENUM('Character', 'Enemy'), IN attack INT, IN defense INT, INOUT hp INT, IN turn_time FLOAT)
BEGIN
    DECLARE damage INT;
    DECLARE random_multiplier FLOAT;

    -- Calcola il moltiplicatore randomico
    SET random_multiplier = 0.8 + RAND() * 0.4;

    -- Calcola il danno
    SET damage = GREATEST(0, (attack - defense) * random_multiplier);

    -- Applica il danno
    SET hp = GREATEST(0, hp - damage);

    -- Registra il turno
    INSERT INTO combat_turns (combat_id, turn_number, attacker_type, damage_dealt, hp_remaining, turn_time)
    VALUES (combat_id, (SELECT COALESCE(MAX(turn_number), 0) + 1 FROM combat_turns WHERE combat_id = combat_id), attacker_type, damage, hp, NOW());
END //

DELIMITER ;