Create database Zomato_Analytics;
Use zomato_analytics;

ALTER TABLE zomato_data_set
ADD COLUMN Country VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;

UPDATE zomato_data_set
SET Country = CASE
    WHEN `Country Code` = 1 THEN 'India'
    WHEN `Country Code` = 14 THEN 'Australia'
    WHEN `Country Code` = 30 THEN 'Brazil'
    WHEN `Country Code` = 37 THEN 'Canada'
    WHEN `Country Code` = 94 THEN 'Indonesia'
    WHEN `Country Code` = 148 THEN 'New Zealand'
    WHEN `Country Code` = 162 THEN 'Botswana'
    WHEN `Country Code` = 166 THEN 'Qatar'
    WHEN `Country Code` = 184 THEN 'Singapore'
    WHEN `Country Code` = 189 THEN 'South Africa'
    WHEN `Country Code` = 191 THEN 'Sri Lanka'
    WHEN `Country Code` = 208 THEN 'Turkey'
    WHEN `Country Code` = 214 THEN 'United Arab Emirates'
    WHEN `Country Code` = 215 THEN 'United Kingdom'
    WHEN `Country Code` = 216 THEN 'United States'
    ELSE 'Unknown'
END;

SET SQL_SAFE_UPDATES = 0;

UPDATE zomato_data_set
SET Country = 'Philippines'
WHERE `Country Code` = 162;

SET SQL_SAFE_UPDATES = 1;

CREATE TABLE exchange_rates (
    Country_Code INT PRIMARY KEY,
    Country VARCHAR(100),
    Currency_Name VARCHAR(50),
    Local_Currency_Per_USD DECIMAL(15,6)
);

ALTER TABLE zomato_data_set
ADD COLUMN Average_Cost_Per_2_USD DECIMAL(12,2);

INSERT INTO exchange_rates
(Country_Code, Country, Currency_Name, Local_Currency_Per_USD)
VALUES
(1,   'India',                'INR', 68.370000),
(14,  'Australia',            'AUD', 1.336700),
(30,  'Brazil',               'BRL', 3.651300),
(37,  'Canada',               'CAD', 1.295700),
(94,  'Indonesia',            'IDR', 14236.900000),
(148, 'New Zealand',           'NZD', 1.444000),
(162, 'Philippines',           'PHP', 52.661400),
(166, 'Qatar',                 'QAR', 3.640000),
(184, 'Singapore',             'SGD', 1.349000),
(189, 'South Africa',          'ZAR', 13.240000),
(191, 'Sri Lanka',             'LKR', 162.500000),
(208, 'Turkey',                'TRY', 4.830000),
(214, 'United Arab Emirates',  'AED', 3.672500),
(215, 'United Kingdom',        'GBP', 0.748300),
(216, 'United States',         'USD', 1.000000);

UPDATE zomato_data_set z
JOIN exchange_rates e
    ON z.`Country Code` = e.Country_Code
SET z.Average_Cost_Per_2_USD =
    ROUND(
        CAST(z.`Average Cost for two` AS DECIMAL(12,2))
        / e.Local_Currency_Per_USD,
        2
    );
    
    SET SQL_SAFE_UPDATES = 0;

UPDATE zomato_data_set
SET Currency = 'Philippine Peso(₱)'
WHERE `Country Code` = 162;

SET SQL_SAFE_UPDATES = 1;

#1 Total Restaurants
SELECT
    COUNT(DISTINCT Restaurant_ID) AS Total_Restaurants
FROM zomato_data_set;

#2 Average Rating
SELECT
    ROUND(AVG(`Aggregate rating`), 2) AS Average_Rating
FROM zomato_data_set
WHERE `Aggregate rating` > 0;

#3 Total Votes
SELECT
    SUM(Votes) AS Total_Votes
FROM zomato_data_set;

#4 Average Cost
SELECT
    ROUND(AVG(Average_Cost_Per_2_USD), 2)
        AS Average_Cost_Per_2_USD
FROM zomato_data_set
WHERE Average_Cost_Per_2_USD IS NOT NULL;

#5 Online Delivery Percentage
SELECT
    ROUND(
        SUM(
            CASE
                WHEN LOWER(TRIM(`Has Online delivery`)) = 'yes'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Online_Delivery_Percentage
FROM zomato_data_set;

#6 Table Booking Percentage
SELECT
    ROUND(
        SUM(
            CASE
                WHEN LOWER(TRIM(`Has Table booking`)) = 'yes'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Table_Booking_Percentage
FROM zomato_data_set;

#7 Top 10 Restaurant Distribution by Country
SELECT
    Country,
    COUNT(DISTINCT `Restaurant_ID`) AS Total_Restaurants
FROM zomato_data_set
GROUP BY Country
ORDER BY Total_Restaurants DESC
limit 10;

#8 Average Rating by Country
SELECT
    Country,
    COUNT(*) AS Rated_Restaurants,
    ROUND(AVG(`Aggregate rating`), 2) AS Average_Rating
FROM zomato_data_set
WHERE `Aggregate rating` > 0
GROUP BY Country
ORDER BY Average_Rating DESC;

#9 Top 10 Cusines
WITH RECURSIVE CuisineSplit AS
(
    SELECT
        `Restaurant_ID`,
        TRIM(SUBSTRING_INDEX(Cuisines, ',', 1)) AS Cuisine,
        CASE
            WHEN Cuisines LIKE '%,%'
            THEN SUBSTRING(Cuisines, LOCATE(',', Cuisines) + 1)
            ELSE NULL
        END AS Remaining
    FROM zomato_data_set
    WHERE Cuisines IS NOT NULL
      AND TRIM(Cuisines) <> ''

    UNION ALL

    SELECT
        `Restaurant_ID`,
        TRIM(SUBSTRING_INDEX(Remaining, ',', 1)),
        CASE
            WHEN Remaining LIKE '%,%'
            THEN SUBSTRING(Remaining, LOCATE(',', Remaining) + 1)
            ELSE NULL
        END
    FROM CuisineSplit
    WHERE Remaining IS NOT NULL
      AND TRIM(Remaining) <> ''
)
SELECT
    Cuisine,
    COUNT(DISTINCT `Restaurant_ID`) AS Restaurant_Count
FROM CuisineSplit
WHERE Cuisine <> ''
GROUP BY Cuisine
ORDER BY Restaurant_Count DESC
LIMIT 10;

#10 Rating Category Distribution
SELECT
    `Rating text` AS Rating_Category,
    COUNT(*) AS Restaurant_Count
FROM zomato_data_set
GROUP BY `Rating text`
ORDER BY Restaurant_Count DESC;

#11 Online Delivery vs Table Booking
SELECT
    CASE
        WHEN LOWER(TRIM(`Has Online delivery`)) = 'yes' THEN 'Yes'
        ELSE 'No'
    END AS Online_Delivery,

    CASE
        WHEN LOWER(TRIM(`Has Table booking`)) = 'yes' THEN 'Yes'
        ELSE 'No'
    END AS Table_Booking,

    COUNT(*) AS Restaurant_Count

FROM zomato_data_set

GROUP BY
    CASE
        WHEN LOWER(TRIM(`Has Online delivery`)) = 'yes' THEN 'Yes'
        ELSE 'No'
    END,
    CASE
        WHEN LOWER(TRIM(`Has Table booking`)) = 'yes' THEN 'Yes'
        ELSE 'No'
    END

ORDER BY Restaurant_Count DESC;

#12 Top 10 cities by Restaurants
SELECT
    City,
    COUNT(DISTINCT `Restaurant_ID`) AS Restaurant_Count
FROM zomato_data_set
WHERE City IS NOT NULL
  AND TRIM(City) <> ''
GROUP BY City
ORDER BY Restaurant_Count DESC
LIMIT 10;

#13 Average Cost for Two by Country (USD)
SELECT
    Country,
    ROUND(AVG(Average_Cost_Per_2_USD), 2) AS Average_Cost_USD
FROM zomato_data_set
WHERE Average_Cost_Per_2_USD IS NOT NULL
GROUP BY Country
ORDER BY Average_Cost_USD DESC;

#14 Restaurant Distribution by Price Range
SELECT
    `Price range` AS Price_Range,
    COUNT(DISTINCT `Restaurant_ID`) AS Restaurant_Count,
    ROUND(
        COUNT(DISTINCT `Restaurant_ID`) * 100.0 /
        (SELECT COUNT(DISTINCT `Restaurant_ID`)
         FROM zomato_data_set),
        2
    ) AS Percentage
FROM zomato_data_set
GROUP BY `Price range`
ORDER BY `Price range`;

#15 Restaurant Distribution by Online Delivery
SELECT
    CASE
        WHEN LOWER(TRIM(`Has Online delivery`)) = 'yes'
            THEN 'Yes'
        ELSE 'No'
    END AS Online_Delivery_Status,

    COUNT(DISTINCT `Restaurant_ID`) AS Restaurant_Count,

    ROUND(
        COUNT(DISTINCT `Restaurant_ID`) * 100.0 /
        (SELECT COUNT(DISTINCT `Restaurant_ID`)
         FROM zomato_data_set),
        2
    ) AS Percentage

FROM zomato_data_set
GROUP BY Online_Delivery_Status
ORDER BY Restaurant_Count DESC;

#16 Average Rating by Price Range
SELECT
    `Price range` AS Price_Range,
    COUNT(*) AS Total_Restaurants,
    ROUND(AVG(`Aggregate rating`), 2) AS Average_Rating
FROM zomato_data_set
WHERE `Aggregate rating` > 0
GROUP BY `Price range`
ORDER BY `Price range`;