-- Creating Database 
create database if not exists Salesberry;
-- Creating tables
CREATE TABLE Sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    prouduct_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10 , 2 ) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6 , 4 ),
    total DECIMAL(10 , 2 ) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10 , 2 ) NOT NULL,
    gross_margin_percentage FLOAT(11 , 9 ),
    gross_income DECIMAL(10 , 2 ) NOT NULL,
    rating FLOAT(2 , 1 )
);
-- ------------------------------------------------------------------------------------------------
-- --------------------------------- **Feature Engineering:**--------------------------------------- 
-- -----------------------------------------------------------------------------------------------
-- 1. Add a new column named `time_of_day`

-- adding column
alter table sales 
add column time_of_day varchar(10);

-- updating the column value
UPDATE salesberry.sales 
SET 
    time_of_day = (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);

-- 2. Add a new column named `day_name` 

-- adding new column
alter table sales
add column day_name varchar(15);

-- updating column
UPDATE sales 
SET 
    day_name = DAYNAME(date);

-- 3.  Add a new column named `month_name

-- Add column
alter table sales
add column month_name varchar(15);

-- Update table
UPDATE sales 
SET 
    month_name = MONTHNAME(date);


-- ------------------------------------------------------------------------------------------------
-- --------------------- **Exploratory Data Analysis (EDA):**--------------------------------------- 
-- -----------------------------------------------------------------------------------------------

SELECT DISTINCT
    city
FROM
    sales;

-- 2. In which city is each branch?
SELECT DISTINCT
    city, branch
FROM
    sales;

### Product Insight
1. How many unique product lines does the data have?
SELECT DISTINCT
    prouduct_line
FROM
    sales;

2. What is the most common payment method?
SELECT DISTINCT
    payment_method, SUM(quantity) AS Total
FROM
    sales
GROUP BY payment_method
ORDER BY total DESC;

3. What is the most selling product line?
SELECT DISTINCT
    prouduct_line, SUM(quantity) AS Total
FROM
    sales
GROUP BY prouduct_line
ORDER BY total DESC;

4. What is the total revenue by month?
SELECT 
    month_name, SUM(total) AS total
FROM
    sales
GROUP BY month_name
ORDER BY total DESC;

5. What month had the largest COGS?
SELECT 
    month_name, SUM(cogs) AS largeCogs
FROM
    sales
GROUP BY month_name
ORDER BY largeCogs DESC;

6. What product line had the largest revenue?
SELECT 
    prouduct_line, SUM(total) AS Revenue
FROM
    sales
GROUP BY prouduct_line
ORDER BY revenue DESC; 

7. What is the city with the largest revenue?
SELECT 
    city, SUM(total) AS revenue
FROM
    sales
GROUP BY city
ORDER BY revenue DESC;

8. What product line had the largest VAT?
SELECT 
    prouduct_line, ROUND(AVG(vat), 2) AS vat
FROM
    sales
GROUP BY prouduct_line
ORDER BY vat DESC;

9. Fetch each product line and add a column to those product line showing "Good", "Bad". 
Good if its greater than average sales
SELECT 
    prouduct_line,
    CASE
        WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'Bad'
    END AS remarks
FROM
    sales
GROUP BY prouduct_line;

10. Which branch sold more products than average product sold?
SELECT 
    branch, SUM(quantity) AS qty
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales);

11. What is the most common product line by gender?
SELECT DISTINCT
    gender, prouduct_line, COUNT(gender) AS Count
FROM
    sales
GROUP BY gender , prouduct_line
ORDER BY count DESC;

12. What is the average rating of each product line?
SELECT 
    prouduct_line, ROUND(AVG(rating), 2) AS rating
FROM
    sales
GROUP BY prouduct_line
ORDER BY rating DESC;

13.	What is the average unit price of products in each product line?
SELECT 
    prouduct_line, ROUND(AVG(unit_price), 2) AS average_price
FROM
    sales
GROUP BY prouduct_line;

14.	Which product line has the highest total quantity sold?
SELECT 
    prouduct_line, SUM(quantity) AS total_qty
FROM
    sales
GROUP BY prouduct_line
ORDER BY total_qty DESC
LIMIT 1;

15.	What is the average gross income for each product line?
SELECT 
    prouduct_line,
    ROUND(AVG(gross_income), 2) AS avg_gross_income
FROM
    sales
GROUP BY prouduct_line;

### Sales Insight
16. Number of sales made in each time of the day per weekday
SELECT 
    time_of_day, COUNT(*) AS total_sales
FROM
    sales
WHERE
    day_name = 'Sunday'
GROUP BY time_of_day
ORDER BY total_sales DESC;

17. Which of the customer types brings the most revenue?
SELECT 
    customer_type, SUM(total) AS Rev
FROM
    sales
GROUP BY customer_type
ORDER BY rev DESC;

18. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
SELECT 
    city, ROUND(AVG(vat), 2) AS Vat
FROM
    sales
GROUP BY city
ORDER BY vat DESC;  

19. Which customer type pays the most in VAT?
SELECT 
    customer_type, ROUND(AVG(vat), 2) AS Vat
FROM
    sales
GROUP BY customer_type
ORDER BY vat DESC;

20.	What is the average total sales amount for each time of day?
SELECT 
    time_of_day, ROUND(AVG(total), 2) AS avg_sales
FROM
    sales
GROUP BY time_of_day;

21.	How does the average quantity sold vary by day of the week?
SELECT 
    day_name, ROUND(AVG(quantity), 2) AS avg_qty
FROM
    sales
GROUP BY day_name
ORDER BY CASE
    WHEN day_name = 'Sunday' THEN 1
    WHEN day_name = 'Monday' THEN 2
    WHEN day_name = 'Tuesday' THEN 3
    WHEN day_name = 'Wednesday' THEN 4
    WHEN day_name = 'Thursday' THEN 5
    WHEN day_name = 'Friday' THEN 6
    WHEN day_name = 'Saturday' THEN 7
END;

22.	Which branch generates the highest average revenue per sale?
SELECT 
    branch, ROUND(AVG(total), 2) AS avg_revenue
FROM
    sales
GROUP BY branch
ORDER BY avg_revenue DESC
LIMIT 1;

23.	What is the average VAT rate by payment method?
SELECT 
    payment_method, ROUND(AVG(vat), 2) AS avg_vat
FROM
    sales
GROUP BY payment_method;

24.	Which branch sold more products than the average quantity sold?
SELECT 
    branch, SUM(quantity) AS total_quantity
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(total_quantity)
    FROM
        (SELECT 
            SUM(quantity) AS total_quantity
        FROM
            sales
        GROUP BY branch) branch_totals);

25.	What is the trend in total revenue for each product line over the months?
SELECT 
    prouduct_line, month_name, SUM(total) AS total_revenue
FROM
    sales
GROUP BY month_name , prouduct_line
ORDER BY prouduct_line , CASE month_name
    WHEN 'January' THEN 1
    WHEN 'February' THEN 2
    WHEN 'March' THEN 3
    WHEN 'April' THEN 4
    WHEN 'May' THEN 5
    WHEN 'June' THEN 6
    WHEN 'July' THEN 7
    WHEN 'August' THEN 8
    WHEN 'September' THEN 9
    WHEN 'October' THEN 10
    WHEN 'November' THEN 11
    WHEN 'December' THEN 12
END;

26.	How does the total revenue vary across different days of the week?
SELECT 
    day_name, SUM(total) AS total_revenue
FROM
    sales
GROUP BY day_name
ORDER BY CASE
    WHEN day_name = 'Sunday' THEN 1
    WHEN day_name = 'Monday' THEN 2
    WHEN day_name = 'Tuesday' THEN 3
    WHEN day_name = 'Wednesday' THEN 4
    WHEN day_name = 'Thursday' THEN 5
    WHEN day_name = 'Friday' THEN 6
    WHEN day_name = 'Saturday' THEN 7
END;

28.	What is the total COGS by branch?
SELECT 
    branch, SUM(cogs) AS total_COGS
FROM
    sales
GROUP BY branch;

29.	Which branch has the highest gross margin percentage?
SELECT 
    branch, AVG(gross_margin_percentage) AS avg_gross_margin
FROM
    sales
GROUP BY branch
ORDER BY avg_gross_margin DESC
LIMIT 1;

### Customer

30. How many unique customer types does the data have?
SELECT DISTINCT
    customer_type, COUNT(customer_type) AS Type
FROM
    sales
GROUP BY customer_type
ORDER BY customer_type DESC;

31. How many unique payment methods does the data have?
SELECT DISTINCT
    payment_method, COUNT(payment_method) AS Type
FROM
    sales
GROUP BY payment_method
ORDER BY type DESC;

32. What is the most common customer type?
SELECT DISTINCT
    customer_type, COUNT(customer_type) AS Type
FROM
    sales
GROUP BY customer_type
ORDER BY customer_type DESC;

33. Which customer type buys the most?
SELECT 
    customer_type, SUM(quantity) AS qty
FROM
    sales
GROUP BY customer_type
ORDER BY qty DESC;

34. What is the gender of most of the customers?
SELECT 
    gender, COUNT(*) AS gender_cnt
FROM
    sales
GROUP BY gender
ORDER BY gender_cnt DESC;

35. What is the gender distribution per branch?
SELECT DISTINCT
    branch, gender
FROM
    sales;

36.	Which customer type pays the most in VAT?
SELECT 
    customer_type, SUM(vat) AS total_VAT
FROM
    sales
GROUP BY customer_type
ORDER BY total_VAT DESC
LIMIT 1; 

37.	What is the average gross income per customer type?
SELECT 
    customer_type,
    ROUND(AVG(gross_income), 2) AS avg_gross_income
FROM
    sales
GROUP BY customer_type;

38.	Which city has the highest number of unique customers?
SELECT 
    city, COUNT(DISTINCT invoice_id) AS unique_customer
FROM
    sales
GROUP BY city
ORDER BY unique_customer DESC
LIMIT 1;

39.	What is the distribution of ratings across different customer types?
SELECT 
    customer_type,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating,
    COUNT(rating) AS total_rating
FROM
    sales
GROUP BY customer_type;

40.	What is the average rating given by each gender?
SELECT 
    gender, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY gender;

41. Which time of the day do customers give most ratings?
SELECT 
    time_of_day, ROUND(AVG(rating), 2) AS rating
FROM
    sales
GROUP BY time_of_day
ORDER BY rating DESC;

42. Which time of the day do customers give most ratings per branch?
SELECT 
    time_of_day, branch, ROUND(AVG(rating), 2) AS Rating
FROM
    sales
GROUP BY time_of_day , branch
ORDER BY rating DESC;

43. Which day of the week has the best avg ratings?
SELECT 
    day_name, ROUND(AVG(rating), 2) AS Rating
FROM
    sales
GROUP BY day_name
ORDER BY rating DESC;

44. Which day of the week has the best average ratings per branch?
SELECT 
    day_name, branch, ROUND(AVG(rating), 2) AS avg_rating
FROM
    sales
GROUP BY day_name , branch
HAVING ROUND(AVG(rating), 2) = (SELECT 
        MAX(avg_rating)
    FROM
        (SELECT 
            branch, ROUND(AVG(rating), 2) AS avg_rating
        FROM
            sales
        GROUP BY day_name , branch) subquery
    WHERE
        subquery.branch = sales.branch)
ORDER BY branch;

45.	How does the quantity purchased vary by gender?
SELECT 
    gender, SUM(quantity) AS total_qty
FROM
    sales
GROUP BY gender

46.	What is the most common payment method among different customer types?
SELECT 
    customer_type, payment_method
FROM
    (SELECT 
        customer_type, payment_method, COUNT(*) AS method_count
    FROM
        sales
    GROUP BY customer_type , payment_method) AS counts
WHERE
    (customer_type , method_count) IN (SELECT 
            customer_type, MAX(method_count)
        FROM
            (SELECT 
                customer_type, payment_method, COUNT(*) AS method_count
            FROM
                sales
            GROUP BY customer_type , payment_method) AS sub_counts
        GROUP BY customer_type)
ORDER BY customer_type;

Temporal Insights:
47.	What is the average number of sales per month?
SELECT 
    month_name, AVG(quantity) AS avg_sales
FROM
    sales
GROUP BY month_name;

48.	What is the revenue trend for each day of the week?
SELECT 
    day_name, SUM(total) AS revenue
FROM
    sales
GROUP BY day_name
ORDER BY CASE
    WHEN day_name = 'Sunday' THEN 1
    WHEN day_name = 'Monday' THEN 2
    WHEN day_name = 'Tuesday' THEN 3
    WHEN day_name = 'Wednesday' THEN 4
    WHEN day_name = 'Thursday' THEN 5
    WHEN day_name = 'Friday' THEN 6
    WHEN day_name = 'Saturday' THEN 7
END;

49.	How does the average revenue vary by the day and branch?
SELECT 
    day_name, branch, AVG(total) AS avg_revenue
FROM
    sales
GROUP BY day_name , branch
ORDER BY CASE
    WHEN day_name = 'Sunday' THEN 1
    WHEN day_name = 'Monday' THEN 2
    WHEN day_name = 'Tuesday' THEN 3
    WHEN day_name = 'Wednesday' THEN 4
    WHEN day_name = 'Thursday' THEN 5
    WHEN day_name = 'Friday' THEN 6
    WHEN day_name = 'Saturday' THEN 7
END , branch;

50.	What is the trend of average ratings given over the year?
SELECT 
    year, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY year

51.	What percentage of total sales is contributed by each time of day?
SELECT 
    time_of_day,
    SUM(quantity) AS total_sales,
    (SUM(quantity) / total_sales.total) * 100 AS percentage_of_total
FROM
    sales
        JOIN
    (SELECT 
        SUM(quantity) AS total
    FROM
        sales) AS total_sales
GROUP BY time_of_day , total_sales.total
ORDER BY time_of_day;

52.	What is the average quantity sold ?
SELECT 
    AVG(quantity) AS averag_qty_sold
FROM
    sales

General Insights:
53.	What percentage of total sales is contributed by each branch?
SELECT 
    branch,
    SUM(quantity) AS total_sales,
    (SUM(quantity) / (SELECT 
            SUM(quantity)
        FROM
            sales) * 100) AS percentage_sales
FROM
    sales
GROUP BY branch

54.	What is the highest single sale amount recorded?
SELECT 
    MAX(total) AS highest_sale
FROM
    sales;

55.	Which branch has the highest average quantity sold per transaction?
SELECT 
    branch, AVG(quantity) AS avg_qty
FROM
    sales
GROUP BY branch
ORDER BY avg_qty DESC
LIMIT 1;

56.	What is the average COGS per product line?
SELECT 
    prouduct_line, ROUND(AVG(cogs), 2) AS avg_COGS
FROM
    sales
GROUP BY prouduct_line

57.	How does the average gross income vary across different cities?
SELECT 
    city, AVG(gross_income) AS avg_gross_income
FROM
    sales
GROUP BY city;

58.	What is the average rating for each branch?
SELECT 
    branch, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY branch
ORDER BY avg_rating DESC;

59.	What percentage of sales come from each gender?
SELECT 
    gender,
    SUM(quantity) AS total_sales,
    SUM(quantity) / (SELECT 
            SUM(quantity)
        FROM
            sales) * 100 AS sales_percentage
FROM
    sales
GROUP BY gender;

60.	Which city has the highest average unit price for products sold?
SELECT 
    city, ROUND(AVG(unit_price), 2) AS highest_avg_unit_price
FROM
    sales
GROUP BY city
ORDER BY highest_avg_unit_price DESC
LIMIT 1;



