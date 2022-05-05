----------------------------------------------------------------------------Queries-------------------------------------------------------------------------------------

/*
	QUERIES FOR TABLE hotel_1 (and its relations)
*/
--Select number of animals in each color (prdered by animals' color)
SELECT
	color
	, COUNT(color)
FROM hotel_1
GROUP BY color
ORDER BY color;

--Select most basic information about first ten animals (ordered by animals' id)
SELECT
	h.animal_id
	, h.name
	, h.sex
	, h.age
	, s.species_name
FROM hotel_1 as h
INNER JOIN species AS s ON s.species_id = h.species_id
ORDER BY h.animal_id
LIMIT 11;

--Select which are working days for driver whose departures animals from the hotel (ordered by departure date)
SELECT
	DISTINCT(planning_departure_date) AS "driver working days" 
FROM hotel_1
ORDER BY "driver working days";

--Select animals which name starts with letter "b"
SELECT
	name
FROM hotel_1
WHERE name ILIKE 'b%';

--Select information about all animal owners in sepearted columns (ordered by owners' id)
SELECT
	animal_id
	, name
	, REVERSE(SUBSTRING(REVERSE(owner_info) FROM POSITION(' ' IN REVERSE(owner_info)) FOR 20)) AS "owner full name"
	, RIGHT(owner_info, 12) AS "owner phone number"
FROM hotel_1
ORDER BY name;

--Select all columns from table hotel_1 and all significant colums from tables which are in relation with table hotel_1 (orderd by animals' id)
SELECT
	*
	, s.species_name
	, s.rules_for_species
	, r.room_type
	, r.room_floor_num
FROM hotel_1 as h
INNER JOIN species AS s ON s.species_id = h.species_id
INNER JOIN rooms AS r ON r.room_id = h.room_id
ORDER BY h.animal_id DESC;

--Select arrival and departure dates of each animal without any NULL cells (ordered by arrival date)
SELECT
	animal_id
	, name
	, arrival_date
	, COALESCE(CAST(planning_departure_date AS VARCHAR), 'unknown yet') AS "planning_departure_date"
FROM hotel_1
ORDER BY arrival_date;

/*
	Select some information about each animal and duration of stay for all animals, these animals that are currently at hotel for sure and these 
	which have planning departure date - could be at hotel (orderd by animls's id)
*/
SELECT
	animal_id
	, name
	, CASE
		WHEN planning_departure_date IS NULL THEN 'yes'
		ELSE 'unknown'
	END AS "currently at hotel"
	, COALESCE(age(planning_departure_date, arrival_date), age(NOW(), arrival_date)) AS "stay duration"
FROM hotel_1
ORDER BY animal_id;

--Select information about owners, whose animals is not vaccinated and aren't old, in order to contact them
SELECT
	REVERSE(SUBSTRING(REVERSE(owner_info) FROM POSITION(' ' IN REVERSE(owner_info)) FOR 20)) AS "owner full name"
	, RIGHT(owner_info, 12) AS "owner phone number"
FROM hotel_1
WHERE vaccinated = (SELECT vaccinated WHERE vaccinated = 'false' AND CAST(age AS INTERVAL) < '12 years');

--Query which update age of each animal to the actual value
UPDATE hotel_1
SET age = SUBSTRING(CAST(AGE(NOW(), born_date) AS VARCHAR) FROM 0 FOR POSITION('ns' IN CAST(age AS VARCHAR))+2);


/*
	QUERIES FOR TABLE hotel_2 (and its relations)
*/
--Select all types of primary and secondary color for each color group (orderd by color group)
SELECT
	DISTINCT color_group, primary_color, secondary_color
FROM hotel_2
ORDER BY color_group;

--Select most basic information about first ten animals with using significant colums from tables which are in relation with table hotel_1 (ordered by animals' id)
SELECT
	h.animal_id
	, s.species_name
	, b.breed_group_name
	, h.sex
	, h.years_old
	, h.months_old
	, h.animal_condition
FROM hotel_2 AS h
INNER JOIN species AS s ON s.species_id = h.species_id
INNER JOIN breeds AS b ON b.breed_id = h.breed_id
ORDER BY h.animal_id
LIMIT 11;

--Select all columns from table hotel_2 and all significant colums from tables which are in relation with table hotel_1 (orderd by animals' id)
SELECT
	*
	, s.species_name
	, s.rules_for_species
	, b.breed_group_name
	, b.primary_breed
	, b.secondary_breed
FROM hotel_2 as h
INNER JOIN species AS s ON s.species_id = h.species_id
INNER JOIN breeds AS b ON b.breed_id = h.breed_id
ORDER BY h.animal_id DESC;

--Select how long is planning time for be in hotel for each animal (orderd by animals' id)
SELECT
	animal_id
	, arrival_time
	, arrival_date
	, planning_departure_date
	, AGE(planning_departure_date, arrival_date) AS "time_of_visit"
FROM hotel_2
ORDER BY animal_id;

--Query which update age of each animal to the actual value
UPDATE hotel_2
	SET 
	years_old = CAST(SUBSTRING(CAST(AGE(NOW(), born_date) AS VARCHAR) FROM 1 FOR POSITION(' ' IN CAST(AGE(NOW(), born_date) AS VARCHAR))-1) AS INT)
	, months_old = CAST(TRIM(SUBSTRING(CAST(AGE(NOW(), born_date) AS VARCHAR) FROM POSITION('rs ' IN CAST(AGE(NOW(), born_date) AS VARCHAR))+3 FOR 2)) AS INT);


/*
	QUERIES FOR BOTH MOST IMPORTANT TABLES - hotel_1 and hotel_2 (and their relations):
*/
--Select columns from both main tables and connect them to each other (select as many common colums from both tables as it's possible) (ordered by aniamls' id)
SELECT
	h1.animal_id
	, s.species_name
	, h1.born_date
	, h1.arrival_date
	, h1.planning_departure_date
FROM hotel_1 as h1
INNER JOIN species AS s ON s.species_id = h1.species_id

UNION

SELECT
	h2.animal_id
	, s.species_name
	, h2.born_date
	, h2.arrival_date
	, h2.planning_departure_date
FROM hotel_2 as h2
INNER JOIN species AS s ON s.species_id = h2.species_id

ORDER BY animal_id;

--Select columns from both main which comtain informations about animal's sex (ordered by animals' id)
SELECT
	h1.animal_id
	, h1.sex
FROM hotel_1 as h1

UNION

SELECT
	h2.animal_id
	, CASE
		WHEN h2.sex = 'S' THEN 'Male'
		WHEN h2.sex = 'F' THEN 'Female'
		ELSE 'Unknown'
	END AS "sex"
FROM hotel_2 as h2

ORDER BY animal_id;

/*
	First create view which contains difference colors with number of animals for each one (but there's a problem with repetition of colors), then select
	unique colors with currect numbers from that view (solve a problem)
*/

CREATE VIEW vw_animal_colors
AS
	SELECT
		h1.color
		, COUNT(h1.color) AS "number_of_animals"
	FROM hotel_1 as h1
	GROUP BY h1.color

	UNION

	SELECT
		CASE
			WHEN h2.color_group = 'W' THEN 'White'
			WHEN h2.color_group= 'B' THEN 'Black'
			WHEN h2.color_group = 'BR' THEN 'Brown'
			WHEN h2.color_group = 'OO' THEN 'Maroon'
			ELSE 'Unknown'
		END AS "color"
		, COUNT(h2.color_group) AS "number_of_animals"
	FROM hotel_2 as h2
	GROUP BY h2.color_group;
*/

SELECT 
	color
	, SUM(number_of_animals) AS "number_of_animals"
FROM vw_animal_colors
GROUP BY color
ORDER BY color;

--Select all animals id's with age of each animal from both main tables (with appropriate conversion)
SELECT
	h1.animal_id
	, h1.age
FROM hotel_1 AS h1

UNION

SELECT
	h2.animal_id
	, CASE
		WHEN h2.years_old = 0 THEN CONCAT(h2.months_old, ' months')
		ELSE CONCAT(h2.years_old, ' years ', h2.months_old, ' months')
	END AS "age"
FROM hotel_2 AS h2

ORDER BY animal_id;


--TODO in the end remember all sql queries and how can you use them to extend made queries (e.g crate viev from queries which select all information form table and its relation)
--TODO extend README.md!!! (then the project will be finished), and say something about sources how you take those tables and say you learn how to use exel and how to import exel files into postgres
