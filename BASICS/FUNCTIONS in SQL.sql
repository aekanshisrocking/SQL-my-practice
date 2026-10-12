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

-- LEN
-- Q6 -Calculate the length of each customer's first name.

SELECT
first_name,
LEN(first_name) AS len_name
FROM customers

-- STRING EXTRACTION
-- LEFT
-- Q7 - Retrieve the first two characters of each first name

SELECT
first_name,
LEFT(TRIM(first_name), 2) AS first_2_char
FROM customers

-- RIGHT
-- Q8 - Retrieve the first two characters of each first name

SELECT
first_name,
RIGHT(first_name, 2) AS last_2_char
FROM customers

-- SUBSTRING 
-- Q9 - Retrieve a list of customers' first names after removing the first character 

/* SELECT 
    first_name,                                      --
    SUBSTRING(first_name, 2, LEN()) AS sub_name      -- WRONG SYNTAX
   FROM customers  */                                     --

SELECT 
    first_name,                         
    SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name      
   FROM customers

 -- NUMBER FUNCTIONS 
 --ROUND 

 SELECT 
 3.516,
 ROUND(3.516, 2) AS round_2,
 ROUND(3.516, 1) AS round_1,
 ROUND(3.516, 0) AS round_0

 -- ABS (Absolute)

SELECT
-10,
ABS(-10),
ABS(10)

-- DATE AND TIME FUNCTIONS
-- Returns the current date and time at the moment when the query is executed

SELECT
CreationTime,
GETDATE() TODAY
FROM Sales.Orders

-- PART Extraction
-- For DAY, MONTH , YEAR 

SELECT
OrderID,
CreationTime,
YEAR(CreationTime) Year,
DAY(CreationTime) Day,
MONTH(CreationTime) Month
FROM Sales.Orders

-- DATE PART() --

SELECT
CreationTime,
DATEPART(year, CreationTime) AS year_dp,
DATEPART(hour, CreationTime) AS hour_dp
FROM Sales.Orders

-- DATE NAME -- SYNTAX same as datepart

SELECT
CreationTime,
DATENAME(month, CreationTime) AS month_dn,
DATENAME(weekday, CreationTime) AS week_dn
FROM Sales.Orders

-- DATETRUNC 

SELECT 
DATETRUNC(month, CreationTime) Creation,
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month, CreationTime)

-- EOMONTH --

SELECT 
OrderID,
EOMONTH(CreationTime) EndOfMonth
FROM Sales.Orders

-- PRACTICE QUESTIONS --
-- Q1 -How many orders were placed each year ? 
SELECT
YEAR(OrderDate) ,
COUNT(*)
FROM Sales.Orders
GROUP BY YEAR(OrderDate)


-- Q2- How many orders were placed each month ? 
SELECT
MONTH(OrderDate) ,
COUNT(*)
FROM Sales.Orders
GROUP BY MONTH(OrderDate)

-- Q3- Show all orders that were placed during the month of february 

SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2