-- SQL Retail Sales Analysis Project --
create database sql_project;

-- Create Table --
drop table if exists retail_sales;
create table retail_sales
      (
        transactions_id	int primary key,
		sale_date date,
        sale_time time,
        customer_id	int,
        gender varchar(15),
        age	int,
        category varchar(15),
        quantiy	int,
        price_per_unit float,
        cogs float,
        total_sale float
       );

-- Data Cleaning --
select * from retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

delete from retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- Data Exploration --
-- How many sales we have?
select count(*) as total_sale from retail_sales;

-- How many unique customers we have?
select count(distinct customer_id) as total_customer from retail_sales;

-- How many unique category we have?
select count(distinct category) as total_customer from retail_sales;
select distinct category from retail_sales;

-- Data Analysis & Business key problems & answers
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-23'?
select * from retail_sales where sale_date = '2022-11-23';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales where category = 'Clothing' and TO_CHAR(sale_date ,'YYYY-MM')= '2022-11' and quantiy >= 4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale) as net_sale, COUNT(*) as total_orders from retail_sales group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age)) from retail_sales where category = 'Beauty'; 

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales where total_sale > 1000 ;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select count(*) as total_tran , gender , category from retail_sales group by gender , category order by category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select year, month, average_sale from
(
select 
YEAR (sale_date) AS year , 
MONTH (sale_date) AS month, 
round(avg(total_sale)) as average_sale,
RANK() OVER(PARTITION BY YEAR (sale_date) 
            ORDER BY AVG(total_sale) DESC) as rnk
from retail_sales
            group by  YEAR (sale_date) , MONTH (sale_date)
            order by year, average_sale desc
) as t1
WHERE rnk = 1
;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id , sum(total_sale) from retail_sales 
group by customer_id 
order by sum(total_sale) desc 
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;


--- END OF THE PROJECT ---









       


