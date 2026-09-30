-- ============================================================
-- SALES DATA SQL PROJECT
-- ============================================================

CREATE DATABASE IF NOT EXISTS sales_project;
USE sales_project;

DROP TABLE IF EXISTS sales_data;


show tables;
CREATE TABLE sales_data (
    Order_ID            INT PRIMARY KEY,
    Order_Date           DATE,
    Customer_Name         VARCHAR(50),
    Region               VARCHAR(20),
    Product              VARCHAR(30),
    Category              VARCHAR(30),
    Quantity              INT,
    Price                DECIMAL(10,2),
    Sales                DECIMAL(12,2),
    Year                 INT,
    Month                VARCHAR(15),
    Quarter               VARCHAR(5),
    Data_Quality_Flag       VARCHAR(100),
    Quantity_Flag           VARCHAR(20),
    Price_Flag             VARCHAR(20)
);
show tables;
SELECT COUNT(*) AS row_count FROM sales_data; 
SELECT * FROM sales_data LIMIT 10 ;


-- All orders from the East region, most recent first
SELECT Order_ID, Order_Date, Customer_Name, Product, Sales
FROM sales_data
WHERE Region = 'East'
ORDER BY Order_Date DESC;

-- High-value orders only 
SELECT Order_ID, Product, Region, Sales 
FROM sales_data 
WHERE Sales > 50000 
ORDER BY Sales DESC;

-- Orders for a specific product, alphabetically by customer 
SELECT Customer_Name, Order_Date, Sales 
FROM sales_data 
WHERE Product = 'Laptop' 
ORDER BY Customer_Name ASC;


-- GROUP BY, HAVING 
-- Total sales by region 
SELECT Region, SUM(Sales) AS Total_Sales 
FROM sales_data 
GROUP BY Region 
ORDER BY Total_Sales DESC;


-- Regions whose total sales exceed 1,000,000 (HAVING filters after aggregation) 


SELECT Region, SUM(Sales) AS Total_Sales 
FROM sales_data 
GROUP BY Region 
HAVING SUM(Sales)  > 1000000 
ORDER BY Total_Sales DESC;


 -- Average order value per product, only products with more than 20 orders 
 
 
SELECT Product, COUNT(*) AS Num_Orders, AVG(Sales) AS Avg_Sale 
FROM sales_data 
GROUP BY Product 
HAVING COUNT(*) > 20 
ORDER BY Avg_Sale DESC;

# Monthly sales trend
SELECT  date_format(order_date, '%y-%m') as MONTHDATA,
 SUM(sales) as Total_Sales from sales_data 
 group by MONTHDATA
 order by MONTHDATA ;
 
 SELECT Category, 
SUM(Sales) AS Revenue, 
ROUND(SUM(Sales) * 100 / (SELECT SUM(Sales) FROM sales_data), 1) AS Percentage 
FROM sales_data 
GROUP BY Category;

-- Orders with an above-average sale amount 

SELECT Order_ID, Product, Sales 
FROM sales_data 
WHERE Sales > (SELECT AVG(Sales) FROM sales_data) 
ORDER BY Sales DESC;

 -- Regions whose total sales beat the East region's total (subquery in WHERE) 
 
SELECT Region, SUM(Sales) AS Total_Sales 
FROM sales_data 
GROUP BY Region 
HAVING SUM(Sales) > ( 
SELECT SUM(Sales) FROM sales_data WHERE Region = 'East' 
);

 -- Products whose average sale is above the overall average product sale -- (subquery )
 
SELECT Product, Avg_Sale 
FROM ( 
SELECT Product, AVG(Sales) AS Avg_Sale 
FROM sales_data 
GROUP BY Product 
) AS product_avg 
WHERE Avg_Sale > (SELECT AVG(Sales) FROM sales_data); 

-- Total Sales by Region 
SELECT Region, SUM(Sales) AS Total_Sales 
FROM sales_data 
GROUP BY Region
ORDER  by Total_Sales;

-- Top 5 Products 
SELECT Product, SUM(Sales) AS Revenue 
FROM sales_data 
GROUP BY Product 
ORDER BY Revenue DESC 
LIMIT 5; 

-- Monthly Sales Trend 

SELECT
    Month,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;

