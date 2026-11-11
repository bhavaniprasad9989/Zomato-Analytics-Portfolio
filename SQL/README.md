# Zomato Restaurant Analytics – SQL

## Project Overview

This project uses SQL to analyze Zomato restaurant data and identify business insights related to restaurant distribution, customer ratings, cuisines, pricing, online delivery, and table booking.

The project focuses on cleaning, transforming, and analyzing restaurant data using SQL queries to generate meaningful insights and support data-driven decision-making.

## Dataset Overview

The project uses the Zomato restaurant dataset containing restaurant information across multiple countries.

The dataset includes details such as:

- Restaurant ID and Restaurant Name
- Country and City
- Cuisines
- Aggregate Rating and Votes
- Average Cost for Two
- Currency and Country Code
- Online Delivery Availability
- Table Booking Availability
- Price Range

## Data Cleaning and Preparation

The following data preparation steps were performed using SQL:

- Checked the dataset for missing and NULL values.
- Identified duplicate restaurant records.
- Standardized restaurant and location-related information.
- Verified country codes and currency information.
- Handled inconsistent values in categorical columns.
- Prepared cost-related data for currency conversion.
- Created additional fields required for analysis.

## SQL Analysis

The project includes SQL queries to analyze the following business areas:

### 1. Restaurant Overview
- Total number of restaurants.
- Total countries and cities covered.
- Restaurant distribution by country.
- Restaurant distribution by city.

### 2. Customer Ratings Analysis
- Average restaurant rating.
- Rating category distribution.
- Restaurants with the highest ratings.
- Restaurants with the highest number of votes.

### 3. Cuisine Analysis
- Most popular cuisines.
- Top cuisines by restaurant count.
- Cuisine distribution across countries.
- Average ratings by cuisine.

### 4. Pricing Analysis
- Average cost for two.
- Restaurant distribution by price range.
- Average cost by country.
- Cost comparison using USD conversion.

### 5. Service Availability Analysis
- Restaurants offering online delivery.
- Restaurants offering table booking.
- Online delivery availability by country.
- Table booking availability by country.

## Currency Conversion

Currency conversion analysis was performed to standardize restaurant costs across different countries.

- Used 2018 exchange rates.
- Converted local currency values into USD.
- Applied country-specific currency mappings.
- Calculated average restaurant costs in USD.

## Tools and Technologies

- **SQL:** Data querying and analysis
- **MySQL:** Database management
- **SQL Functions:** Aggregate, string, conditional, and date functions
- **Joins:** Combining related data
- **CTEs:** Organizing complex queries
- **Subqueries:** Advanced data analysis
- **CASE Statements:** Conditional transformations
- **Currency Conversion:** Standardizing costs into USD

## Project Files

| File Name | Description |
|---|---|
| `Zomato_Analytics.sql` | SQL queries for data cleaning, transformation, and business analysis |

## How to Use

1. Download the SQL script from this repository.
2. Open MySQL Workbench.
3. Create or select the database.
4. Import the Zomato dataset.
5. Open and execute the SQL script.
6. Review the query results and business insights.

## Conclusion

This SQL project demonstrates practical data cleaning, transformation, and analytical querying skills using a real-world restaurant dataset. It provides insights into restaurant performance, customer preferences, pricing patterns, cuisine popularity, and service availability across multiple countries.
