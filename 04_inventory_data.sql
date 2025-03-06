USE rpg;

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
