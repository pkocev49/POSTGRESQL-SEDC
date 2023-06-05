-- Homework 05
-- Homework 1/2
-- Homework prerequisite: create a new table called ProductHistory.
-- Columns should be (id serial, oldPrice real, oldCost real,
-- newPrice real, newCost real, changedOn date, orderedOn date, orderedQuantity int).

-- Create a trigger that after the Product table gets updated,
-- the trigger inserts a row in the ProductHistory.
-- with the old and new price and cost.
-- Set the current date to the changedOn column. Leave the other columns null.


SELECT * FROM product
SELECT * FROM producthistory


CREATE OR REPLACE FUNCTION product_update_trigger_function()
RETURNS TRIGGER
AS $$
	BEGIN
		IF TG_OP = 'UPDATE' THEN
		INSERT INTO producthistory(id,oldprice, newprice, oldcost, newcost, changedon)
		VALUES (OLD.id,OLD.price,NEW.price,OLD.cost, NEW.cost, NOW());
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE PLPGSQL

CREATE TRIGGER product_update_trigger
AFTER UPDATE ON product
FOR EACH ROW 
EXECUTE FUNCTION product_update_trigger_function()

UPDATE product
SET price = 10 ,cost=1
WHERE id = 1

-- Create a trigger that after the OrderDetails table gets a record added,
-- the trigger inserts a row in the ProductHistory table.
-- Set the orderedOn column to the current date and the orderedQuantity with the quantity
-- coming from the new OrderDetails record.

CREATE OR REPLACE FUNCTION orderdetails_insert_trigger_function()
RETURNS TRIGGER
AS $$
	BEGIN
		IF TG_OP = 'INSERT' THEN
		INSERT INTO producthistory(id,orderedquantity,orderedon)
		VALUES (NEW.id,NEW.quantity,NOW());
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE PLPGSQL

SELECT * FROM orderdetails





CREATE TRIGGER orderdetails_insert_trigger
AFTER INSERT ON orderdetails
FOR EACH ROW 
EXECUTE FUNCTION orderdetails_insert_trigger_function()

INSERT INTO orderdetails(quantity)
VALUES(150);



-- HOME WORK 05

-- Part 1
-- Create new table actors_logging_table, that will have the following columns: log_id SERIAL,
-- actor_name VARCHARR, insertion_time TIMESTAMP

CREATE TABLE actors_logging_table(
	log_id SERIAL PRIMARY KEY,
	actor_name VARCHAR,
	insert_time TIMESTAMP
)



-- Create new trigger actor_insert_trigger, and bind it to the actors table.
-- Whenever a new actor is inserted, add new record/insertion
-- in the actors_logging_table with the correct data.


SELECT * FROM actors

CREATE OR REPLACE FUNCTION actor_insert_trigger_function()
RETURNS TRIGGER
AS $$
	BEGIN
		INSERT INTO actors_logging_table(actor_name,insert_time)
		VALUES(NEW.name,NOW());
		RETURN NEW;
	END;
$$ LANGUAGE PLPGSQL

CREATE TRIGGER actor_insert_trigger
AFTER INSERT ON actors
FOR EACH ROW
EXECUTE FUNCTION actor_insert_trigger_function()

INSERT INTO actors(actor_id,name,nationality,birth_year)
VALUES(12,'Bob Bob','American',1949)

SELECT * FROM actors_logging_table

-- Part 2

-- Create new trigger actors_delete_trigger and bind it to the table actors. 
-- Execute the trigger on DELETE, and whenever a row/record is deleted, 
-- RAISE NOTICE with the following message format 
-- 'Row with id: some_id, and actor with name: some_actor_name was deleted'
-- -> Example message: "Actor with id: 1, and with name John Doe was deleted."


CREATE OR REPLACE FUNCTION actor_delete_trigger_function()
RETURNS TRIGGER 
AS $$
	BEGIN
		RAISE NOTICE 'Row with id: % and actor with name: % was deleted', OLD.actor_id, OLD.name;
		RETURN NEW;
	END;
	
$$ LANGUAGE PLPGSQL


CREATE TRIGGER actor_delete_trigger
AFTER DELETE ON actors
FOR EACH ROW 
EXECUTE FUNCTION actor_delete_trigger_function()



DELETE FROM actors
WHERE actor_id = 12

-- PART 3 BONUS

-- Create a procedure for adding new Actor ( get inspiration from the procedure from the class )

SELECT * FROM actors


CREATE OR REPLACE PROCEDURE addActor(
	IN actor_name varchar(50),
	IN actor_nationality varchar(50),
	IN actor_birth_year INTEGER
)
AS $$
	BEGIN
		INSERT INTO actors(name,nationality,birth_year)
		VALUES(actor_name,actor_nationality,actor_birth_year);
		COMMIT;
	END;
$$ LANGUAGE PLPGSQL

CALL addActor('Jim Carry','American',1962)







