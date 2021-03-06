/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
  );

ALTER TABLE animals ADD COLUMN species VARCHAR(50);


-- Create a table named owners with the following columns
CREATE TABLE OWNERS(ID SERIAL PRIMARY KEY NOT NULL,
FULL_NAME VARCHAR(60) NOT NULL,
AGE int NOT NULL)

-- Create a table named species with the following columns
CREATE TABLE SPECIES(ID SERIAL PRIMARY KEY NOT NULL,
NAME VARCHAR(60) NOT NULL)

-- Modify animals table:
 -- Remove column species

ALTER TABLE ANIMALS
DROP COLUMN SPECIES 

-- Add column species_id which is a foreign key referencing species table

ALTER TABLE ANIMALS ADD COLUMN SPECIES_ID int
ALTER TABLE ANIMALS ADD CONSTRAINT CONSTRAINT_FK
FOREIGN KEY (SPECIES_ID) REFERENCES SPECIES(ID) 
ON DELETE CASCADE 
ON UPDATE CASCADE 

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE ANIMALS ADD COLUMN OWNERS_ID int
ALTER TABLE ANIMALS ADD CONSTRAINT CONSTRAINT_FKO
FOREIGN KEY (OWNERS_ID) REFERENCES OWNERS(ID) 
ON DELETE CASCADE 
ON UPDATE CASCADE

-- Create a table named vets with the following columns:

CREATE TABLE VETS (
ID SERIAL PRIMARY KEY NOT NULL,
NAME VARCHAR(100) NOT NULL,
AGE INT NOT NULL,
DATE_OF_GRADUATION DATE NOT NULL
)

CREATE TABLE specializations (
  VET_ID INT NOT NULL,
  SPECIES_ID INT NOT NULL,
  FOREIGN KEY (VET_ID) REFERENCES OWNERS(ID),
  FOREIGN KEY (SPECIES_SID) REFERENCES SPECIES(ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
 
)

CREATE TABLE VISITS (
	ANIMAL_ID INT NOT NULL,
	VET_ID INT NOT NULL,
	FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMALS(ID),
	FOREIGN KEY(VET_ID) REFERENCES VETS(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
	
)