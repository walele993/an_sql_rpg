USE rpg;

CREATE TABLE IF NOT EXISTS potions (
    potion_id INT AUTO_INCREMENT PRIMARY KEY,
    potion_name VARCHAR(100) NOT NULL,
    potion_type ENUM('HP', 'Attack', 'Defense', 'Speed') NOT NULL,
    effect_value INT NOT NULL,  -- Indica l'incremento della statistica
    price INT NOT NULL          -- Prezzo in oro
);

CREATE TABLE IF NOT EXISTS equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    equipment_type ENUM('Helmet', 'Armor', 'Gloves', 'Boots') NOT NULL,
    hp_bonus INT DEFAULT 0,
    attack_bonus INT DEFAULT 0,
    defense_bonus INT DEFAULT 0,
    speed_bonus INT DEFAULT 0,
    price INT NOT NULL
);

CREATE TABLE IF NOT EXISTS weapons (
    weapon_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_name VARCHAR(100) NOT NULL,
    weapon_type ENUM('Sword', 'Axe', 'Spear', 'Bow', 'Staff', 'Mace', 'Dagger', 'Hammer', 'Claw', 'Whip') NOT NULL,
    attack_bonus INT NOT NULL,
    defense_bonus INT DEFAULT 0,
    speed_bonus INT DEFAULT 0,
    price INT NOT NULL
);

-- Nota: Non possiamo impostare un vincolo FOREIGN KEY su item_id perché l'oggetto può provenire
-- da tabelle diverse (weapons, equipment, potions). La relazione va gestita a livello applicativo.
CREATE TABLE character_inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    item_category ENUM('Weapon', 'Equipment', 'Potion') NOT NULL,
    item_id INT NOT NULL,
    quantity INT DEFAULT 1,
    equipped BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

CREATE TABLE equipment_slots (
    slot_id INT AUTO_INCREMENT PRIMARY KEY,
    character_id INT NOT NULL,
    slot_type ENUM('Helmet', 'Armor', 'Gloves', 'Boots', 'Weapon') NOT NULL,
    item_id INT, -- Può essere NULL se lo slot è vuoto
    FOREIGN KEY (character_id) REFERENCES characters(character_id)
);

DELIMITER //

CREATE PROCEDURE EquipItem(
    IN p_character_id INT,
    IN p_item_category ENUM('Weapon','Equipment'),
    IN p_item_id INT
)
BEGIN
    DECLARE slot_type VARCHAR(20);
    DECLARE cnt INT;
    DECLARE existing_item_id INT DEFAULT 0;
    
    -- Le pozioni non sono equipaggiabili
    IF p_item_category = 'Potion' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le pozioni non possono essere equipaggiate';
    END IF;
    
    -- Verifica che l'oggetto sia presente nell'inventario del personaggio
    SELECT COUNT(*) INTO cnt 
    FROM character_inventory 
    WHERE character_id = p_character_id 
      AND item_category = p_item_category 
      AND item_id = p_item_id;
    
    IF cnt = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''oggetto non è presente nell''inventario del personaggio';
    END IF;
    
    -- Determina lo slot in base alla categoria
    IF p_item_category = 'Weapon' THEN
        SET slot_type = 'Weapon';
    ELSEIF p_item_category = 'Equipment' THEN
        -- Recupera il tipo di equipaggiamento (Helmet, Armor, Gloves o Boots)
        SELECT equipment_type INTO slot_type
        FROM equipment
        WHERE equipment_id = p_item_id;
    END IF;
    
    -- Controlla se il personaggio ha già un oggetto equipaggiato nello slot corrispondente
    SELECT COALESCE(
            (SELECT item_id 
             FROM equipment_slots 
             WHERE character_id = p_character_id 
               AND slot_type = slot_type 
             LIMIT 1), 
            0) INTO existing_item_id;
    
    IF existing_item_id > 0 THEN
        -- Se presente, marca come non equipaggiato l'oggetto attualmente in uso
        UPDATE character_inventory
        SET equipped = FALSE
        WHERE character_id = p_character_id 
          AND item_category = IF(slot_type = 'Weapon', 'Weapon', 'Equipment')
          AND item_id = existing_item_id;
    END IF;
    
    -- Inserisci o aggiorna lo slot
    IF EXISTS (
        SELECT 1 
        FROM equipment_slots 
        WHERE character_id = p_character_id 
          AND slot_type = slot_type
    ) THEN
        UPDATE equipment_slots
        SET item_id = p_item_id
        WHERE character_id = p_character_id AND slot_type = slot_type;
    ELSE
        INSERT INTO equipment_slots (character_id, slot_type, item_id)
        VALUES (p_character_id, slot_type, p_item_id);
    END IF;
    
    -- Imposta l'oggetto come equipaggiato nell'inventario
    UPDATE character_inventory
    SET equipped = TRUE
    WHERE character_id = p_character_id 
      AND item_category = p_item_category
      AND item_id = p_item_id;
END;
//

DELIMITER ;
