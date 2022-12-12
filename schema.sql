/* Database schema to keep the structure of entire database. */

/* create database */

CREATE DATABASE vet_clinic;

/* navigate to the database */

-- \c vet_clinic

/* Create table animals. */

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

/* section 1 step 1 */

ALTER TABLE animals ADD COLUMN species VARCHAR(255);


/* Project part 3 */

/* section 1 step 1 */

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  age INTEGER
);

/* section 1 step 2 */

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

/* section 1 step 3 */

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD COLUMN owner_id INTEGER;

/* project part 4 */

/* step 1 */

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INTEGER,
  date_of_graduation DATE
);

/* step 2 */

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  FOREIGN KEY (species_id) REFERENCES species(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

--

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Adding indexes to the followings to help us optimize the database in terms of response time
CREATE INDEX animals_desc ON visits(animal_id DESC);
CREATE INDEX vets_id_desc ON visits(vets_id DESC);
CREATE INDEX email_desc ON owners(email DESC);