-- FUNCTIONS --

--STRING--

-- CONCAT 
-- Q1- Show a list of customers' first names together with their country in one coloumn. 

SELECT 
  first_name,
  country,
  CONCAT(first_name, ' ', country) AS name_country
FROM customers 