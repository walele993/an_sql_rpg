USE rpg;

DELIMITER //

CREATE PROCEDURE BuyItem(
    IN p_character_id INT,
    IN p_item_category ENUM('Weapon','Equipment','Potion'),
    IN p_item_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE item_price INT;
    DECLARE total_cost INT;
    DECLARE current_money INT;
    DECLARE existing_quantity INT DEFAULT 0;

    -- Recupera il prezzo dell'oggetto in base alla categoria
    IF p_item_category = 'Weapon' THEN
        IF (SELECT COUNT(*) FROM weapons WHERE weapon_id = p_item_id) = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''arma specificata non esiste';
        END IF;
        SELECT price INTO item_price FROM weapons WHERE weapon_id = p_item_id;
    ELSEIF p_item_category = 'Equipment' THEN
        IF (SELECT COUNT(*) FROM equipment WHERE equipment_id = p_item_id) = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''equipaggiamento specificato non esiste';
        END IF;
        SELECT price INTO item_price FROM equipment WHERE equipment_id = p_item_id;
    ELSEIF p_item_category = 'Potion' THEN
        IF (SELECT COUNT(*) FROM potions WHERE potion_id = p_item_id) = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La pozione specificata non esiste';
        END IF;
        SELECT price INTO item_price FROM potions WHERE potion_id = p_item_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Categoria oggetto non valida';
    END IF;

    SET total_cost = item_price * p_quantity;
    
    -- Verifica se il personaggio ha fondi sufficienti
    SELECT money INTO current_money FROM characters WHERE character_id = p_character_id;
    IF current_money < total_cost THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fondi insufficienti per l''acquisto';
    ELSE
        -- Deduci il costo dal saldo del personaggio
        UPDATE characters
        SET money = money - total_cost
        WHERE character_id = p_character_id;
        
        -- Verifica se l'oggetto è già presente nell'inventario
        SELECT quantity INTO existing_quantity 
        FROM character_inventory 
        WHERE character_id = p_character_id 
          AND item_category = p_item_category 
          AND item_id = p_item_id
        LIMIT 1;
        
        IF existing_quantity > 0 THEN
            UPDATE character_inventory 
            SET quantity = quantity + p_quantity
            WHERE character_id = p_character_id 
              AND item_category = p_item_category 
              AND item_id = p_item_id;
        ELSE
            INSERT INTO character_inventory (character_id, item_category, item_id, quantity)
            VALUES (p_character_id, p_item_category, p_item_id, p_quantity);
        END IF;
    END IF;
END;
//

DELIMITER ;
