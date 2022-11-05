/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species VARCHAR(255)
);
ALTER TABLE
  "animals"
ADD
  species varchar(255);
  /*create a table named  owners*/
  CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
  );
  /*create a table named species*/
  CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255)
  );
  /*modify animals table*/
ALTER TABLE
  animals
ADD
  PRIMARY KEY (id);
ALTER TABLE
  animals DROP COLUMN species;
ALTER TABLE
  animals
ADD
  species_id BIGINT;
ALTER TABLE
  animals
ADD
  CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE;
ALTER TABLE
  animals
ADD
  COLUMN owner_id BIGINT;
ALTER TABLE
  animals
ADD
  CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE;
  /*Create a table named vets with the following columns*/
  CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
  );
  /*Create a table named specializations with the following columns*/
  create table specializations (
    species_id INT REFERENCES species (id),
    vets_id INT REFERENCES vets (id)
  );
  /*Create a table named visits with the following columns*/
  CREATE TABLE visits (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    animal_id BIGINT,
    vet_id BIGINT,
    date_of_visit DATE,
    CONSTRAINT fk_animal_id FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE,
    CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE
  );