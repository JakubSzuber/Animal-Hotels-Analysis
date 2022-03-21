CREATE TABLE species
(
    species_id SERIAL PRIMARY KEY NOT NULL,
	species_name CHAR(3) NOT NULL,
	rules_for_species TEXT NOT NULL
)
