CREATE DATABASE IF NOT EXISTS first_example;
USE first_example;
CREATE TABLE person(
	person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    gender ENUM('M', 'F'),
    birth_data DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id));
    
    DESC PERSON;
    
    CREATE TABLE favorite_food(
		person_id SMALLINT UNSIGNED,
        food VARCHAR(20),
        CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
        CONSTRAINT fk_favorite_food_person_id FOREIGN KEY (person_id) REFERENCES person(person_id));
	
    DESC favorite_food;
    
    SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'first_example';
    
    INSERT INTO person VALUES ('2', 'João', 'Silva', 'M', '1979-08-21', 'Rua Tal', 'Cidade K', 'RJ', 'Brasil', '000001'),
		('3', 'Matheus', 'Silva', 'M', '1980-08-21', 'Rua Tal', 'Cidade L', 'RJ', 'Brasil', '000002'),
        ('4', 'Luis', 'Silva', 'M', '1981-08-21', 'Rua Tal', 'Cidade M', 'RJ', 'Brasil', '000003');
    
    SELECT * FROM person;
    
    DELETE FROM person WHERE person_id = 3 OR person_id = 4 OR person_id = 2;
    
    INSERT INTO favorite_food VALUES (1, 'Lasanha');
    
    INSERT INTO person VALUES ('5', 'João', 'Silva', 'M', '1979-08-21', 'Rua Tal', 'Cidade K', 'RJ', 'Brasil', '000001'),
		('6', 'Matheus', 'Silva', 'M', '1980-08-21', 'Rua Tal', 'Cidade L', 'RJ', 'Brasil', '000002');
        
    INSERT INTO favorite_food VALUES (5, 'Batata'),
									 (6, 'Feijão');
                                     
    SELECT * FROM favorite_food;