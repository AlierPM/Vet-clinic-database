/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id  BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species VARCHAR(255)
  );
  
  
ALTER TABLE animals ADD species varchar(255);




