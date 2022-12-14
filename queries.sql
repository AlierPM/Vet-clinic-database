/*Queries that provide answers to the questions from all projects.*/
/*Find all animals whose name ends in "mon". */
SELECT
  *
FROM
  animals
WHERE
  name LIKE '%mon';
  /*List the name of all animals born between 2016 and 2019.*/
SELECT
  name
FROM
  animals
WHERE
  date_of_birth BETWEEN '2016-01-01'
  AND '2019-12-31';
  /*List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT
  name
FROM
  animals
WHERE
  neutered = 'true'
  AND escape_attempts < 3;
  /*List the date of birth of all animals named either "Agumon" or "Pikachu".*/
SELECT
  date_of_birth
FROM
  animals
WHERE
  name = 'Agumon'
  OR name = 'Pikachu';
  /*List name and escape attempts of all animals that weigh more than 10.5kg.*/
SELECT
  name,
  escape_attempts
FROM
  animals
WHERE
  weight_kg > 10.5;
  /*Find all animals that are neutered.*/
SELECT
  *
FROM
  animals
WHERE
  neutered = 'true';
  /*Find all animals not named Gabumon.*/
SELECT
  *
FROM
  animals
WHERE
  name <> 'Gabumon';
  /*Find all animals with a weight between 10.4kg and 17.3kg (including the animals 
                                                                    with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT
  *
FROM
  animals
WHERE
  weight_kg BETWEEN 10.4
  AND 17.3;
  /*Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.*/
  BEGIN;
UPDATE
  animals
SET
  species = 'unspecified';
SELECT
  *
FROM
  animals;
ROLLBACK;
SELECT
  *
FROM
  animals;
  /*Inside a transaction:
                                                                    Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
                                                                    Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
                                                                    Verify that change was made and persists after commit.*/
  BEGIN;
UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon';
UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;
SELECT
  *
FROM
  animals;
COMMIT;
SELECT
  *
FROM
  animals;
  /*Delete all records in the animals table, then roll back the transaction. After the rollback verify if all records in the table are still there. Then commit the transaction and verify that the records were deleted.*/
  BEGIN;
DELETE FROM
  animals;
SELECT
  *
FROM
  animals;
ROLLBACK;
SELECT
  *
FROM
  animals;
COMMIT;
SELECT
  *
FROM
  animals;
  /*Delete all animals born after Jan 1st, 2022.*/
DELETE FROM
  animals
WHERE
  date_of_birth > '2022-01-01';
  /* Write queries to answer the following questions/
                                                                    /*How many animals are there?*/
SELECT
  COUNT(*)
FROM
  animals;
  /*How many animals have never tried to escape?*/
SELECT
  COUNT(*)
FROM
  animals
WHERE
  escape_attempts = 0;
  /*What is the average weight of animals?*/
SELECT
  AVG(weight_kg)
FROM
  animals;
  /*Who escapes the most, neutered or not neutered animals?*/
SELECT
  COUNT (neutered),
  MAX(escape_attempts)
FROM
  animals;
  /*What is the minimum and maximum weight of each type of animal?*/
SELECT
  species,
  MIN(weight_kg),
  MAX(weight_kg)
FROM
  animals
GROUP BY
  species;
  /*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT
  species,
  AVG(escape_attempts)
FROM
  animals
WHERE
  date_of_birth BETWEEN '1990-01-01'
  AND '2000-12-31'
GROUP BY
  species;
  /*What animals belong to Melody Pond?*/
SELECT
  animals.name
FROM
  "animals"
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Melody Pond';
  /*List of all animals that are pokemon*/
SELECT
  animals.name
FROM
  "animals"
  INNER JOIN species ON animals.species_id = species.id
WHERE
  species.name = 'pokemon';
  /*List of all owners and their animals, remember to include those that don't own any animal.*/
SELECT
  owners.full_name,
  animals.name
FROM
  "owners"
  LEFT JOIN animals ON owners.id = animals.owner_id;
  /*How many animals are there per species?*/
SELECT
  species.name,
  COUNT(animals.species_id)
FROM
  "species"
  INNER JOIN animals ON species.id = animals.species_id
GROUP BY
  species.name;
  /*List all Digimon owned by Jennifer Orwell*/
SELECT
  animals.name
FROM
  "animals"
  INNER JOIN owners ON animals.owner_id = owners.id
  INNER JOIN species ON animals.species_id = species.id
WHERE
  owners.full_name = 'Jennifer Orwell'
  AND species.name = 'digimon';
  /*List all animals owned by Dean Winchester that haven't tried to escape.*/
SELECT
  animals.name
FROM
  "animals"
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;
  /*Who owns the most animals?*/
SELECT
  owners.full_name,
  COUNT(animals.owner_id)
FROM
  "owners"
  INNER JOIN animals ON owners.id = animals.owner_id
GROUP BY
  owners.full_name
ORDER BY
  COUNT(animals.owner_id) DESC
LIMIT
  1;
--QUERIES TO THE QUESTIONS:
  --Who was the last animal seen by William Tatcher?
SELECT
  animals.name
FROM
  "animals"
  INNER JOIN visits ON animals.id = visits.animals_id
WHERE
  visits.vets_id = 1
ORDER BY
  visits.date_of_visit DESC
LIMIT
  1;
--How many different animals did Stephanie Mendez see?
SELECT
  COUNT(DISTINCT animals.name)
FROM
  "animals"
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON visits.vets_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez';
--List all vets and their species, including vets with no species.
SELECT
  vets.name as vet_name,
  species.name as SPECIES_NAME
FROM
  species
  RIGHT JOIN specializations ON specializations.species_id = species.id
  RIGHT JOIN vets ON specializations.vets_id = vets.id;
--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT
  animals.name as animal_name,
  vets.name as vet_name,
  visits.date_of_visit
FROM
  "animals"
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON visits.vets_id = vets.id
WHERE
  vets.name = 'Stephanie Mendez'
  AND visits.date_of_visit BETWEEN '2020-04-01'
  AND '2020-08-30';
--What animal has the most visits to vets?
SELECT
  COUNT(animals.name),
  animals.name
FROM
  animals
  JOIN visits ON animals.id = visits.animals_id
  JOIN vets ON visits.vets_id = vets.id
GROUP BY
  animals.name
ORDER BY
  COUNT(animals.name) DESC
LIMIT
  1;
--Who was Maisy Smith's first visit?
SELECT
  animals.name,
  date_of_visit
FROM
  visits
  JOIN animals ON animals.id = visits.animals_id
  JOIN vets ON visits.vets_id = vets.id
WHERE
  vets.name = 'Maisy Smith'
ORDER BY
  date_of_visit
LIMIT
  1;
--Details for most recent visit: animal information, vet information, and date of visit.
SELECT
  animals.id as animal_id,
  animals.name as animal_name,
  vets.id as vet_id,
  vets.name as vet_name,
  date_of_visit
FROM
  visits
  JOIN animals ON animals.id = visits.animals_id
  JOIN vets ON visits.vets_id = vets.id
ORDER BY
  date_of_visit
LIMIT
  1;
--How many visits were with a vet that did not specialize in that animal's species?
SELECT
  count(animals.name)
FROM
  visits
  JOIN animals ON animals.id = visits.animals_id
  JOIN specializations ON specializations.vets_id = visits.vets_id
where
  animals.species_id <> specializations.species_id;
--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT
  species.name
FROM
  visits
  JOIN vets ON visits.vets_id = vets.id
  join animals on animals.id = visits.animals_id
  join species on species.id = animals.species_id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  animals_id,
  species.name
ORDER BY
  COUNT(animals_id) DESC
LIMIT
  1;