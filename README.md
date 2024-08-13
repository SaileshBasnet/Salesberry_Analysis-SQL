# Salesberry Data Analysis - SQL 

## Introduction
This project offers an in-depth analysis of Salesberry’s fictional sales data. The goal is to generate actionable insights that can be used for decision-making, strategic planning, and operational improvements.

## Objective of Project
The primary objective is to derive valuable insights that simulate real-world business scenarios, helping to understand sales performance, customer behavior, and operational trends.

## Data Overview
### Files and Columns
salesberry_report.csv
- invoice_id: Unique identifier for each transaction.
- branch: The branch of the store.
- city: City where the store branch is located.
- customer_type: Type of customer.
- gender: Gender of the customer.
- prouduct_line: Category of the product sold.
- unit_price: Price per unit of the product.
- quantity: Number of units purchased.
- VAT: Value-added tax applied to the transaction.
- total: Total amount of the transaction including VAT.
- date: Date of the transaction.
- time: Time of the transaction.
- payment_method: Method used to pay.
- cogs: Cost of goods sold for the transaction.
- gross_margin_percentage: Percentage representing the gross margin on the sale.
- gross_income: Gross income from the transaction.
- rating: Customer rating for product.

### Data Sources: 
For this analysis, the dataset is fictional and serves to simulate real-world data scenarios : [link of dataset](https://github.com/SaileshBasnet/Salesberry_Analysis-SQL/blob/main/salesberry_report.csv)

## Methodology
### Tools Used
SQL was used for data querying, aggregation, and transformation to perform queries, aggregations, and calculations directly on the database.
- Tools used: MySQL, MySQL Workbench

## Analysis Methods
For this analysis, I tried to solve business related question with different category. These are the detailed breakdown of the questions and insights explored.
### 1. Product Insights

- **Unique Product Lines**: The dataset includes a variety of product lines. Each line contributes differently to overall sales and revenue.

- **Most Common Payment Method**: The analysis reveals the most frequently used payment method, indicating customer preferences for payment options.

- **Top-Selling Product Line**: The product line with the highest sales volume is identified, highlighting key products driving revenue.

- **Total Revenue by Month**: Revenue trends across different months are examined to understand seasonal patterns and peak sales periods.

- **Highest COGS by Month**: Identifies the month with the largest cost of goods sold, which can inform inventory and cost management strategies.

- **Product Line with Highest Revenue**: Determines which product line generates the most revenue, guiding marketing and sales efforts.

- **City with Highest Revenue**: Reveals the city contributing the most to overall sales, useful for targeted marketing and resource allocation.

- **Product Line with Highest VAT**: Shows the product line with the most significant VAT contributions, which can be useful for tax planning.

- **Product Line Performance**: Each product line is evaluated as "Good" or "Bad" based on its performance compared to average sales.

- **Branches Exceeding Average Product Sales**: Identifies branches that outperform average sales, highlighting successful locations.

- **Most Common Product Line by Gender**: Explores product preferences across different genders, aiding in targeted marketing strategies.

- **Average Rating of Each Product Line**: Provides insight into customer satisfaction across different product lines.

- **Average Unit Price by Product Line**: Evaluates pricing strategies for each product line, helping to align pricing with market conditions.

- **Product Line with Highest Quantity Sold**: Highlights the product line with the largest sales volume, valuable for inventory and supply chain planning.

- **Average Gross Income by Product Line**: Assesses profitability across product lines, guiding investment and pricing strategies.

---

## 2. Sales Insights

- **Sales by Time of Day per Weekday**: Analyzes sales distribution throughout the day, providing insights into optimal sales times for different days of the week.

- **Customer Type Revenue Contribution**: Identifies which customer types contribute the most to revenue, helping to tailor marketing and sales strategies.

- **City with Highest VAT**: Shows the city with the highest average VAT rate, relevant for regional tax planning.

- **Customer Type VAT Contribution**: Determines which customer types pay the most VAT, useful for understanding tax impacts.

- **Average Sales Amount by Time of Day**: Examines average sales figures for different times of day, assisting in scheduling and staffing decisions.

- **Average Quantity Sold by Day of the Week**: Provides insights into sales patterns across the week, helping with inventory management and promotions.

- **Branch with Highest Average Revenue per Sale**: Identifies branches that achieve the highest average revenue per transaction, guiding resource allocation.

- **Average VAT Rate by Payment Method**: Evaluates VAT rates associated with different payment methods, providing insights into payment preferences and tax implications.

- **Branches Exceeding Average Quantity Sold**: Determines branches that surpass average sales quantities, highlighting successful performance.

- **Revenue Trend by Product Line Over Months**: Tracks revenue trends for each product line across months, aiding in forecasting and trend analysis.

- **Total Revenue by Day of the Week**: Analyzes revenue generation patterns across different days, useful for optimizing sales strategies.

- **Average Revenue by Day and Branch**: Examines revenue variation by day and branch, assisting in performance evaluation and strategy development.

- **Trend of Average Ratings Over the Year**: Provides insights into rating trends throughout the year, helping to monitor customer satisfaction.

- **Percentage of Total Sales by Time of Day**: Assesses the contribution of different times of day to total sales, guiding operational and marketing strategies.

- **Average Quantity Sold**: Offers a benchmark for average sales volume, aiding in performance assessment and goal setting.

---

## 3. Customer Insights

- **Unique Customer Types**: Identifies the number of distinct customer types, aiding in market segmentation.

- **Unique Payment Methods**: Examines the diversity of payment methods, reflecting customer preferences and transaction behavior.

- **Most Common Customer Type**: Highlights the most frequent customer type, informing targeted marketing efforts.

- **Customer Type with Highest Quantity Purchased**: Determines which customer type buys the most, guiding inventory and sales strategies.

- **Gender Distribution**: Provides insights into the gender composition of customers, aiding in demographic analysis.

- **Gender Distribution per Branch**: Explores how gender distribution varies by branch, helping to understand regional differences.

- **Customer Type with Highest VAT Contribution**: Identifies which customer types contribute the most to VAT, valuable for tax planning.

- **Average Gross Income by Customer Type**: Assesses profitability across different customer types, guiding strategic decisions.

- **City with Highest Unique Customers**: Reveals the city with the most unique customers, assisting in market focus and expansion planning.

- **Rating Distribution by Customer Type**: Analyzes ratings provided by different customer types, helping to understand satisfaction levels.

- **Average Rating by Gender**: Evaluates how different genders rate their experiences, providing insights into customer satisfaction.

- **Rating Trends by Time of Day**: Identifies when customers give the highest ratings, assisting in operational improvements.

- **Rating Trends by Time of Day and Branch**: Examines rating patterns by time of day and branch, useful for detailed performance analysis.

- **Best Average Ratings by Day of the Week**: Determines which day of the week receives the highest average ratings, informing customer engagement strategies.

- **Best Average Ratings by Day and Branch**: Identifies the best-performing day and branch based on ratings, aiding in branch performance evaluation.

- **Quantity Purchased by Gender**: Analyzes how quantity purchased varies by gender, providing insights into buying behavior.

- **Most Common Payment Method by Customer Type**: Examines payment method preferences among different customer types, guiding payment system enhancements.

---

## 4. Temporal Insights

- **Average Number of Sales per Month**: Provides a benchmark for monthly sales performance, useful for trend analysis and forecasting.

- **Revenue Trend by Day of the Week**: Analyzes how revenue varies by day, helping to optimize sales strategies and operations.

- **Average Revenue by Day and Branch**: Examines daily revenue patterns across branches, assisting in performance monitoring and resource allocation.

- **Average Ratings Trend Over the Year**: Tracks changes in average ratings throughout the year, reflecting shifts in customer satisfaction.

- **Percentage of Sales by Time of Day**: Assesses how different times of day contribute to total sales, guiding scheduling and promotional efforts.

- **Average Quantity Sold**: Offers a baseline for evaluating sales performance, aiding in goal setting and performance tracking.

---

## 5. General Insights

- **Percentage of Sales by Branch**: Determines the sales contribution of each branch, helping to allocate resources and assess branch performance.

- **Highest Single Sale Amount**: Identifies the largest sale recorded, useful for understanding high-value transactions.

- **Branch with Highest Average Quantity Sold per Transaction**: Highlights the branch achieving the highest average quantity per transaction, guiding performance evaluation.

- **Average COGS by Product Line**: Analyzes cost of goods sold for each product line, informing cost management strategies.

- **Average Gross Income by City**: Assesses profitability across different cities, guiding market focus and expansion strategies.

- **Average Rating by Branch**: Evaluates customer satisfaction across branches, helping to identify areas for improvement.

- **Percentage of Sales by Gender**: Examines sales contributions by gender, providing insights into customer demographics.

- **City with Highest Average Unit Price**: Identifies the city with the highest average unit price, reflecting pricing strategies and market conditions.

### For a detailed look at the SQL queries used and their specific applications, refer to this link: [SQL Queries for Analysis](https://github.com/SaileshBasnet/Salesberry_Analysis-SQL/blob/main/salesberry_Project.sql).
---

## Summary
The analysis of the Salesberry dataset provides valuable insights into product performance, sales trends, customer behavior, and operational efficiency.
