CREATE TABLE rooms
(
    room_id SERIAL PRIMARY KEY NOT NULL,
	room_floor_num SMALLINT NOT NULL,
	room_type VARCHAR(30) NOT NULL
)
