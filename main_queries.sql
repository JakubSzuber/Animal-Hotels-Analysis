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

--See most basic information about first ten animals (ordered by id)
SELECT
	animal_id
	, name
	CASE 
		WHEN
		
FROM hotel_1































