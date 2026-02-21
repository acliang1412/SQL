USE db_zoo;

IF OBJECT_ID('tbl_species', 'U') IS NOT NULL DROP TABLE tbl_species;
IF OBJECT_ID('tbl_specialist', 'U') IS NOT NULL DROP TABLE tbl_specialist;
IF OBJECT_ID('tbl_habitat', 'U') IS NOT NULL DROP TABLE tbl_habitat;
IF OBJECT_ID('tbl_nutrition', 'U') IS NOT NULL DROP TABLE tbl_nutrition;
IF OBJECT_ID('tbl_care', 'U') IS NOT NULL DROP TABLE tbl_care;
IF OBJECT_ID('tbl_order', 'U') IS NOT NULL DROP TABLE tbl_order;
IF OBJECT_ID('tbl_class', 'U') IS NOT NULL DROP TABLE tbl_class;
IF OBJECT_ID('tbl_animalia', 'U') IS NOT NULL DROP TABLE tbl_animalia;

CREATE TABLE tbl_animalia (
    animalia_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    animalia_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_class(
    class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
    class_type VARCHAR(50) NOT NULL
);

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
CREATE TABLE tbl_species (
   species_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
   species_name VARCHAR(50) NOT NULL,
   species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
   species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
   species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
   species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
   species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
   species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- Insert Parent Data
INSERT INTO tbl_animalia (animalia_type) VALUES ('vertebrate'), ('invertebrate');
INSERT INTO tbl_class (class_type) VALUES ('mammal'), ('reptile'), ('amphibian'), ('fish'), ('bird'), ('arachnid'), ('worm'), ('insect');
INSERT INTO tbl_order (order_type) VALUES ('carnivore'), ('herbivore'), ('omnivore');
INSERT INTO tbl_care (care_id, care_type, care_specialist) VALUES ('care_0', 'replace the straw', 1), ('care_1', 'clean the water', 2), ('care_2', 'feed the animal', 3), ('care_3', 'check the health', 4), ('care_4', 'check the habitat', 5), ('care_5', 'check the nutrition', 6), ('care_6', 'check the behavior', 7), ('care_7', 'check the reproduction', 8), ('care_8', 'check the growth', 9), ('care_9', 'check the lifespan', 10);
INSERT INTO tbl_nutrition (nutrition_type, nutrition_cost) VALUES ('raw fish', 1500), ('living rodents', 600), ('mixture of fruit and rice', 800), ('warm bottle of milk', 600), ('syringe fed broth', 600), ('lard and seed mix', 300), ('vitamins and marrow', 3500);
INSERT INTO tbl_habitat (habitat_type, habitat_cost) VALUES ('tundra', 40000), ('grassy knoll with trees', 12000), ('desert enclosure', 8000), ('wetlands', 22000), ('rainforest dome', 60000);
INSERT INTO tbl_specialist (specialist_fname, specialist_lname, specialist_contact) VALUES ('Alice','Johnson','alice.johnson@example.com'), ('Bob','Smith','bob.smith@example.com'), ('Carol','Davis','carol.davis@example.com'), ('David','Miller','david.miller@example.com'), ('Eve','Wilson','eve.wilson@example.com'), ('Frank','Moore','frank.moore@example.com'), ('Grace','Taylor','grace.taylor@example.com'), ('Heidi','Anderson','heidi.anderson@example.com'), ('Ivan','Thomas','ivan.thomas@example.com'), ('Judy','Jackson','judy.jackson@example.com');

-- Insert Child Data
INSERT INTO tbl_species 
    (species_name, species_animalia, species_class, species_order, species_nutrition, species_habitat, species_care)
    VALUES
    ('brown bear', 1, 100, 3, 2202, 5001, 'care_1'),
    ('jaguar', 1, 100, 1, 2200, 5004, 'care_4'),
    ('penguin', 1, 104, 3, 2200, 5000, 'care_6'),
    ('ghost bat', 1, 100, 3, 2204, 5004, 'care_2'),
    ('chicken', 1, 104, 2, 2205, 5001, 'care_0'),
    ('panda', 1, 100, 2, 2202, 5001, 'care_4'),
    ('bobcat', 1, 100, 3, 2201, 5001, 'care_5'),
    ('grey wolf', 1, 100, 1, 2201, 5001, 'care_4');
SELECT * FROM tbl_species;

SELECT a1.species_name, a2.animalia_type, a3.class_type, a4.order_type, a5.nutrition_type, a6.habitat_type, a7.care_type
FROM tbl_species a1
INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
INNER JOIN tbl_nutrition a5 ON a5.nutrition_id = a1.species_nutrition
INNER JOIN tbl_habitat a6 ON a6.habitat_id = a1.species_habitat
INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
WHERE species_name = 'brown bear';

