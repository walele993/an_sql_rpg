USE rpg;

-- Inserimento delle 10 classi
INSERT INTO classes (class_name, base_hp, base_attack, base_defense, base_speed) VALUES
('Warrior of Wackiness', 120, 18, 14, 6),
('Mage of Mayhem', 80, 12, 8, 14),
('Rogue Rascal', 100, 16, 10, 18),
('Paladin Pizzazz', 130, 15, 16, 8),
('Ranger Ruckus', 110, 17, 12, 16),
('Berserker Buffoon', 125, 20, 10, 10),
('Druid Droll', 90, 13, 12, 15),
('Necromancer Noodle', 85, 14, 10, 12),
('Monk of Mirth', 105, 16, 14, 18),
('Bardic Buffoonery', 95, 15, 11, 20);

-- Inserimento dei 20 jobs (con allitterazione e nomi distinti dalle classi)
INSERT INTO jobs (job_name, hp_modifier, attack_modifier, defense_modifier, speed_modifier) VALUES
('Silly Squire', 10, 2, 1, 0),
('Jovial Jester', -5, 0, -2, 5),
('Bumbling Blacksmith', 15, 3, 4, -3),
('Wacky Warden', 0, 2, 1, 3),
('Grumpy Guardian', 20, 4, 5, -2),
('Sassy Scout', -5, 3, -1, 6),
('Merry Mechanic', 5, 0, 0, 4),
('Charming Cheater', 10, 2, 0, 3),
('Funky Fisherman', 12, 1, 2, 1),
('Quirky Quartermaster', 8, 0, 3, 2),
('Nerdy Nomad', 5, 3, 1, 4),
('Wily Witch', -10, 5, -1, 7),
('Prankster Priest', 7, 0, 4, 2),
('Sneaky Spy', -8, 4, -2, 8),
('Loony Librarian', 0, 1, 3, 3),
('Giddy Gambler', 3, 2, 0, 5),
('Tottering Tinkerer', -5, 6, -3, 4),
('Boisterous Buccaneer', 6, 2, 2, 3),
('Whimsical Wanderer', 15, 4, 3, 1),
('Zany Zealot', 10, 5, 0, 2);

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

