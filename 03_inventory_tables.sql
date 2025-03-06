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