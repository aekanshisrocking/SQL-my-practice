 -- FUNCTIONS --
-- SINGLE ROW FUNCTIONS 

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

-- DATE AND TIME --
-- FORMATTING --
-- Formating date 

SELECT 
OrderID,
CreationTime,
FORMAT(CreationTime, 'MM-dd-yyyy') USA_Format,
FORMAT(CreationTime, 'dd-MM-yyyy') EURO_Format,
FORMAT(CreationTime, 'dd') dd,
FORMAT(CreationTime, 'ddd') ddd,
FORMAT(CreationTime, 'dddd') dddd
FROM Sales.Orders  

/* Show CreationTime using the following format :
  Day Wed Jan Q1 2026 12:34:56 PM */

SELECT
OrderID,
CreationTime,
'DAY '+ FORMAT(CreationTime, 'ddd MMM') + 
' Q' + DATENAME(quarter, CreationTime) + ' ' +
FORMAT(CreationTime, 'yyyy hh:mm:ss tt')   AS CustomeFormat
FROM Sales.Orders

-- DATA Aggregations     Formating use case-- 

SELECT 
FORMAT(OrderDate, 'MMM yy') OrderDate, 
COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')

-- CONVERT 

SELECT
CONVERT(INT, '123') AS [String to INT convert],
CONVERT(DATE, '2025-08-20') AS [String to Date convert]
FROM Sales.Orders

SELECT
CONVERT(DATE, '2025-08-20') AS [String to Date convert],
CONVERT(VARCHAR, CreationTime, 32) AS {USA std. style:32}
FROM Sales.Orders

-- DATE ADD -- 

SELECT
OrderID,
CreationTime,
DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders

-- DATEDIFF --
-- Q1 - Calculate the age of employees

SELECT
EmployeeID,
BirthDate,
DATEDIFF(year, BirthDate, GETDATE()) Age 
FROM Sales.Employees

-- Q2 - Find the average shipping duration in days for each month  

SELECT
MONTH(OrderDate) AS OrderDate,
AVG(DATEDIFF(day, OrderDate, ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)

-- Time Gap Analysis
-- Q3 Find the number of days between each order and the previous order 

SELECT 
OrderID,
OrderDate CurrentOrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) nrofdays
FROM Sales.Orders

-- ISDATE -- EXAMPLES

SELECT 
ISDATE('123') DateCheck1,
ISDATE('2026-08-24')  DateCheck2,
ISDATE('2026') DateCheck1

-- EX 2 
SELECT 
   OrderDate,
   ISDATE(OrderDate),
   CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
        ELSE '9999-01-01'
   END NewOrderDate
FROM 
(
   SELECT '2025-08-20' AS OrderDate UNION
   SELECT '2025-08-21' UNION
   SELECT '2025-08-23' UNION
   SELECT '2025-08'
)t

-- NULL Functions
-- DATA aggregations
-- Find the average scores of the customers

SELECT
CustomerID,
Score,
COALESCE(Score, 0) Score2,
AVG(Score) OVER () AvgScores,
AVG(COALESCE(Score, 0)) OVER() AvgScores2  -- replaced NULL with zero 
FROM Sales.Customers

-- Mathematical Operations
/* Dispaly the full name of customers in a single field by merging their first and last names, 
and add 10 bonus points to each customer's score. */

SELECT                                    ----
CustomerID,
FirstName,
LastName,
FirstName + ' ' + LastName AS FullName,    -- STEP 1 (with mistakes)
Score,
Score + 10 AS ScoreWithBonus
FROM Sales.Customers                      ----  
-----------------------------------------------------------------------------------------------
SELECT                                                  --------
CustomerID,
FirstName,
LastName,
COALESCE(LastName, '') LastName2,     -- can remove this line 
FirstName + ' ' + COALESCE(LastName, '') AS FullName,   ---- STEP 2
Score,
COALESCE(Score, 0) + 10 AS ScoreWithBonus
FROM Sales.Customers                                       -----

-- Sorting Data 
-- Q - Sort the customers from lowest to heighest score, with nulls appearing last 

SELECT
CustomerID,
Score,
COALESCE(Score, 9999)
FROM Sales.Customers          --METHOD 1- Replace the NULLs with a very big no.
ORDER BY COALESCE(Score, 9999)    -- its a lazy method btw

-- METHOD 2 

SELECT
CustomerID,
Score
FROM Sales.Customers          
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score

-- NULLIF -- Division By Zero 
-- Q1- Find the sales price for each order by dividing sales by quantity

SELECT
OrderID,
Sales,
Quantity,
Sales/NULLIF(Quantity, 0) AS Price
FROM Sales.Orders

-- IS NULL                                         -- FILTERING data
-- Q2 - Identify the customers who have no score 

SELECT *
FROM Sales.Customers
WHERE Score IS NULL

-- IS NOT NULL
-- Q3 - Identify the customers who have score 

SELECT *
FROM Sales.Customers
WHERE Score IS NOT NULL

-- IS NULL - ANTI JOINS 
--Q1 - List all details for customers who have not placed any orders - LEFT ANTI JOIN

SELECT 
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

-- NULL vs Empty vs Space

WITH Orders AS (
SELECT 1 Id, 'A' Category UNION 
SELECT 2, NULL UNION 
SELECT 3, '' UNION 
SELECT 4, ' ' 
)
SELECT *,
DATALENGTH (Category) CategoryLen,     -- DATA Policy 1 - Only use NULLs and empty
DATALENGTH (TRIM(Category)) Policy1    --  strings,but avoid blank spaces 
FROM Orders

-- DATA Policy 1 - Only use NULLs and avoid using empty 
--  strings and blank spaces 

WITH Orders AS (
SELECT 1 Id, 'A' Category UNION 
SELECT 2, NULL UNION 
SELECT 3, '' UNION 
SELECT 4, ' ' 
)
SELECT *,  
TRIM(Category) Policy1, 
NULLIF(TRIM(Category), '') Policy2
FROM Orders

-- CASE Statement 1 --
/* Q1- Create report showing total sales for each of the following categories: 
   High (sales over 50), Medium (sales 21-50), and Low (sales 20 or less)
   Sort the categories from highest sales to lowest */
SELECT
Category,
SUM(Sales) AS TotalSales
FROM(
    SELECT
    OrderID,
    Sales,
    CASE
         WHEN Sales > 50 THEN 'High'
         WHEN Sales > 20 THEN 'Medium'
         ELSE 'Low'
    END Category
    FROM Sales.Orders
)t
GROUP BY Category
ORDER BY TotalSales DESC

-- CASE Statement 2 -
--Q1 - Retrive employee details with gender displayed as full text 

SELECT 
EmployeeID,
FirstName,
LastName,
Gender,
CASE 
   WHEN Gender = 'F' THEN 'Female'
   WHEN Gender = 'M' THEN 'Male'
   ELSE 'Not Available'
END GenderFullText
FROM Sales.Employees

--Q2 - Retrive customers details with abbreviated country code 

SELECT 
CustomerID,
FirstName,
LastName,
Country, CASE 
   WHEN Country = 'Germany' THEN 'DE'
   WHEN Country = 'USA' THEN 'US'
   ELSE 'n/a'
END CountryAbbr,

CASE Country
   WHEN  'Germany' THEN 'DE'       -- OR Can use this shortcut 
   WHEN  'USA' THEN 'US'
   ELSE 'n/a'
END CountryAbbr2
FROM Sales.Customers

-- 3rd USE Case - Handling NULLs 
-- Q1- Find the average scores of customers and tret NULLs as 0 , Additionally provide details such CustomerID and LastName 