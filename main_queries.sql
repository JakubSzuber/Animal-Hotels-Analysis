-----------------------------------------------------Queries--------------------------------------------------------------

--See number of male and female animals
SELECT
	sex
	, COUNT(sex)
FROM hotel_1
GROUP BY sex;

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

--See 
SELECT
	animal_id
	, name
	, SUBSTRING(owner_info FROM POSITION(' ' IN owner_info) FOR 12) AS "owner phone number"
	--, owner_info AS "oowner name"
FROM hotel_1

























