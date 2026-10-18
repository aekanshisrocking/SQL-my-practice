-- Aggregation & Analytical Functions  
-- Q1 - ANALYZE sales in the table ordes in all way COUNT, SUM, AVG, MAX, MIN 

SELECT 
customer_id,
COUNT(*) AS total_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,             -- EX 
MAX(sales) AS highest_sales,
MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id

-- Q1- Find the total Sales for each product. Additionally provide details such order Id, order date 

SELECT 
OrderID,
OrderDate,
ProductID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY                                       -- BY doing this we can see total sales are destroyed so 
       OrderID,                                -- this way is wrong
       OrderDate,
       ProductID

-- now the correct way with the help of - WINDOW Function 
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct 
FROM Sales.Orders