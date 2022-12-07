/*Queries that provide answers to the questions from all projects.*/

/* project 1 */

/* Find all animals whose name ends in "mon". */
SELECT * from animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu".*/
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * from animals WHERE neutered = true;

/* Find all animals not named Gabumon. */
SELECT * from animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* project 2 */

/* section 2 */

/* step 1 */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

/* step 2 */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * from animals;

/* step 3 */
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * from animals;

/* step 4 */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// */

/* section 3 */

/* step 1*/
SELECT COUNT(*) from animals;

/* step 2 */
SELECT COUNT(*) from animals WHERE escape_attempts = 0;

/* step 3 */
SELECT AVG(weight_kg) from animals;

/* step 4 */
SELECT neutered, MAX(escape_attempts) from animals GROUP BY neutered;

/* step 5 */
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;

/* step 6 */
SELECT species, AVG(escape_attempts) from animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* project 3 */ 

-- Write queries (using JOIN) to answer the following questions:

-- step 1
-- What animals belong to Melody Pond?
SELECT * from animals JOIN owners ON animals.id = owners.id WHERE owners.full_name = 'Melody Pond';

-- step 2
-- List of all animals that are pokemon (their type is Pokemon).
SELECT * from animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- step 3
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT * from owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- step 4
-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) from animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- step 5
-- List all Digimon owned by Jennifer Orwell.
SELECT * from animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- step 6
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- step 7
-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.owner_id) from animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.owner_id) DESC LIMIT 1;