-- FUNCTIONS --

--STRING--

-- CONCAT 
-- Q1- Show a list of customers' first names together with their country in one coloumn. 

SELECT 
  first_name,
  country,
  CONCAT(first_name, ' ', country) AS name_country
FROM customers 

-- UPPER & LOWER 
-- Q2 Transform the customer's first name to lowercase and uppercase

SELECT 
  first_name,
  country,
  CONCAT(first_name, ' ', country) AS name_country,
  LOWER(first_name) AS low_name,
  UPPER(first_name) AS up_name
FROM customers 

-- TRIM 
-- Q3 Find customers whose first name contains leading or trailing spaces 

SELECT 
first_name
FROM customers
WHERE first_name != TRIM(first_name)

-- REPLACE
-- Q4 - Remaove dashes(-) from a phone number 

SELECT 
'123-456-789' AS phone,
REPLACE('123-456-789', '-', '') AS clean_phone 

-- Q5 Replace file extence from txt to csv

SELECT
'report.txt' AS old_filename,
REPLACE('report.txt', 'txt', 'csv') AS new_filename