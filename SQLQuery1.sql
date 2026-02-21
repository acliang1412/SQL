USE db_zoo;

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	animalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_animalia
	(animalia_type) 
	VALUES 
	('vertebrate'),
	('invertebrate');
;
SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type) 
	VALUES 
	('mammal'),
	('reptile'),
	('amphibian'),
	('fish'),
	('bird'),
	('arachnid'),
	('worm'),
	('insect')
	;

SELECT * FROM tbl_class;

CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	order_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_care (
   care_id VARCHAR(50) PRIMARY KEY NOT NULL,
   care_type VARCHAR(50) NOT NULL,
   care_specialist INT NOT NULL
);

CREATE TABLE tbl_nutrition(
   nutrition_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
   nutrition_type VARCHAR(50) NOT NULL,
   nutrition_cost MONEY NOT NULL
);

CREATE TABLE tbl_habitat (
   habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
   habitat_type VARCHAR(50) NOT NULL,
   habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist (
   specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
   specialist_fname VARCHAR(50) NOT NULL,
   specialist_lname VARCHAR(50) NOT NULL,
   specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_order
	(order_type) 
	VALUES 
	('carnivore'),
	('herbivore'),
	('omnivore')
	;
SELECT * FROM tbl_order;

INSERT INTO tbl_care
	(care_id, care_type, care_specialist) 
	VALUES 
	('care_0', 'replace the straw', 1),
	('care_1', 'clean the water', 2),
	('care_2', 'feed the animal', 3),
	('care_3', 'check the health', 4),
	('care_4', 'check the habitat', 5),
	('care_5', 'check the nutrition', 6),
	('care_6', 'check the behavior', 7),
	('care_7', 'check the reproduction', 8),
	('care_8', 'check the growth', 9),
	('care_9', 'check the lifespan', 10)
	;

	SELECT * FROM tbl_care;

INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost) 
	VALUES 
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe fed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
	;
SELECT * FROM tbl_nutrition;