-- SET OPERATORS

-- UNION Operator
-- Q1 - Combine the data from employees and customers into one table 

SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
FirstName,
LastName
FROM Sales.Employees

-- UNION ALL Operator
-- Q2 - Combine the data from employees and customers into one table, including duplicates

SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT 
FirstName,
LastName
FROM Sales.Employees

-- EXCEPT Operator
-- Q3 - Find the employees who are not customers at the same time

SELECT 
FirstName,
LastName
FROM Sales.Customers
EXCEPT
SELECT 
FirstName, 
LastName
FROM Sales.Employees

-- INTERSECT Operator
-- Q4 - Find the employees who are also customers 

SELECT 
   FirstName,
   LastName
FROM Sales.Customers
INTERSECT
SELECT 
   FirstName,
   LastName
FROM Sales.Employees