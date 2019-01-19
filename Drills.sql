USE [db_zoo]
GO

/*To access the drills on SQL Server:
	Step 1: Go into DQL server and open all the .sql files
	Step 2: Go to Build_db_zoo.sql and press Execute or "!"
	Step 3: Go to ExecuteBuildZoo.sql and press Execute or "!"
	Step 4: Go to Populate_db_zoo.sql and press Execute or "!"
	Step 5: Go to ExecutePopulateZoo.sql and press Execute or "!"
	Step 6: Go to Drills.sql (THIS PAGE) and press Execute or "!"
*/

/* DRILL 1 */
	SELECT
		dbo.tbl_species.species_name as 'Name:', animalHabitat.habitat_type as 'Habitat:'
		FROM tbl_species 
		INNER JOIN tbl_habitat animalHabitat ON animalHabitat.habitat_id = dbo.tbl_species.species_habitat

	;
	


/* DRILL 2*/
	SELECT
		dbo.tbl_species.species_name as 'Name:', dbo.tbl_species.species_order as 'Number:', dbo.tbl_order.order_type as 'Order:'
		FROM tbl_species 
		INNER JOIN dbo.tbl_order ON dbo.tbl_order.order_id = dbo.tbl_species.species_order
		WHERE species_order = 3
	;

/* DRILL 3*/
	SELECT
		dbo.tbl_species.species_name as 'Name:', dbo.tbl_nutrition.nutrition_type as 'Diet:', dbo.tbl_nutrition.nutrition_cost as 'Cost:'
		FROM tbl_species
		INNER JOIN dbo.tbl_nutrition ON dbo.tbl_nutrition.nutrition_id = dbo.tbl_species.species_nutrition
		WHERE nutrition_cost <= 600.00	
	; 
	
/* DRILL 4*/
	SELECT
		dbo.tbl_species.species_name as 'Name:', dbo.tbl_species.species_nutrition as 'Number:'
		FROM tbl_species
		INNER JOIN dbo.tbl_nutrition ON dbo.tbl_nutrition.nutrition_id = dbo.tbl_species.species_nutrition
		WHERE nutrition_id >= 2202 AND nutrition_id <= 2206
	;

/* DRILL 5*/
	SELECT
		dbo.tbl_species.species_name as 'Species Name:', dbo.tbl_nutrition.nutrition_type as 'Nutrition Type:'
		FROM tbl_species
		INNER JOIN dbo.tbl_nutrition ON dbo.tbl_nutrition.nutrition_id = dbo.tbl_species.species_nutrition
	;

/* DRILL 6*/
	SELECT
		dbo.tbl_species.species_name as 'Species Name:', dbo.tbl_specialist.specialist_fname as 'Specialist First Name:', 
		dbo.tbl_specialist.specialist_lname as 'Specialist Last Name:', tbl_specialist.specialist_contact as 'Contact:'
		FROM tbl_specialist
		INNER JOIN dbo.tbl_care ON dbo.tbl_specialist.specialist_id = dbo.tbl_care.care_specialist
		INNER JOIN dbo.tbl_species ON dbo.tbl_care.care_id = dbo.tbl_species.species_care
		WHERE species_name = 'penguin'
	;

/* DRILL 7*/
/*
	CREATE TABLE tbl_relatives (
	relatives_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	first_relative VARCHAR(50) NOT NULL,
	second_relative VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_dimorphism (
	dimorphism_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	weight_male FLOAT NOT NULL,
	weight_female FLOAT NOT NULL
	);

	INSERT INTO tbl_relatives
		(relatives_id, first_relative, second_relative)
		VALUES 
		('brown bear', 'polar bear', 'black bear'),
		('jaguar', 'leopard', 'cheetah'),
		('penguin', 'puffin', 'albatross'),
		('ghost bat', 'flying foxes', 'hog-nosed bat'),
		('chicken', 'goose', 'duck'),
		('panda', 'koala', 'sun bear'),
		('bobcat', 'lynx', 'cougar'),
		('grey wolf', 'coyote', 'fox')
	;
	SELECT * FROM tbl_relatives;

	INSERT INTO tbl_dimorphism
		(dimorphism_id, weight_male, weight_female)
		VALUES 
		('brown bear', 500, 300),
		('jaguar', 200, 150),
		('penguin', 50, 50),
		('ghost bat', 0.4, 0.3),
		('chicken', 1.6, 2.4),
		('panda', 200, 250),
		('bobcat', 19, 19),
		('grey wolf', 130, 100)
	;
	SELECT * FROM tbl_relatives;
*/
