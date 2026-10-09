-- DDL Commands ( DATA DEFINATION LANGUAGE )
-- 1st - CREATE 

/* Create a new table called super_cars
with columns: id, car_name, launch_date, and color */

/*CREATE TABLE super_cars (
    id INT NOT NULL,
    car_name VARCHAR(50) NOT  NULL,
    launch_date DATE, 
    color VARCHAR(15) NOT NULL,
    CONSTRAINT pk_supercars PRIMARY KEY(id)
    )  */

SELECT *
FROM super_cars

--2nd - ALTER
-- Add a new column called email to the persons table 

/* ALTER TABLE super_cars
ADD social_media VARCHAR(20) NOT NULL */

-- AND for deleting one column 

/* ALTER TABLE super_cars
DROP COLUMN social_media */

--23rd - DROP 
-- Delete the table persons from the database 

-- DROP TABLE persons 
