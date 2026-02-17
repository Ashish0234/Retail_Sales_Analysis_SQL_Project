# SQL Retail Sales Analysis Project 

## Project Overview

This project focuses on analyzing retail sales data using SQL to extract meaningful business insights. The objective is to perform data cleaning, exploration, and analysis to solve real-world business problems related to sales performance, customer behavior, and product categories.

The project demonstrates strong SQL fundamentals along with advanced concepts like aggregation, grouping, window functions, Common Table Expressions (CTEs), and date-time analysis.

## Database & Table Creation

A database named **`sql_project`** was created.

A table called **`retail_sales`** was designed with the following fields:

* `transactions_id` (Primary Key)
* `sale_date`
* `sale_time`
* `customer_id`
* `gender`
* `age`
* `category`
* `quantity`
* `price_per_unit`
* `cogs`
* `total_sale`

This structure allows detailed tracking of transaction-level retail data.

## Data Cleaning

Data cleaning was performed to ensure accuracy and reliability.

### Steps Taken:

* Identified NULL values in important columns.
* Removed records containing NULL values.
* Ensured primary key integrity.

This step ensures that further analysis is based on clean and consistent data.

## Data Exploration

Basic exploratory queries were performed to understand the dataset:

* Total number of sales transactions
* Total unique customers
* Total unique product categories
* List of available categories

This helped in understanding data distribution and preparing for deeper analysis.

## Business Problems & SQL Analysis

The project answers 10 key business questions:

### 1. Sales on a Specific Date

Retrieved all transactions for a particular day to analyze daily performance.

### 2. Category-Based Filter Analysis

Filtered transactions for Clothing category with specific quantity conditions in a given month.

### 3. Total Sales by Category

Calculated total revenue and total orders per category to identify high-performing categories.

### 4. Average Age (Beauty Category)

Analyzed customer demographics by calculating average age of customers purchasing Beauty products.

### 5. High-Value Transactions

Identified transactions where total sales exceeded 1000 to detect premium purchases.

### 6. Gender-wise Transactions by Category

Analyzed purchase behavior by gender across different product categories.

### 7. Monthly Sales & Best-Selling Month per Year

Used:

* `GROUP BY`
* `AVG()`
* `RANK()`
* Window Functions

This helped in identifying the best-performing month in each year based on average sales.

### 8. Top 5 Customers

Identified customers generating the highest total revenue using sorting and LIMIT.

### 9. Unique Customers per Category

Measured customer engagement across different product categories.

### 10. Shift-wise Order Distribution

Created custom time-based shifts:

* Morning (<12)
* Afternoon (12–17)
* Evening (>17)

Used:

* `CASE` statement
* `EXTRACT(HOUR FROM sale_time)`
* CTE (Common Table Expression)

This analysis helps understand peak business hours.

## Key SQL Concepts Used

* Database & Table Creation
* Data Cleaning with DELETE & WHERE
* Aggregation Functions (SUM, AVG, COUNT)
* GROUP BY
* DISTINCT
* ORDER BY
* LIMIT
* Window Functions (RANK)
* CTE (WITH clause)
* Date & Time Functions (YEAR, MONTH, EXTRACT)
* CASE Statements

## Key Business Insights

* Identified top-performing categories
* Detected high-value customers
* Found best-selling months
* Analyzed gender-based purchasing patterns
* Determined peak business hours
* Measured customer engagement by category

These insights can help in:

* Inventory planning
* Marketing strategy
* Targeted promotions
* Customer segmentation
* Sales forecasting

## Conclusion

This project demonstrates practical SQL skills used in real-world retail analytics. It highlights how structured queries can transform raw sales data into meaningful business insights.

The project strengthens:

* Data cleaning capability
* Analytical thinking
* Business problem-solving
* SQL proficiency for analytics roles
