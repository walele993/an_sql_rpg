USE rpg;

DELIMITER //

CREATE TRIGGER level_up
AFTER UPDATE ON characters
FOR EACH ROW
BEGIN
    DECLARE required_exp INT;
    
    -- Trova l'EXP necessaria per il prossimo livello
    SELECT exp_required INTO required_exp
    FROM level_requirements
    WHERE level = NEW.level + 1;

    -- Se l'EXP del personaggio è sufficiente, aumenta il livello
    WHILE NEW.exp >= required_exp DO
        SET NEW.level = NEW.level + 1;
        SET NEW.exp = NEW.exp - required_exp;
        
        -- Trova l'EXP necessaria per il livello successivo
        SELECT exp_required INTO required_exp
        FROM level_requirements
        WHERE level = NEW.level + 1;
    END WHILE;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateStatsOnLevelUp(IN char_id INT)
BEGIN
    DECLARE base_hp, base_attack, base_defense, base_speed INT;
    DECLARE hp_mod, attack_mod, defense_mod, speed_mod INT;

    -- Ottieni le statistiche base della classe
    SELECT base_hp, base_attack, base_defense, base_speed INTO base_hp, base_attack, base_defense, base_speed
    FROM classes
    WHERE class_id = (SELECT class_id FROM characters WHERE character_id = char_id);

    -- Ottieni i modificatori del job (se presente)
    SELECT hp_modifier, attack_modifier, defense_modifier, speed_modifier INTO hp_mod, attack_mod, defense_mod, speed_mod
    FROM jobs
    WHERE job_id = (SELECT job_id FROM characters WHERE character_id = char_id);

    -- Aggiorna le statistiche del personaggio
    UPDATE characters
    SET hp = base_hp + hp_mod,
        attack = base_attack + attack_mod,
        defense = base_defense + defense_mod,
        speed = base_speed + speed_mod
    WHERE character_id = char_id;
END;
//

DELIMITER ;
