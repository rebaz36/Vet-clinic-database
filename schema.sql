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
