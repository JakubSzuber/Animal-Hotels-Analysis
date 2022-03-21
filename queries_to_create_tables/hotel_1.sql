CREATE TABLE hotel_1
(
    animal_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
	born_date DATE NOT NULL,
	owner_info VARCHAR(40) NOT NULL DEFAULT 'Stray',
	vaccinated BOOLEAN NOT NULL,
	color VARCHAR(30) NOT NULL,
	species_id SERIAL NOT NULL,
	FOREIGN KEY (species_id) REFERENCES species(species_id),
	age VARCHAR(20) NOT NULL,
	sex VARCHAR(6) NOT NULL,
	room_id SERIAL NOT NULL,
	FOREIGN KEY (room_id) REFERENCES rooms(room_id),
	arrival_date DATE NOT NULL,
	planning_departure_date DATE,
	aggressive BOOLEAN NOT NULL
)
