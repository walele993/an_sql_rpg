DROP DATABASE IF EXISTS rpg;
CREATE DATABASE rpg;
USE rpg;

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    base_hp INT NOT NULL,
    base_attack INT NOT NULL,
    base_defense INT NOT NULL,
    base_speed INT NOT NULL
);

CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_name VARCHAR(50) NOT NULL,
    hp_modifier INT NOT NULL,
    attack_modifier INT NOT NULL,
    defense_modifier INT NOT NULL,
    speed_modifier INT NOT NULL
);

CREATE TABLE characters (
    character_id INT AUTO_INCREMENT PRIMARY KEY,
    character_name VARCHAR(50) NOT NULL,
    class_id INT NOT NULL,
    job_id INT,  -- nullable fino a quando il job non viene scelto
    level INT DEFAULT 1,
    exp INT DEFAULT 0,
    money INT DEFAULT 0,
    hp INT NOT NULL,
    attack INT NOT NULL,
    defense INT NOT NULL,
    speed INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE zones (
    zone_id INT AUTO_INCREMENT PRIMARY KEY,
    zone_name VARCHAR(50) NOT NULL,
    difficulty INT NOT NULL  -- ad esempio da 1 a 10, per ordinare le zone
);

CREATE TABLE enemies (
    enemy_id INT AUTO_INCREMENT PRIMARY KEY,
    zone_id INT NOT NULL,
    enemy_name VARCHAR(50) NOT NULL,
    is_boss BOOLEAN DEFAULT FALSE,
    hp INT NOT NULL,
    attack INT NOT NULL,
    defense INT NOT NULL,
    speed INT NOT NULL,
    exp_drop INT NOT NULL,
    money_drop INT NOT NULL,
    FOREIGN KEY (zone_id) REFERENCES zones(zone_id)
);

-- 1. Inserimento delle zone
INSERT INTO zones (zone_name, difficulty) VALUES 
('The Noob Fields', 1),
('Dank Swamps', 2),
('The Forgotten Ruins', 3),
('Volcanic Depths', 4),
('Cursed Forest', 5),
('The Icy Tundra', 6),
('The Sunken Abyss', 7),
('The Sky Fortress', 8),
('The Eldritch Domain', 9),
('The Demon’s Throne', 10),
('The True End', 11);

-- 2. Inserimento dei nemici per ciascuna zona

-- Zone 1 - The Noob Fields
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(1, 'Soggy Slime', FALSE, 50, 5, 2, 1, 10, 5),
(1, 'Angry Chicken', FALSE, 40, 7, 1, 5, 12, 6),
(1, 'Grumpy Rat', FALSE, 45, 6, 2, 3, 11, 5),
(1, 'Muddy Goblin', FALSE, 55, 8, 3, 2, 13, 7),
(1, 'Lost Farmer', FALSE, 60, 7, 4, 2, 15, 8),
(1, 'Tiny Bandit', FALSE, 55, 9, 3, 4, 14, 9),
(1, 'Rusty Skeleton', FALSE, 70, 6, 6, 1, 16, 10),
(1, 'Lazy Bat', FALSE, 40, 8, 2, 6, 12, 7),
(1, 'Puddle Mimic', FALSE, 65, 5, 7, 1, 18, 12),
(1, 'Hangry Wolf', FALSE, 75, 9, 5, 5, 20, 15),
(1, 'The Slightly Bigger Slime', TRUE, 120, 12, 10, 2, 50, 25);

-- Zone 2 - Dank Swamps
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(2, 'Stinky Frog', FALSE, 90, 10, 4, 3, 25, 20),
(2, 'Mushy Zombie', FALSE, 110, 9, 6, 2, 28, 22),
(2, 'Sticky Vine Spirit', FALSE, 95, 11, 5, 4, 27, 21),
(2, 'Wet Gremlin', FALSE, 100, 12, 5, 5, 30, 24),
(2, 'Skeletal Fisherman', FALSE, 120, 13, 7, 2, 35, 28),
(2, 'Angry Mosquito', FALSE, 80, 14, 3, 7, 22, 19),
(2, 'Slimy Sorcerer', FALSE, 130, 11, 8, 3, 40, 30),
(2, 'Shady Merchant', FALSE, 105, 12, 6, 4, 32, 26),
(2, 'Bog Witch’s Pet', FALSE, 115, 13, 7, 5, 38, 29),
(2, 'Lurking Tentacle', FALSE, 140, 15, 9, 3, 45, 35),
(2, 'The Great Ooze', TRUE, 200, 18, 12, 2, 80, 50);

-- Zone 3 - The Forgotten Ruins
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(3, 'Haunted Armor', FALSE, 180, 20, 12, 3, 60, 40),
(3, 'Cursed Librarian', FALSE, 160, 18, 10, 5, 55, 38),
(3, 'Spooky Specter', FALSE, 170, 19, 11, 4, 58, 39),
(3, 'Enraged Archaeologist', FALSE, 175, 21, 10, 6, 62, 42),
(3, 'Skeletal Bard', FALSE, 190, 17, 13, 3, 65, 45),
(3, 'Wailing Wraith', FALSE, 185, 20, 12, 5, 63, 44),
(3, 'Lost Adventurer', FALSE, 195, 22, 14, 4, 67, 48),
(3, 'Cranky Gargoyle', FALSE, 200, 23, 15, 2, 70, 50),
(3, 'Arcane Anomaly', FALSE, 210, 24, 13, 6, 75, 55),
(3, 'Phantom Swordsman', FALSE, 220, 25, 14, 7, 80, 60),
(3, 'The Ruined King', TRUE, 300, 30, 20, 5, 150, 100);

-- Zone 4 - Volcanic Depths
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(4, 'Ash Goblin', FALSE, 250, 28, 18, 4, 100, 70),
(4, 'Lava Imp', FALSE, 240, 30, 17, 6, 105, 75),
(4, 'Burnt Skeleton', FALSE, 260, 27, 20, 3, 110, 80),
(4, 'Fire Mage’s Apprentice', FALSE, 230, 32, 15, 5, 95, 68),
(4, 'Melty Slime', FALSE, 270, 29, 21, 2, 115, 85),
(4, 'Exploding Golem', FALSE, 300, 35, 25, 1, 130, 90),
(4, 'Coughing Dragonling', FALSE, 280, 31, 19, 7, 120, 88),
(4, 'Magma Serpent', FALSE, 320, 34, 22, 5, 140, 95),
(4, 'Smoldering Knight', FALSE, 310, 33, 23, 4, 135, 92),
(4, 'Unstable Pyromancer', FALSE, 290, 32, 20, 6, 125, 89),
(4, 'The Infernal Behemoth', TRUE, 500, 50, 35, 3, 250, 150);

-- Zone 5 - Cursed Forest
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(5, 'Possessed Tree', FALSE, 300, 35, 22, 5, 130, 90),
(5, 'Sassy Dryad', FALSE, 280, 33, 20, 6, 125, 88),
(5, 'Giggles the Insane Clown', FALSE, 310, 30, 24, 4, 135, 92),
(5, 'Were-Squirrel', FALSE, 290, 34, 21, 7, 128, 90),
(5, 'Shadow Stalker', FALSE, 320, 36, 23, 5, 140, 95),
(5, 'Venomous Vine', FALSE, 305, 35, 22, 6, 132, 92),
(5, 'Screeching Owlbear', FALSE, 330, 38, 25, 4, 145, 98),
(5, 'Night Terror', FALSE, 340, 37, 24, 5, 150, 100),
(5, 'Whispering Shade', FALSE, 350, 36, 23, 7, 155, 105),
(5, 'That One Creepy Doll', FALSE, 360, 35, 22, 4, 158, 107),
(5, 'The Hollow Beast', TRUE, 600, 55, 40, 4, 300, 175);

-- Zone 6 - The Icy Tundra
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(6, 'Frost Gremlin', FALSE, 400, 45, 30, 3, 160, 110),
(6, 'Freezing Wraith', FALSE, 420, 46, 32, 4, 165, 115),
(6, 'Angry Penguin', FALSE, 390, 44, 29, 6, 158, 108),
(6, 'Ice Elemental', FALSE, 430, 47, 33, 3, 170, 112),
(6, 'Frostbite Wolf', FALSE, 410, 45, 31, 5, 162, 110),
(6, 'Glacial Troll', FALSE, 440, 48, 34, 2, 175, 115),
(6, 'Yeti’s Cousin', FALSE, 450, 49, 35, 4, 178, 118),
(6, 'Cursed Iceberg', FALSE, 460, 47, 36, 1, 180, 120),
(6, 'Shivering Necromancer', FALSE, 430, 50, 32, 3, 170, 115),
(6, 'Snowstorm Golem', FALSE, 480, 52, 38, 2, 190, 125),
(6, 'The Frozen Tyrant', TRUE, 750, 60, 50, 5, 350, 200);

-- Zone 7 - The Sunken Abyss
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(7, 'Zombie Pirate', FALSE, 450, 50, 35, 6, 180, 120),
(7, 'Singing Siren', FALSE, 430, 48, 33, 7, 175, 118),
(7, 'Enraged Kraken Tentacle', FALSE, 470, 52, 36, 5, 185, 122),
(7, 'Cursed Diver', FALSE, 440, 49, 34, 8, 180, 120),
(7, 'Deep-Sea Golem', FALSE, 460, 51, 35, 4, 182, 121),
(7, 'Abyssal Shadow', FALSE, 480, 53, 37, 5, 190, 125),
(7, 'Haunted Lighthouse Keeper', FALSE, 450, 50, 35, 6, 180, 120),
(7, 'Razorfin Shark', FALSE, 490, 55, 38, 7, 195, 130),
(7, 'Trapped Soul', FALSE, 500, 56, 39, 4, 200, 135),
(7, 'Leviathan’s Minion', FALSE, 510, 57, 40, 3, 205, 138),
(7, 'The Drowned King', TRUE, 900, 70, 55, 4, 400, 225);

-- Zone 8 - The Sky Fortress
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(8, 'Cloud Gremlin', FALSE, 500, 55, 38, 8, 200, 130),
(8, 'Thunder Djinn', FALSE, 520, 57, 40, 9, 205, 135),
(8, 'Storm Elemental', FALSE, 540, 59, 42, 7, 210, 140),
(8, 'Battle Angel', FALSE, 560, 60, 43, 6, 215, 145),
(8, 'Sky Pirate', FALSE, 580, 62, 44, 8, 220, 150),
(8, 'Floating Lich', FALSE, 600, 63, 45, 7, 225, 155),
(8, 'Celestial Sentinel', FALSE, 620, 65, 46, 6, 230, 160),
(8, 'Lightning Wolf', FALSE, 640, 67, 47, 9, 235, 165),
(8, 'Furious Griffin', FALSE, 660, 68, 48, 5, 240, 170),
(8, 'Astral Phantom', FALSE, 680, 70, 50, 8, 245, 175),
(8, 'The Divine Watcher', TRUE, 1000, 75, 60, 6, 450, 250);

-- Zone 9 - The Eldritch Domain
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(9, 'Crawling Madness', FALSE, 600, 65, 45, 5, 230, 150),
(9, 'Whispering Shadow', FALSE, 620, 67, 46, 6, 235, 155),
(9, 'Unstable Reality Tear', FALSE, 640, 68, 47, 7, 240, 160),
(9, 'Tentacle Horror', FALSE, 660, 70, 48, 5, 245, 165),
(9, 'Eyes Everywhere', FALSE, 680, 72, 49, 6, 250, 170),
(9, 'Unnameable Creature', FALSE, 700, 73, 50, 4, 255, 175),
(9, 'Nightmare Incarnate', FALSE, 720, 75, 51, 7, 260, 180),
(9, 'Cursed Prophet', FALSE, 740, 77, 52, 5, 265, 185),
(9, 'Void Spawn', FALSE, 760, 78, 53, 6, 270, 190),
(9, 'The Thing That Lurks', FALSE, 780, 80, 54, 7, 275, 195),
(9, 'The Eldritch Overlord', TRUE, 1200, 85, 70, 5, 500, 300);

-- Zone 10 - The Demon’s Throne
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(10, 'Hellhound Alpha', FALSE, 700, 60, 40, 10, 300, 200),
(10, 'Abyss Knight', FALSE, 750, 65, 45, 8, 320, 210),
(10, 'Screaming Tormentor', FALSE, 720, 68, 42, 9, 310, 205),
(10, 'Flaming Revenant', FALSE, 780, 70, 48, 7, 340, 220),
(10, 'Soul Devourer', FALSE, 800, 75, 50, 6, 350, 230),
(10, 'Dreadlord’s Champion', FALSE, 850, 78, 55, 5, 370, 240),
(10, 'Demon Berserker', FALSE, 900, 80, 60, 4, 400, 250),
(10, 'The Smiling Nightmare', FALSE, 950, 85, 65, 3, 420, 260),
(10, 'The Crimson Butcher', FALSE, 1000, 90, 70, 2, 450, 275),
(10, 'The Last Gatekeeper', FALSE, 1100, 95, 75, 1, 500, 300),
(10, 'The Demon Emperor', TRUE, 2000, 120, 90, 8, 1000, 500);

-- Boss Final (oltre le 10 zone)
INSERT INTO enemies (zone_id, enemy_name, is_boss, hp, attack, defense, speed, exp_drop, money_drop) VALUES
(11, 'The World-Eater', TRUE, 5000, 150, 120, 10, 5000, 2000);


-- ===================================================================
-- 2. CREAZIONE DELLA TABELLA POTIONS
-- ===================================================================

CREATE TABLE IF NOT EXISTS potions (
    potion_id INT AUTO_INCREMENT PRIMARY KEY,
    potion_name VARCHAR(100) NOT NULL,
    potion_type ENUM('HP', 'Attack', 'Defense', 'Speed') NOT NULL,
    effect_value INT NOT NULL,  -- Indica l'incremento della statistica
    price INT NOT NULL          -- Prezzo in oro
);

-- Inserimento delle pozioni (5 per ogni tipo)
INSERT INTO potions (potion_name, potion_type, effect_value, price) VALUES
-- HP Potions
('Soggy Bandage', 'HP', 10, 5),
('Mediocre Medicine', 'HP', 25, 15),
('Okay-ish Elixir', 'HP', 50, 40),
('Mighty Miracle Juice', 'HP', 100, 100),
('Phoenix in a Bottle', 'HP', 999, 500),
-- Attack Potions
('Kitten Scratch Serum', 'Attack', 2, 5),
('Mild Menace Brew', 'Attack', 5, 15),
('Punch-Packing Potion', 'Attack', 10, 40),
('Raging Rampage Tonic', 'Attack', 20, 100),
('Doombringer’s Delight', 'Attack', 50, 500),
-- Defense Potions
('Paper Armor Extract', 'Defense', 2, 5),
('Sturdy-ish Syrup', 'Defense', 5, 15),
('Shieldbearer’s Shot', 'Defense', 10, 40),
('Titan’s Blood', 'Defense', 20, 100),
('Adamantium Overdose', 'Defense', 50, 500),
-- Speed Potions
('Snail Slime Tincture', 'Speed', 2, 5),
('Jogger’s Juice', 'Speed', 5, 15),
('Hyper Hare Brew', 'Speed', 10, 40),
('Lightning in a Cup', 'Speed', 20, 100),
('Sonic’s Secret Sauce', 'Speed', 50, 500);

-- ===================================================================
-- 3. CREAZIONE DELLA TABELLA EQUIPMENT
-- ===================================================================

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

-- Inserimento dell'Equipment in 4 categorie

-- Helmets
INSERT INTO equipment (equipment_name, equipment_type, defense_bonus, speed_bonus, price) VALUES
('Rusty Bucket', 'Helmet', 1, -1, 5),
('Dented Domeguard', 'Helmet', 3, 0, 20),
('Reliable Headpan', 'Helmet', 5, 1, 50),
('Knightly Nogginshield', 'Helmet', 8, 2, 150),
('Titanium Braincase', 'Helmet', 12, 3, 500);

-- Armors
INSERT INTO equipment (equipment_name, equipment_type, hp_bonus, defense_bonus, price) VALUES
('Tattered Tunic', 'Armor', 5, 2, 10),
('Patchwork Plating', 'Armor', 15, 5, 50),
('Sturdy Chestplate', 'Armor', 30, 10, 150),
('Paladin’s Panzer', 'Armor', 50, 15, 400),
('Adamantine Fortress', 'Armor', 100, 25, 1000);

-- Gloves
INSERT INTO equipment (equipment_name, equipment_type, attack_bonus, speed_bonus, price) VALUES
('Mismatched Mitts', 'Gloves', 1, 0, 5),
('Padded Punchers', 'Gloves', 3, 1, 25),
('Iron Knucklers', 'Gloves', 7, 2, 100),
('Dragonhide Gauntlets', 'Gloves', 12, 3, 300),
('Doomfists of Destruction', 'Gloves', 20, 5, 800);

-- Boots
INSERT INTO equipment (equipment_name, equipment_type, speed_bonus, defense_bonus, price) VALUES
('Worn-out Sandals', 'Boots', 1, 0, 5),
('Leather Leapers', 'Boots', 3, 1, 30),
('Swift Striders', 'Boots', 6, 2, 120),
('Phantom Fleetfoots', 'Boots', 10, 3, 350),
('Windsprint Warboots', 'Boots', 15, 5, 1000);

-- ===================================================================
-- 4. CREAZIONE DELLA TABELLA WEAPONS
-- ===================================================================

CREATE TABLE IF NOT EXISTS weapons (
    weapon_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_name VARCHAR(100) NOT NULL,
    weapon_type ENUM('Sword', 'Axe', 'Spear', 'Bow', 'Staff', 'Mace', 'Dagger', 'Hammer', 'Claw', 'Whip') NOT NULL,
    attack_bonus INT NOT NULL,
    defense_bonus INT DEFAULT 0,
    speed_bonus INT DEFAULT 0,
    price INT NOT NULL
);

-- Inserimento delle armi nelle varie categorie

-- Swords
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Bendy Butterknife', 'Sword', 3, 0, 5),
('Training Toothpick', 'Sword', 5, 1, 20),
('Steel Slasher', 'Sword', 10, 2, 50),
('Paladin’s Pristine Blade', 'Sword', 15, 3, 150),
('Excalibruh', 'Sword', 25, 5, 500);

-- Axes
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Splintering Hatchet', 'Axe', 10, -1, 10),
('Woodcutter’s Wrecker', 'Axe', 20, -2, 50),
('Savage Skullsplitter', 'Axe', 35, -3, 150),
('Behemoth’s Cleaver', 'Axe', 50, -4, 400),
('Planet-Cracking Battleaxe', 'Axe', 75, -5, 1000);

-- Spears
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, defense_bonus, price) VALUES
('Rusty Stick', 'Spear', 5, 0, 5),
('Peasant’s Pitchfork', 'Spear', 10, 1, 20),
('Knight’s Lance-a-lot', 'Spear', 20, 2, 50),
('Dragonpiercer Pike', 'Spear', 30, 3, 150),
('Olympian’s Lightning Javelin', 'Spear', 50, 5, 500);

-- Bows
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Twig Shooter', 'Bow', 5, 3, 5),
('Ranger’s Trusty Bow', 'Bow', 10, 5, 25),
('Elven Whisperstring', 'Bow', 20, 7, 100),
('Sniper’s Deathwind', 'Bow', 40, 10, 300),
('Apocalyptic Stormbow', 'Bow', 60, 15, 800);

-- Staffs
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, defense_bonus, price) VALUES
('Crooked Twig', 'Staff', 5, 0, 5),
('Apprentice’s Firestarter', 'Staff', 10, 1, 25),
('Arcane Amplifier', 'Staff', 20, 2, 100),
('Grandmaster’s Oblivion Rod', 'Staff', 35, 5, 300),
('Cosmic Reality-Bender', 'Staff', 50, 10, 800);

-- Maces
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Pebble Pounder', 'Mace', 8, -2, 10),
('Battering Club', 'Mace', 15, -3, 50),
('Iron Smacker', 'Mace', 30, -4, 150),
('Titan’s Fist', 'Mace', 45, -5, 400),
('Earthbreaker Maul', 'Mace', 75, -6, 1000);

-- Daggers
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Pocket Peeler', 'Dagger', 5, 1, 5),
('Thorned Stiletto', 'Dagger', 10, 2, 20),
('Silent Strike Blade', 'Dagger', 20, 3, 50),
('Venomous Viper Fang', 'Dagger', 30, 4, 150),
('Shadow’s Kiss', 'Dagger', 50, 6, 400);

-- Hammers
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Pounding Pestle', 'Hammer', 8, -2, 10),
('Sledgehammer of Shame', 'Hammer', 20, -3, 50),
('Warrior’s Wrecking Hammer', 'Hammer', 35, -4, 150),
('Thunderstrike Maul', 'Hammer', 50, -5, 400),
('Godslayer’s Mallet', 'Hammer', 75, -6, 1000);

-- Claws
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Kitty Scratchers', 'Claw', 3, 2, 5),
('Eagle Talons', 'Claw', 10, 3, 20),
('Steel Claw Gauntlets', 'Claw', 20, 4, 50),
('Demon’s Claws', 'Claw', 40, 5, 150),
('Dragon’s Fury Talons', 'Claw', 60, 6, 400);

-- Whips
INSERT INTO weapons (weapon_name, weapon_type, attack_bonus, speed_bonus, price) VALUES
('Cowherd’s Cord', 'Whip', 3, 5, 5),
('Whip of the Wilds', 'Whip', 8, 7, 25),
('Viper Lash', 'Whip', 15, 10, 100),
('Thunderlash Whip', 'Whip', 30, 12, 300),
('Executioner’s Lash', 'Whip', 50, 15, 800);

-- ===================================================================
-- 5. CREAZIONE DELLA TABELLA CHARACTER_INVENTORY (INVENTARIO POLIMORFICO)
-- ===================================================================

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

CREATE TABLE level_requirements (
    level INT PRIMARY KEY,
    exp_required INT NOT NULL
);

-- Inserimento dei requisiti di EXP per ogni livello
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

