USE rpg;

-- Tabelle per i requisiti di EXP e bonus per livello
CREATE TABLE level_requirements (
    level INT PRIMARY KEY,
    exp_required INT NOT NULL
);

-- Inserimento dei requisiti di EXP per i livelli da 1 a 10
INSERT INTO level_requirements (level, exp_required) VALUES
(1, 0),
(2, 100),
(3, 300),
(4, 600),
(5, 1000),
(6, 1500),
(7, 2100),
(8, 2800),
(9, 3600),
(10, 4500);

CREATE TABLE level_bonus (
    level INT PRIMARY KEY,
    hp_bonus_percent INT NOT NULL,  -- Es. +10% HP per livello
    attack_bonus_percent INT NOT NULL,
    defense_bonus_percent INT NOT NULL,
    speed_bonus_percent INT NOT NULL
);

-- Esempio di bonus per i livelli da 2 a 10 (il livello 1 è di base, senza bonus)
INSERT INTO level_bonus (level, hp_bonus_percent, attack_bonus_percent, defense_bonus_percent, speed_bonus_percent) VALUES
(2, 5, 3, 3, 2),
(3, 6, 4, 4, 3),
(4, 7, 4, 4, 3),
(5, 8, 5, 5, 4),
(6, 9, 5, 5, 4),
(7, 10, 6, 6, 5),
(8, 11, 6, 6, 5),
(9, 12, 7, 7, 6),
(10, 13, 7, 7, 6);
-- Per i livelli superiori a 10 verrà usato un bonus di default:
-- Default bonus: hp_bonus = 5%, attack_bonus = 3%, defense_bonus = 3%, speed_bonus = 2%

DELIMITER //

CREATE PROCEDURE HandleLevelUp(IN char_id INT)
BEGIN
    DECLARE current_level INT;
    DECLARE current_exp INT;
    DECLARE next_level_exp INT;
    DECLARE hp_bonus INT;
    DECLARE attack_bonus INT;
    DECLARE defense_bonus INT;
    DECLARE speed_bonus INT;
    
    -- Ottieni il livello e l'EXP attuali del personaggio
    SELECT level, exp INTO current_level, current_exp 
    FROM characters 
    WHERE character_id = char_id;
    
    -- Calcola il requisito EXP per il livello successivo
    IF current_level < 10 THEN
        SELECT exp_required INTO next_level_exp 
        FROM level_requirements 
        WHERE level = current_level + 1;
    ELSE
        SET next_level_exp = 6000;
    END IF;
    
    -- Ciclo di livellamento: continua finché l'EXP corrente è sufficiente per il livello successivo
    WHILE current_exp >= next_level_exp DO
        -- Incrementa il livello e sottrai l'EXP necessaria
        SET current_level = current_level + 1;
        SET current_exp = current_exp - next_level_exp;
        
        -- Ottieni i bonus specifici se il livello è <= 10, altrimenti usa bonus di default
        IF current_level <= 10 THEN
            SELECT hp_bonus_percent, attack_bonus_percent, defense_bonus_percent, speed_bonus_percent
            INTO hp_bonus, attack_bonus, defense_bonus, speed_bonus
            FROM level_bonus 
            WHERE level = current_level;
        ELSE
            SET hp_bonus = 5;
            SET attack_bonus = 3;
            SET defense_bonus = 3;
            SET speed_bonus = 2;
        END IF;
        
        -- Applica i bonus percentuali alle statistiche attuali
        UPDATE characters
        SET hp = hp + (hp * hp_bonus / 100),
            attack = attack + (attack * attack_bonus / 100),
            defense = defense + (defense * defense_bonus / 100),
            speed = speed + (speed * speed_bonus / 100)
        WHERE character_id = char_id;
        
        -- Calcola il requisito EXP per il prossimo livello
        IF current_level < 10 THEN
            SELECT exp_required INTO next_level_exp 
            FROM level_requirements 
            WHERE level = current_level + 1;
        ELSE
            SET next_level_exp = 6000;
        END IF;
    END WHILE;
    
    -- Aggiorna il livello e l'EXP residua nel personaggio
    UPDATE characters
    SET level = current_level,
        exp = current_exp
    WHERE character_id = char_id;
END;
//

DELIMITER ;
