use walmart;
CREATE TABLE walmartStore (
    Store INT NOT NULL,
    date DATE,
    Weekly_sale DECIMAL(10 , 2 ),
    Holiday BOOLEAN,
    Temperature DECIMAL(10 , 2 ),
    Fuel_price DECIMAL(10 , 2 ),
    Cpi DECIMAL(10 , 2 ),
    Unemployment DECIMAL(10 , 2 )
); 
 
 describe walmartStore;
SELECT 
    *
FROM
    walmartstore;
 
 -- total weekly sales group by store
 
SELECT 
    Store, SUM(weekly_sale) AS total_sales
FROM
    walmartstore
GROUP BY store
ORDER BY total_sales DESC;
 
SELECT 
    holiday, ROUND(AVG(weekly_sale), 0) AS average_weeklySales
FROM
    walmartstore
GROUP BY holiday;
 
SELECT 
    holiday, SUM(weekly_sale) AS average_weeklySales
FROM
    walmartstore
GROUP BY holiday;
 
 
SELECT 
    *
FROM
    walmartstore;
SELECT 
    holiday, COUNT(weekly_sale)
FROM
    walmartstore
GROUP BY holiday;
 
SELECT 2295 + 270;
 
 -- sum of sales by year and months 
 
SELECT 
    DATE_TRUNC('year', date) AS YEAR, SUM(weekly_sale)
FROM
    walmartstore
GROUP BY DATE_TRUNC('year', date)
ORDER BY year;
 
SELECT 
    YEAR(date) AS YEAR, SUM(weekly_sale) AS total_weeklySales
FROM
    walmartstore
GROUP BY year
ORDER BY year;
 
SELECT 
    YEAR(date) AS YEAR,
    DATE_FORMAT(date, '%b') AS MONTH,
    SUM(weekly_sale) AS total_weeklySales
FROM
    walmartstore
GROUP BY YEAR(date) , DATE_FORMAT(date, '%b')
ORDER BY year , total_weeklySales DESC;
 
 -- SALES BY TEMPERATURE RANGE
 
SELECT 
    CASE
        WHEN temperature < 32 THEN 'Cold'
        WHEN temperature BETWEEN 32 AND 60 THEN 'Moderate'
        WHEN temperature BETWEEN 60 AND 85 THEN 'warm'
        ELSE 'hot'
    END AS temperature_range,
    SUM(weekly_sale) AS total_weeklySales
FROM
    walmartstore
GROUP BY temperature_range
ORDER BY total_weeklySales DESC;
  
  -- influence of Unemployment Rate on sales 
  
SELECT 
    CASE
        WHEN Unemployment < 5 THEN 'below 5%'
        WHEN Unemployment BETWEEN 5 AND 7 THEN '5% - 7%'
        WHEN Unemployment > 7 THEN 'Above 7%'
    END AS UnemploymentRate_Range,
    AVG(weekly_sale) AS average_weeklySales
FROM
    walmartstore
GROUP BY UnemploymentRate_Range
ORDER BY average_weeklySales DESC;

SELECT 
    CASE
        WHEN Unemployment < 5 THEN 'below 5%'
        WHEN Unemployment BETWEEN 5 AND 7 THEN '5% - 7%'
        WHEN Unemployment > 7 THEN 'Above 7%'
    END AS UnemploymentRate_Range,
    SUM(Weekly_sale) AS total_weeklySales
FROM
    walmartstore
GROUP BY UnemploymentRate_Range
ORDER BY total_weeklySales DESC;

-- Top 5 Weeks with Highest Sales

SELECT 
    store, date, weekly_sale
FROM
    walmartstore
ORDER BY weekly_sale DESC
LIMIT 5;
 
-- Sales distribution by store 

SELECT 
    store AS store_id,
    SUM(weekly_sale) AS Total_weekly_sales,
    ROUND(AVG(weekly_sale), 2) AS Average_weeklySales
FROM
    walmartstore
GROUP BY store_id
ORDER BY Total_weekly_sales DESC;

SELECT 
    store AS store_id, SUM(weekly_sale) AS Total_weekly_sales
FROM
    walmartstore
GROUP BY store_id
ORDER BY Total_weekly_sales DESC;

SELECT 
    store AS store_id,
    MAX(weekly_sale) AS Maximium_weeklySales,
    MIN(weekly_sale) AS minimium_weeklySales
FROM
    walmartstore
GROUP BY store_id
ORDER BY store_id DESC;

SELECT 
    store AS store_id,
    SUM(weekly_sale) AS total_weeklySales,
    (SUM(weekly_sale) / (SELECT 
            SUM(weekly_sale)
        FROM
            walmartstore) * 100) AS Total_weeklySales_percentage
FROM
    walmartstore
GROUP BY store_id
ORDER BY total_weeklySales DESC;

-- influence of Consumer price index on sales

SELECT 
    CASE
        WHEN Cpi < 150 THEN 'Below 150'
        WHEN Cpi BETWEEN 150 AND 175 THEN '150 - 175'
        WHEN Cpi BETWEEN 175 AND 200 THEN '175 - 200'
        WHEN Cpi BETWEEN 200 AND 225 THEN '200 - 225'
        WHEN Cpi > 225 THEN 'Above 225'
    END AS Cpi_Range,
    SUM(weekly_sale) AS total_WeeklySales
FROM
    walmartstore
GROUP BY Cpi_Range
ORDER BY total_WeeklySales DESC;


SELECT 
    CASE
        WHEN Cpi < 150 THEN 'Below 150'
        WHEN Cpi BETWEEN 150 AND 175 THEN '150 - 175'
        WHEN Cpi BETWEEN 175 AND 200 THEN '175 - 200'
        WHEN Cpi BETWEEN 200 AND 225 THEN '200 - 225'
        WHEN Cpi > 225 THEN 'Above 225'
    END AS Cpi_Range,
    ROUND(AVG(weekly_sale), 2) AS Average_WeeklySales
FROM
    walmartstore
GROUP BY Cpi_Range
ORDER BY Average_WeeklySales DESC;

-- the impact of holidays and temperature on sales

SELECT 
    Holiday AS Holiday_flag,
    CASE
        WHEN temperature < 32 THEN 'Cold'
        WHEN temperature BETWEEN 32 AND 60 THEN 'Moderate'
        WHEN temperature BETWEEN 61 AND 85 THEN 'warm'
        ELSE 'hot'
    END AS temperature_range,
    SUM(weekly_sale) AS total_weeklySales
FROM
    walmartstore
GROUP BY Holiday , Temperature_range
ORDER BY total_weeklySales DESC;

SELECT 
    holiday AS Holiday_Flag, COUNT(weekly_sale) AS Sales_number
FROM
    walmartstore
GROUP BY holiday_flag;

-- influence of holiday on sales 
SELECT 
    holiday AS holiday_flag,
    SUM(weekly_sale) AS Total_weeklySales
FROM
    walamartstore
GROUP BY holiday_flag;
