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

