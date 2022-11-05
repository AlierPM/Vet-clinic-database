/* Populate database with sample data. */
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Gabumon', '2018-11-14', 2, TRUE, 8);
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Charmander', '2020-02-08', 0, FALSE, 11);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Plantmon', '2021-11-15', 2, TRUE, 5.7);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Squirtle', '1993-04-02', 3, FALSE, 12.13);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Angemon', '2005-06-12', 1, TRUE, 45);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Boarmon', '2005-06-07', 7, FALSE, 20.4);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO
  "animals" (
    "name",
    "date_of_birth",
    "escape_attempts",
    "neutered",
    "weight_kg"
  )
VALUES
  ('Ditto', '2022-05-14', 4, TRUE, 22);
  /* insert the following data into the owners table*/
INSERT INTO
  owners (full_name, age)
VALUES
  ('Sam Smith', 34);
INSERT INTO
  owners (full_name, age)
VALUES
  ('Jennifer Orwell', 19);
INSERT INTO
  owners (full_name, age)
VALUES
  ('Bob', 45);
INSERT INTO
  owners (full_name, age)
VALUES
  ('Melody Pond', 77);
INSERT INTO
  owners (full_name, age)
VALUES
  ('Dean Winchester', 14);
INSERT INTO
  owners (full_name, age)
VALUES
  ('Jodie Whittaker', 38);
  /* insert the following data into the species table*/
INSERT INTO
  species (name)
VALUES
  ('Pokemon');
INSERT INTO
  species (name)
VALUES
  ('Digimon');
UPDATE
  animals
SET
  species_id = 1
WHERE
  name LIKE '%mon';
UPDATE
  animals
SET
  species_id = 2
WHERE
  name NOT LIKE '%mon';
UPDATE
  animals
SET
  owner_id = 1
WHERE
  name = 'Agumon';
UPDATE
  animals
SET
  owner_id = 2
WHERE
  name = 'Gabumon'
  OR name = 'Pikachu';
UPDATE
  animals
SET
  owner_id = 3
WHERE
  name = 'Devimon'
  OR name = 'Plantmon';
UPDATE
  animals
SET
  owner_id = 4
WHERE
  name = 'Charmander'
  OR name = 'Squirtle'
  OR name = 'Blossom';
UPDATE
  animals
SET
  owner_id = 5
WHERE
  name = 'Angemon'
  OR name = 'Boarmon';
  /* insert the following data into the vets table*/
INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23');
INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('Maisy Smith', 26, '2019-01-17');
INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO
  vets (name, age, date_of_graduation)
VALUES
  ('Jack Harkness', 38, '2008-06-08');
  /*Insert the following data for specializations*/
INSERT INTO
  specializations (species_id, vets_id)
VALUES
  (1, 1),
  (2, 3),
  (1, 3),
  (2, 4);
  /*Insert the following data for visits*/
  /*Agumon visited William Tatcher on May 24th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (1, 1, '2020-05-24');
  /*Agumon visited Stephanie Mendez on Jul 22th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (1, 3, '2020-07-22');
  /*Gabumon visited Jack Harkness on Feb 2nd, 2021.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (2, 4, '2021-02-02');
  /*Pikachu visited Maisy Smith on Jan 5th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (3, 2, '2020-01-05');
  /*Pikachu visited Maisy Smith on Mar 8th, 2020*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (3, 2, '2020-03-08');
  /*Pikachu visited Maisy Smith on May 14th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (3, 2, '2020-05-14');
  /*Devimon visited Stephanie Mendez on May 4th, 2021.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (4, 3, '2021-05-04');
  /*Charmander visited Jack Harkness on Feb 24th, 2021.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (5, 4, '2021-02-24');
  /*Plantmon visited Maisy Smith on Dec 21st, 2019.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (6, 2, '2019-12-21');
  /*Plantmon visited William Tatcher on Aug 10th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (6, 1, '2020-08-10');
  /*Plantmon visited Maisy Smith on Apr 7th, 2021.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (6, 2, '2021-04-07');
  /*Squirtle visited Stephanie Mendez on Sep 29th, 2019.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (7, 3, '2019-09-29');
  /*Angemon visited Jack Harkness on Oct 3rd, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (8, 4, '2020-10-03');
  /*Angemon visited Jack Harkness on Nov 4th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (8, 4, '2020-11-04');
  /*Boarmon visited Maisy Smith on Jan 24th, 2019.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (9, 2, '2019-01-24');
  /*Boarmon visited Maisy Smith on May 15th, 2019.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (9, 2, '2019-05-15');
  /*Boarmon visited Maisy Smith on Feb 27th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (9, 2, '2020-02-27');
  /*Boarmon visited Maisy Smith on Aug 3rd, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (9, 2, '2020-08-03');
  /*Blossom visited Stephanie Mendez on May 24th, 2020.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (10, 3, '2020-05-24');
  /*Blossom visited William Tatcher on Jan 11th, 2021.*/
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES
  (10, 1, '2021-01-11');