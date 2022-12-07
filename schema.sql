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