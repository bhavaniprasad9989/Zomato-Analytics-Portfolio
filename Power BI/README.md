# Zomato Restaurant Analytics – Power BI

## Project Overview

This project uses Microsoft Power BI to analyze Zomato restaurant data and identify restaurant distribution patterns, customer ratings, cuisine popularity, pricing trends, and service availability across multiple countries.

The project uses restaurant-level data covering 15 countries. Power BI is used to clean and transform the data, develop data models, create DAX measures, and build interactive dashboards that provide meaningful insights into restaurant performance and customer preferences.

## Data Model Structure

The Power BI project uses the following data tables:

| Data Table | Description |
|---|---|
| `Zomato Restaurant Dataset` | Main restaurant information, including restaurant ID, name, country, city, cuisines, ratings, votes, cost, price range, and service availability. |
| `Restaurant Cuisines` | Separate cuisine-level table created by splitting restaurant cuisine values into individual rows. |

The `Restaurant ID` field is used to connect the restaurant data with the cuisine-level table.

## Data Cleaning and Preparation

- Imported Zomato restaurant data into Power BI.
- Reviewed column names, data types, and data quality.
- Checked missing values and inconsistent records.
- Prepared country and city information for geographical analysis.
- Split comma-separated cuisine values into individual rows.
- Created a separate `Restaurant Cuisines` table.
- Removed unnecessary spaces and unwanted blank cuisine values.
- Established relationships between the restaurant and cuisine tables.
- Standardized restaurant cost values into US Dollars using the 2018 currency conversion process.
- Created the `Average_Cost_USD` column for international cost comparisons.

## Custom Columns Created

The project uses custom columns to improve data analysis and visualization.

- Country – Maps country codes to country names.
- Rating Category – Groups restaurants based on aggregate rating.
- Average_Cost_USD – Converts restaurant costs into US Dollars.
- Cuisines – Separates individual cuisines into rows in the cuisine table.

## New DAX Measures

The Power BI project includes DAX measures for calculating important restaurant performance indicators.

- Total Restaurants
- Average Rating
- Total Votes
- Average Cost USD
- Online Delivery %
- Table Booking %
- Cuisine Restaurant Count

These measures are used in KPI cards, charts, and interactive report pages.

## Key Performance Indicators

The main Power BI dashboard focuses on the following KPIs:

- Total Restaurants
- Average Rating
- Total Votes
- Average Cost USD
- Online Delivery Percentage
- Table Booking Percentage

These KPI cards provide a quick overview of restaurant performance and service availability.

## Analysis Performed

### 1. Country and City Analysis

- Restaurant distribution across countries.
- Top 10 countries by restaurant count.
- Restaurant distribution across cities.
- Average restaurant ratings by country.
- Country-wise restaurant cost comparisons.

### 2. Cuisine Analysis

- Top 10 most popular cuisines.
- Cuisine distribution across countries.
- Cuisine distribution across cities.
- Restaurant count by cuisine.
- Cuisine-based rating and cost comparisons.

### 3. Rating Analysis

- Restaurant distribution by rating category.
- Average restaurant ratings across countries.
- Customer rating patterns.
- Relationship between restaurant ratings and pricing.

### 4. Pricing Analysis

- Average restaurant cost in USD.
- Cost comparisons across countries.
- Restaurant cost versus average rating.
- Restaurant distribution across price ranges.

### 5. Service Availability Analysis

- Online delivery availability.
- Table booking availability.
- Online delivery percentage.
- Table booking percentage.
- Comparison of restaurant service options.

## Tools and Power BI Features

- Microsoft Power BI Desktop
- Power Query
- Data Cleaning and Transformation
- Data Modeling
- DAX Measures
- Calculated Columns
- Currency Conversion
- KPI Cards
- Interactive Charts and Visualizations
- Slicers and Filters
- Drill-through Pages
- Report Page Tooltips
- Dashboard Design

## Interactive Dashboard Features

The Power BI report includes the following pages:

- Main Dashboard – Overall Zomato restaurant analytics.
- Charts 1 – Additional restaurant performance analysis.
- Charts 2 – Additional restaurant and cuisine analysis.
- Country Performance – Detailed country-level analysis.
- Cuisine Performance – Detailed cuisine-level analysis.
- Restaurant Details – Individual restaurant-level analysis.
- Tooltip 1 – Custom report-page tooltip.
- Tool tip 2 – Custom report-page tooltip.
- Tool tip 3 – Custom report-page tooltip.

## Drill-through Analysis

The project includes three dedicated drill-through pages.

### 1. Country Performance

Provides detailed restaurant analysis for a selected country.

### 2. Cuisine Performance

Provides detailed analysis for a selected cuisine, including restaurant distribution, ratings, and pricing.

### 3. Restaurant Details

Provides individual restaurant information, including ratings, votes, cuisines, cost, price range, online delivery, and table booking availability.

## KPI Charts and Visualizations

The dashboard uses different visualization types to present restaurant insights.

- Top 10 Countries by Restaurants – Bar Chart / Map.
- Average Rating by Country – Column Chart.
- Top 10 Cuisines – Bar Chart.
- Rating Category Distribution – Donut Chart.
- Average Cost vs Average Rating – Scatter Chart.
- Online Delivery vs Table Booking – Comparison Chart.
- Restaurant Distribution by City – Bar Chart.
- Cuisine Distribution – Treemap.

## Slicers and Filters

The main dashboard includes interactive slicers for:

- Country
- City
- Cuisines
- Price Range
- Rating Category

These slicers allow users to explore restaurant data based on selected criteria.

## Report Page Tooltips

The project includes three custom report-page tooltips to provide additional information when users hover over supported dashboard visuals.

These tooltips improve dashboard interactivity and help users explore additional restaurant insights without navigating away from the current report page.

## Key Business Questions

- Which countries have the highest number of restaurants?
- Which cities have the largest restaurant distribution?
- Which cuisines are most popular?
- Which countries have higher average restaurant ratings?
- How does restaurant cost vary across countries?
- What percentage of restaurants offer online delivery?
- What percentage of restaurants support table booking?
- How are restaurants distributed across rating categories?
- How do individual restaurants perform in terms of ratings, votes, and pricing?

## Dashboard Preview

![Zomato Restaurant Analytics Dashboard](./Zomato Restaurant Analytics Dashboard (2).png).
## How to Use

1. Download the Power BI project file.
2. Open the `.pbix` file using Microsoft Power BI Desktop.
3. Review the data model and table relationships.
4. Explore the KPI cards and dashboard visualizations.
5. Interact with available slicers and filters to analyze restaurant trends.
6. Right-click supported data points to access drill-through pages.
7. Hover over supported visuals to explore report-page tooltips.
8. Navigate through the report pages to explore detailed restaurant insights.

## Project File

[Download Zomato Power BI Dashboard](./Zomato_Analysis_Final.pbix) – Power BI report containing the restaurant data model, DAX measures, KPI cards, interactive charts, drill-through pages, and report-page tooltips.

## Conclusion

This Power BI project demonstrates how restaurant data can be transformed into interactive business intelligence reports. Through data cleaning, data modeling, currency standardization, DAX calculations, KPI cards, drill-through analysis, and visualizations, the dashboard helps explore restaurant distribution, customer ratings, cuisine popularity, pricing patterns, and service availability across multiple countries.
