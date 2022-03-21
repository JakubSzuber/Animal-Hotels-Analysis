CREATE TABLE breeds
(
	breed_id SERIAL PRIMARY KEY NOT NULL,
	breed_group_name VARCHAR(20) NOT NULL,
	primary_breed VARCHAR(20) NOT NULL,
	secondary_breed VARCHAR(20) DEFAULT 'UNKNOWN'
)
