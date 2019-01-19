/* Build the database for the last drill*/
USE master
GO
DROP DATABASE db_extra
GO
CREATE DATABASE db_extra
GO
USE db_extra
GO
/*EXEC [dbo].[FinalDrill]*/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

EXEC [dbo].[FinalDrill]

BEGIN

	WHILE EXISTS(select * from sys.databases where name='db_extra')
	BEGIN
		DECLARE @SQL varchar(max)
		SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
		FROM MASTER.sys.sysprocesses
		WHERE DBId = DB_ID(N'db_extra') AND SPId <> @@SPId
		EXEC(@SQL)
		DROP DATABASE [db_extra]
	END

	CREATE DATABASE db_extra

END

GO

USE [db_extra]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE master
GO
EXEC [dbo].[FinalDrill]
*/

BEGIN
/*Populate the databases*/

	CREATE TABLE tbl_relatives (
	relatives_id VARCHAR(50) PRIMARY KEY NOT NULL,
	first_relative VARCHAR(50) NOT NULL,
	second_relative VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_dimorphism (
	dimorphism_id VARCHAR(50) PRIMARY KEY NOT NULL,
	weight_male FLOAT NOT NULL,
	weight_female FLOAT NOT NULL
	);

	CREATE TABLE given_animal (
		animal_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		animal_name VARCHAR(50) NOT NULL,
		animal_relatives VARCHAR(50) NOT NULL CONSTRAINT fk_relatives_id FOREIGN KEY REFERENCES tbl_relatives(relatives_id) ON UPDATE CASCADE ON DELETE CASCADE,
		animal_dimorhpism VARCHAR(50) NOT NULL CONSTRAINT fk_dimorphism_id FOREIGN KEY REFERENCES tbl_dimorphism(dimorphism_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	INSERT INTO tbl_relatives
		(relatives_id, first_relative, second_relative)
		VALUES 
		('large bear', 'polar bear', 'black bear'),
		('big cat', 'leopard', 'cheetah'),
		('large bird', 'puffin', 'albatross'),
		('bat', 'flying foxes', 'hog-nosed bat'),
		('land bird', 'goose', 'duck'),
		('small bear', 'koala', 'sun bear'),
		('large dog', 'coyote', 'fox')
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
	SELECT * FROM tbl_dimorphism;

	INSERT INTO given_animal
		(animal_name, animal_relatives, animal_dimorhpism)
		VALUES
		('brown bear', 'large bear', 'brown bear'),
		('jaguar', 'big cat', 'jaguar'),
		('penguin', 'large bird', 'penguin'),
		('ghost bat', 'bat', 'ghost bat'),
		('chicken', 'land bird', 'chicken'),
		('panda', 'small bear', 'panda'),
		('bobcat', 'big cat', 'bobcat'),
		('grey wolf', 'large dog', 'grey wolf')
	;
	SELECT * FROM given_animal;

END
GO