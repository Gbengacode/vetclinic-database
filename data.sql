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



-- insert the following data for vets
INSERT INTO VETS(
  NAME, 
  AGE,
  DATE_OF_GRADUATION
)
 VALUES
 (
	 'Vet William Tatcher',
	 45, 
	 '2000-4-23'
 
 );
 
 
 INSERT INTO VETS(
  NAME, 
  AGE,
  DATE_OF_GRADUATION
)
 VALUES
 (
	 'Vet Maisy Smith',
	 26, 
	 '2019-01-17'
 
 );
 
 
 
 INSERT INTO VETS(
  NAME, 
  AGE,
  DATE_OF_GRADUATION
)
 VALUES
 (
	 'Vet Stephanie Mendez',
	 64, 
	 '1981-05-04'
 
 );
 
  INSERT INTO VETS(
  NAME, 
  AGE,
  DATE_OF_GRADUATION
)
 VALUES
 (
	 'Vet Jack Harkness',
	 38, 
	 '2008-06-08'
 
 );

-- Insert the following data for specialties

 INSERT INTO SPECIALIZATIONS (
 VET_ID,
 SPECIES_ID
)
VALUES (
 (SELECT ID FROM VETS WHERE NAME = 'Vet William Tatcher'),
 (SELECT ID FROM SPECIES WHERE NAME = 'Pokemon')
);

INSERT INTO SPECIALIZATIONS (
 VET_ID,
 SPECIES_ID
)
VALUES (
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 (SELECT ID FROM SPECIES WHERE NAME = 'Pokemon')
);

-- Insert the following data for specialties:

INSERT INTO SPECIALIZATIONS (
 VET_ID,
 SPECIES_ID
)
VALUES (
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 (SELECT ID FROM SPECIES WHERE NAME = 'Digimon')
);

INSERT INTO SPECIALIZATIONS (
 VET_ID,
 SPECIES_ID
)
VALUES (
 (SELECT ID FROM VETS WHERE NAME = 'Vet Jack Harkness'),
 (SELECT ID FROM SPECIES WHERE NAME = 'Digimon')
);





-- Insert the following data for visits

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Agumon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet William Tatcher'),
 '2020-05-24'
)

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Agumon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 '2020-07-22'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Gabumon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Jack Harkness'),
 '2021-02-02'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-01-05'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-03-08'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-05-14'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Devimon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 '2021-05-04'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Charmander'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Jack Harkness'),
 '2021-02-24'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Plantmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2019-12-21'
);



INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Plantmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet William Tatcher'),
 '2020-08-10'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Plantmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-04-07'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Angemon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Jack Harkness'),
 '2020-10-03'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Angemon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Jack Harkness'),
 '2020-11-04'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Squirtle'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 '2020-04-07'
);



INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Boarmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2019-01-24'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Boarmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2019-05-15'
);


INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Boarmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-02-27'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Boarmon'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Maisy Smith'),
 '2020-08-03'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Blossom'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet Stephanie Mendez'),
 '2020-05-24'
);

INSERT INTO VISITS (
  ANIMAL_ID, 
  VET_ID,
  VISITED_DATE
)
VALUES 
(
 (SELECT ID FROM ANIMALS WHERE NAME = 'Blossom'),
 (SELECT ID FROM VETS WHERE NAME = 'Vet William Tatcher'),
 '2021-01-11'
);





