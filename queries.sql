/*Queries that provide answers to the questions from all projects.*/


/*Find all animals whose name ends in "mon".*/
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019.*/
SELECT name FROM  animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

/* List the name of all animals that are neutered and have less than 3 escape attempts.*/

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

/*List date of birth of all animals named either "Agumon" or "Pikachu". */

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Pikachu';

/*List name and escape attempts of animals that weigh more than 10.5kg */

SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;

/*Find all animals that are neutered. */

SELECT *  FROM animals WHERE neutered = TRUE;


/* Find all animals not named Gabumon.*/

SELECT *  FROM animals WHERE name <> 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
*/

SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <=17.3;


/* transaction */
/*  a transaction update the animals table by setting the species column to unspecified*/

BEGIN;


UPDATE animals SET species = 'unspecified';

ROLLBACK;


/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.*/

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

/* Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

/*delete all records in the animals table, then roll back the transaction. */
BEGIN;
DELETE FROM animals;
ROLLBACK;

/*if all records in the animals table still exist. */
SELECT * FROM animals;



BEGIN;
SAVEPOINT SP1

DELETE FROM animals where date_of_birth > '2022-01-01';
ROLLBACK TO SP1

BEGIN;

SAVEPOINT SP1

DELETE FROM animals where date_of_birth > '2022-01-01';
UPDATE animals SET weight_kg  = weight_kg * -1;

ROLLBACK TO SP1

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;


/*How many animals are there?*/
SELECT COUNT(*) FROM animals;


/*How many animals have never tried to escape?*/
SELECT count(*) FROM animals WHERE escape_attempts = 0;

/*What is the average weight of animals?*/

SELECT ROUND(AVG(weight_kg), 4) FROM animals;

/*Who escapes the most, neutered or not neutered animals?*/

SELECT MAX(escape_attempts), neutered FROM animals GROUP BY neutered;

/*What is the minimum and maximum weight of each type of animal?*/

SELECT MIN(weight_kg), species FROM animals GROUP BY species;

/*What is the average number of escape attempts per 
animal type of those born between 1990 and 2000?*/

SELECT 
DISTINCT
ROUND(AVG(escape_attempts), 4), species	
FROM animals 
GROUP BY species, date_of_birth 
HAVING date_of_birth >= '1990-01-01' 
AND date_of_birth <='2000-01-01';

-- What animals belong to Melody Pond?

SELECT ANIMALS.NAME
FROM ANIMALS
JOIN OWNERS ON ANIMALS.OWNERS_ID = OWNERS.ID
WHERE ANIMALS.OWNERS_ID =
		(SELECT ID
			FROM OWNERS
			WHERE FULL_NAME = 'Melody Pond');

-- List of all animals that are pokemon (their type is Pokemon).

SELECT ANIMALS.NAME
FROM ANIMALS
JOIN SPECIES ON ANIMALS.SPECIES_ID = SPECIES.ID
WHERE ANIMALS.SPECIES_ID =
		(SELECT ID
			FROM SPECIES
			WHERE NAME = 'Pokemon');

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT *
FROM ANIMALS
FULL JOIN OWNERS ON ANIMALS.OWNERS_ID = OWNERS.ID; 


-- How many animals are there per species?
SELECT SPECIES.NAME, 
COUNT(ANIMALS.NAME)
FROM ANIMALS
JOIN SPECIES ON ANIMALS.SPECIES_ID = SPECIES.ID
GROUP BY SPECIES.NAME; 

-- List all Digimon owned by Jennifer Orwell.
SELECT *
FROM ANIMALS
JOIN OWNERS ON ANIMALS.OWNERS_ID = OWNERS.ID 
WHERE OWNERS.FULL_NAME = 'Jennifer Orwell'
	AND ANIMALS.SPECIES_ID = 
		(SELECT ID
			FROM SPECIES 
			WHERE NAME = 'Digimon');

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT *
FROM ANIMALS
JOIN OWNERS ON ANIMALS.OWNERS_ID = OWNERS.ID 
WHERE OWNERS.FULL_NAME = 'Dean Winchester'
	AND ANIMALS.ESCAPE_ATTEMPTS = 0;

-- Who owns the most animals?

SELECT COUNT(OWNERS.ID),
	OWNERS.FULL_NAME
FROM ANIMALS
JOIN OWNERS ON ANIMALS.OWNERS_ID = OWNERS.ID
GROUP BY OWNERS.ID
ORDER BY COUNT DESC
LIMIT 1;