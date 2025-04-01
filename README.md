# 🎮 SQL RPG Database

*An entire RPG adventure… powered by SQL!*  

---

## 🚀 Introduction

Welcome to **SQL RPG Database**! This quirky project simulates a **classic RPG** entirely within an SQL database. Whether you're a **SQL sorcerer** or just a curious adventurer, prepare for an epic quest featuring **Soggy Slimes**, **Angry Chickens**, and even **The World-Eater**! 🐉🔥

### 🎲 Key Features
- ⚔️ **Classes & Jobs**: Pick from **Warriors, Mages, Rogues** and wacky jobs like **Loony Librarian**!
- 🏰 **Zones & Enemies**: Fight **Grumpy Rats** in the **Noob Fields** or challenge the **Demon Emperor** in the **Demon’s Throne**.
- 🔥 **Weapons & Equipment**: Wield legendary gear like the **Excalibruh**!
- 🧪 **Potions & Items**: From **Soggy Bandages** to **Phoenix in a Bottle**, every adventurer needs supplies.
- 📊 **Dynamic Stats**: Your stats auto-adjust based on your **class, job, and equipment**.
- ⚡ **All in SQL**: No external game engine—**just raw SQL power!**

---

## 🛠️ Setup & Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/sql-rpg-database.git
cd sql-rpg-database
```

### 2️⃣ Set Up the Database
```bash
mysql -u your_username -p < rpg_database.sql
```
Now you're ready to **explore** the world through SQL queries! 🏹

---

## 🏹 How to Play

### 🎭 Create Your Character
```sql
INSERT INTO characters (character_name, class_id, job_id, hp, attack, defense, speed)
VALUES ('Sir Stabs-a-Lot', 1, 1, 100, 10, 5, 3);
```

### 🛡️ Equip Your Gear
```sql
INSERT INTO equipment_slots (character_id, slot_type, item_id)
VALUES (1, 'Weapon', 1); -- Equipping the Bendy Butterknife!
```

### 🏆 Fight Some Enemies
```sql
-- Find enemies in the Noob Fields
SELECT * FROM enemies WHERE zone_id = 1;
```

### ⚡ Level Up & Progress!
Keep battling, collecting gear, and exploring **dangerous dungeons** until you're strong enough to face **The World-Eater!**

---

## 🏰 World & Adventures

### 🌍 Zones
- 🌾 **Noob Fields**: Where every hero starts… and some never leave.
- 🏜️ **Cursed Desert**: Sandstorms, scorpions, and **mystical secrets**.
- 🔥 **Demon’s Throne**: The final challenge—**only legends survive**.

### 🐉 Enemies
- 🟢 **Soggy Slime**: It’s wet. It’s gross. It’s coming for you.
- 🐀 **Grumpy Rat**: Looks angry. Probably is.
- 🛑 **The World-Eater**: One bite, and you're **done**.

### ⚔️ Weapons & Equipment
- 🍴 **Bendy Butterknife**: Probably more useful for toast than combat.
- 🏹 **Bow of Infinite Arrows**: *Warning: Not actually infinite.*
- 🦾 **Patchwork Plating**: Crafted from **questionable** materials.

### 🧪 Potions & Items
- 🩹 **Soggy Bandage**: **Stops bleeding**… sometimes.
- 🔥 **Phoenix in a Bottle**: Guaranteed to **revive**… or just **burn your tongue**.

---

## 🏗️ Contributing
Want to add new **weapons, enemies, or quests**? Join the adventure!

1. **Fork** the repository.
2. **Clone** your fork:
   ```bash
   git clone https://github.com/your-username/sql-rpg-database.git
   ```
3. Create a **feature branch**:
   ```bash
   git checkout -b feature-new-zone
   ```
4. **Push** changes & submit a **pull request**!

---

## 🏆 Credits
This project was created by **Gabriele Meucci**. 🏅

---

## 📜 License
Licensed under **MIT License**. Use, modify, and expand—just **don’t blame us** if your hero gets eaten by a **Hangry Wolf**! 🐺

---

**Acknowledgments**
-------------------

*   **The Slightly Bigger Slime**: For being the hero we didn’t know we needed.
    
*   **Excalibruh**: For proving that even legendary swords can have a sense of humor.
    
*   **You**: For reading this far. Now go slay some slimes!
    

Happy adventuring! May your SQL queries be swift, and your battles epic. 🎮✨
