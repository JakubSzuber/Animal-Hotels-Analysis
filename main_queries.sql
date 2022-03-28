-----------------------------------------------------Queries--------------------------------------------------------------

--See number of animals in each color
SELECT
	color
	, COUNT(color)
FROM hotel_1
GROUP BY color
ORDER BY color;

--See most basic information about first ten animals (ordered by id)
SELECT
	h.animal_id
	, h.name
	, sex
	, s.species_name
FROM hotel_1 as h
INNER JOIN species AS s ON s.species_id = h.species_id
ORDER BY h.animal_id
LIMIT 11;

--See which are woeking days for driver whose departure animals fromdhotel
SELECT
	DISTINCT(planning_departure_date) AS "driver working days" 
FROM hotel_1
ORDER BY "driver working days";

--See animals which anme starts which letter: b
SELECT
	name
FROM hotel_1
WHERE name ILIKE 'b%';

--See information about each animal in sepearted columns
SELECT
	animal_id
	, name
	, REVERSE(SUBSTRING(REVERSE(owner_info) FROM POSITION(' ' IN REVERSE(owner_info)) FOR 20)) AS "owner full name"
	, RIGHT(owner_info, 12) AS "owner phone number"
FROM hotel_1;

--See TODO
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

--TODO: write query which works with date-colums and use COALESCE()





















