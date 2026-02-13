SELECT count(*) FROM retails;
DESCRIBE retails;

SELECT *
FROM 
retails LIMIT 5;

SELECT COUNT(*) AS null_customers
FROM retails
WHERE CustomerID IS NULL;

SELECT COUNT(*) AS negative_quantity
FROM retails
WHERE Quantity < 0; 

-- MIN AND MIX QUANTITY
SELECT MIN(Quantity), MAX(Quantity)
FROM retails;

SELECT MIN(UnitPrice), MAX(UnitPrice)
FROM retails;

-- Total revenue
SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM retails;

-- Best performing countries
SELECT Country, SUM(Quantity * UnitPrice)
FROM retails
GROUP BY Country
ORDER BY SUM(Quantity * UnitPrice) DESC;

-- Total sales by products
SELECT Description, SUM(Quantity * UnitPrice)
FROM retails
GROUP BY Description
ORDER BY SUM(Quantity * UnitPrice) DESC LIMIT 10; 

-- Total Quantity sold per product

SELECT Description, SUM(Quantity) 
FROM 
retails
GROUP BY Description
ORDER BY SUM(Quantity) DESC LIMIT 10; 


-- Avg Unitprice per product
SELECT Description, AVG(UnitPrice) 
FROM 
retails
GROUP BY Description
ORDER BY AVG(UnitPrice) DESC LIMIT 10; 

-- Products which generate high revenue because of high price AND reasonable volume
SELECT Description, SUM(Quantity) AS total_volume, AVG(UnitPrice) AS avg_price,
SUM(Quantity * UnitPrice) AS total_revenue
FROM retails
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;



-- Customer POV

SELECT CustomerID, SUM(Quantity * UnitPrice)
FROM retails
GROUP BY CustomerID 
ORDER BY  SUM(Quantity * UnitPrice) DESC LIMIT 10;


-- By month

SELECT 
    sales_date,
    ROUND(SUM(Quantity * UnitPrice), 2) AS daily_revenue
FROM retails
GROUP BY sales_date
ORDER BY sales_date;

SELECT 
    sales_date,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retails
GROUP BY sales_date
ORDER BY sales_date;

SELECT 
    sales_date,
    ROUND(SUM(Quantity * UnitPrice), 2) AS daily_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS avg_order_value
FROM retails
GROUP BY sales_date
ORDER BY sales_date;

