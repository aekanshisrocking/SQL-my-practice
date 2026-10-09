-- DML Commands (Data Mnupulation Language)
-- 1st- INSERT

/* INSERT INTO super_cars (id, car_name, launch_date, color) - or can write just super_cars
VALUES 
    (1, 'Ferrari',NULL, 'King Red'),
    (2, 'Lamborghini', NULL, 'Cobalt Blue') */

SELECt *
FROM animals

-- 2nd INSERT using SELECT from another TABLE
-- Insert data from 'animals' to 'super_cars' 
 
/* INSERT INTO super_cars (id, car_name, launch_date, color)
SELECT 
    pet_id,
    animal_name,
    NULL,
    'Unknown'
FROM animals */

-- 3rd - UPDATE 
--1st Question- Change the color of super_car 2 to Rose Pink  

/*  UPDATE super_cars
    SET color = 'Rose Pink'
    WHERE id = 2  */

--2nd Question- Change the color of super_car 1 to Green and update the car_name to Maserati

/* UPDATE super_cars
SET color = 'Green',
    car_name = 'Maserati'
WHERE id = 1 */

SELECT *
FROM super_cars