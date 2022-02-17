/* Populate database with sample data. */
INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
        1, 
        'Agumon',
        '2020-02-03',
        0,
        TRUE,
        10.23
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
    2, 
    'Gabumon',
    '2018-11-15',
    2,
    TRUE,
    8
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    3,
    'Pikachu',
    '2021-01-7',
    1,
    FALSE,
    15.08
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    4,
    'Devimon',
    '2017-05-12',
    5,
    TRUE,
    11
);

INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(5, 'Charmander', '2020-02-08', 0, FALSE, 11);


INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(6, 'Plantmon', '2022-11-15', 2, TRUE, 5.7);
INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(7, 'Squirtle', '1993-04-02', 3, FALSE, 12.13);

INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(8, 'Angemon', '2005-06-12', 1, TRUE, 45);


INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(9, 'Boarmon', '2005-07-07', 7, TRUE, 20.4);

INSERT INTO ANIMALS(
	ID,
	NAME,
	DATE_OF_BIRTH,
	ESCAPE_ATTEMPTS,
	NEUTERED,
	WEIGHT_KG)
VALUES(10, 'Blossom', '1998-10-13', 3, TRUE, 17);


-- Insert the following data into the owners table:
INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Sam Smith',
  34
)

INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Jennifer Orwell',
  19
)

INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Bob',
  45
)

INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Melody Pond',
  77
)

INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Dean Winchester',
  14
)

INSERT INTO owners (
   full_name,
   age
) VALUES (
  'Jodie Winchester',
  38
)


-- Insert the following data into the species table
INSERT INTO species (
  name
) VALUES (
  'Pokemon'
)


INSERT INTO species (
  name
) VALUES (
  'Digimon'
)


-- Modify your inserted animals so it includes the species_id value

UPDATE ANIMALS
SET SPECIES_ID = (SELECT ID FROM SPECIES WHERE NAME = 'Digimon') 
WHERE NAME LIKE '%mon'

UPDATE ANIMALS
SET SPECIES_ID = (SELECT ID FROM SPECIES WHERE NAME = 'Pokemon') 
WHERE SPECIES_ID IS NULL

-- Modify your inserted animals to include owner information (owner_id)

-- Sam Smith owns Agumon
UPDATE ANIMALS
SET OWNERS_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Sam Smith')
WHERE NAME = 'Agumon' 

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE ANIMALS
SET OWNERS_ID = 
(SELECT ID FROM OWNERS WHERE FULL_NAME = 'Jennifer Orwell')
WHERE NAME = 'Gabumon'
OR NAME = 'Pikachu' 

-- Bob owns Devimon and Plantmon.
UPDATE ANIMALS
SET OWNERS_ID = (SELECT ID FROM OWNERS WHERE FULL_NAME = 'Bob owns')
WHERE NAME = 'Devimon'
OR NAME = 'Plantmon' 
	
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE ANIMALS
SET OWNERS_ID = 
(SELECT ID FROM OWNERS WHERE FULL_NAME = 'Melody Pond')
WHERE NAME = 'Charmander'
OR NAME = 'Squirtle'
OR NAME = 'Blossom' 
	
-- Dean Winchester owns Angemon and Boarmon.
UPDATE ANIMALS
SET OWNERS_ID = 
(SELECT ID FROM OWNERS WHERE FULL_NAME = 'Dean Winchester')
WHERE NAME = 'Angemon'
OR NAME = 'Boarmon'
