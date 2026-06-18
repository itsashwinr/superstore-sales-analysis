# Database Creation
CREATE DATABASE if not exists superstore;
USE superstore;

# Table Creation
CREATE TABLE superstore (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,4)
);


#Total Sales
SELECT sum(sales) as total_sales
FROM superstore;

#Total Profit
SELECT round(sum(profit),3) as Total_profit
FROM superstore;

#Total quantity sold
SELECT sum(quantity) as Total_qty
FROM superstore;

#Total number of records
SELECT count(*) as Total_records
FROM superstore;

#Sales & Profit by category
SELECT category,
	   sum(sales) as Total_sales,
       round(sum(Profit),2) as Total_profit
FROM superstore
GROUP BY category;

#Total sales by region
SELECT region,
	   sum(sales) as Total_sales
FROM superstore
GROUP BY region;

#Profit by sub_category
SELECT sub_category,
	   round(sum(profit),2) as Total_profit
FROM superstore
GROUP BY sub_category;

#Discount vs profit relationship
SELECT 
    discount,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

#Top 10 Cities by Sales
SELECT city,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

#Bottom 10 Cities by Profit
SELECT city,
       ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY city
ORDER BY total_profit ASC
LIMIT 10;

#Sales by Segment
SELECT segment,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

#Cities with Negative Profit
SELECT city,
       ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY city
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

#Region-wise Profit Comparison
SELECT region,
       ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

#Top 10 Sub-Categories by Sales
SELECT sub_category,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;

#Sub-Categories with Negative Profit
SELECT sub_category,
       ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;