CREATE TABLE hotel_2
(
	animal_id SERIAL PRIMARY KEY NOT NULL,
	species_id SERIAL NOT NULL,
	FOREIGN KEY (species_id) REFERENCES species(species_id),
	breed_id SERIAL NOT NULL,
	FOREIGN KEY (breed_id) REFERENCES breeds(breed_id),
	sex CHAR(1) NOT NULL,
	years_old SMALLINT NOT NULL,
	months_old SMALLINT NOT NULL,
	color_group VARCHAR(2) NOT NULL,
	primary_color VARCHAR(11) NOT NULL,
	secondary_color VARCHAR(5),
	animal_condition VARCHAR(6) NOT NULL,
	animal_size VARCHAR(5) NOT NULL,
	born_date DATE NOT NULL,
	arrival_time TIME NOT NULL,
	arrival_date DATE NOT NULL,
	planning_departure_date DATE NOT NULL
)
