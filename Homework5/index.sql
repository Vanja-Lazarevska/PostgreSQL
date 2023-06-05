-- PART 1 
-- Create new table acctors_logging_table that will have the following columns: log_id SERIAL, actors_name VARCHAR, insertion_time TIMESTAMP
CREATE TABLE actors_logging_table (
	log_id SERIAL,
	actor_name VARCHAR(50),
	insertion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

SELECT * FROM actors_logging_table

-- Create new trigger actor_insert_trigger, and bind it to the actors table. Whenever a new actor is inserted, add new record/insertion in the actors_logging_table with the correct data.
CREATE OR REPLACE FUNCTION actor_insert_trigger_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN 

INSERT INTO actors_logging_table(actor_name)
VALUES(NEW.name);
RETURN NEW;
END $$

CREATE TRIGGER acctor_insert_trigger 
AFTER INSERT ON actors
FOR EACH ROW
EXECUTE FUNCTION actor_insert_trigger_function()

INSERT INTO actors(actor_id, name, nationality, birth_year)
VALUES (12,'Tom Hanks','American', 1941)

SELECT * FROM actors
SELECT * FROM actors_logging_table


-- PART 2 
-- Create new trigger actors_delete_trigger and bind it to the table acotrs. Execute the trigger on DELETE, and whenever a row/record is deleted, RAISE NOTICE with the following message format 'Row with id: some_id, and actor with name: some_actor_name was deleted' -> Example message: 'Actor with id: 1, and with name: John Doe was deleted.'
CREATE OR REPLACE FUNCTION actors_delete_trigger_function()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$

BEGIN
RAISE NOTICE 'Row with id: %, and acotr with name: % was deleted.', OLD.actor_id, OLD.name;

RETURN OLD;
END$$

CREATE TRIGGER actors_delete_trigger
BEFORE DELETE ON actors
FOR EACH ROW
EXECUTE FUNCTION actors_delete_trigger_function()

DELETE FROM actors 
WHERE actor_id = 11


-- PART 3 BONUS 
-- Create a procedure for adding new actor (get inspiration from the procedure from the class)
CREATE PROCEDURE Adding_new_actor (
	IN actorid INTEGER,
	IN actorname VARCHAR(100),
	IN actornationality VARCHAR(50),
	IN actorbirth_year INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO actors(actor_id, name, nationality, birth_year)
VALUES(actorid, actorname, actornationality, actorbirth_year);
COMMIT;
END $$

CALL Adding_new_actor(13, 'Penelope Cruz', 'Spanish', 1974)

SELECT * FROM actors