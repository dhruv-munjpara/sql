use bigtask;
select count(*) from customer_data;
select count(*) from sales_data;
select * from customer_data;
select * from sales_data;
#Show only invoice_no, customer_id, and price.
select invoice_no,customer_id,price from sales_data;

#Find all sales where the category is Clothing.
select * from sales_data where category="Clothing";

#List all unique product categories. in gujrati
SELECT DISTINCT category FROM sales_data;
select category from sales_data group by category;

#Show all distinct shopping malls.
SELECT DISTINCT Shopping_mall FROM sales_data;
select shopping_mall from sales_data group by shopping_mall;

#Find sales where quantity is greater than 3.
select * from sales_data where quantity<3;

#Display records where price is greater than 2000.
select * from sales_data where price<2000;

#Show all sales made in Kanyon mall.
select * from sales_data where shopping_mall="kanyon";

#Count total number of invoices.
select count(*) as invoices from sales_data;

#Count total number of customers.
select count(*) as total_customer from customer_data;

#Display sales ordered by price (highest first).
SELECT category,sum(price) as total_sales FROM sales_data group by category order by total_sales desc;

#Display sales ordered by invoice_date (latest first).
select invoice_date,sum(price) as total_salse from sales_data group by invoice_date order by invoice_date desc;

#Find the minimum price from sales.
select min(price) from sales_data;

#Find the maximum quantity sold in a single invoice.
select max(quantity) from sales_data;

#Find the average price of all sales.
select avg(price) from sales_data;

#Find total revenue (quantity × price).
SELECT invoice_no, quantity,price,(quantity * price) AS total_revenue FROM sales_data GROUP BY invoice_no;

#Find total quantity sold across all sales.
select sum(quantity) as total_quan_sold from sales_data;

#Find total revenue per category.
select category,sum(quantity* price) as total_revenue from sales_data
group by category;

#Find average price per category.
select category,avg(price) as avg_price from sales_data group by category;

#Count number of invoices per shopping mall.
select count(invoice_no) as no_of_invoice,shopping_mall from sales_data group by shopping_mall;

#Find minimum and maximum price per category.
select min(price) as min_price,max(price) as max_pice, category
from sales_data group by category;

#Find average quantity per shopping mall.
select avg(quantity) as quantity ,shopping_mall from sales_data group by shopping_mall;

#Find total revenue per shopping mall.
select sum(quantity*price) as total_revenue ,shopping_mall from sales_data group by shopping_mall;

#Show categories with total revenue greater than 500,000.
select category ,sum(quantity*price) as total_revenue from sales_data group by category
having sum(quantity*price)>500000;

#Show shopping malls with more than 5,000 invoices.
select shopping_mall,count(invoice_no) as total_invoice from sales_data group by shopping_mall having count(invoice_no)>=5000;

#Find categories where average price is greater than 1,000.
select category,avg(price) as avg_price from sales_data group by category having avg(price)>1000;

#Find malls where total quantity sold is greater than 20,000.
select shopping_mall,sum(quantity) as total_quantity_sold from sales_data group by shopping_mall having sum(quantity)>20000;

#................Show customers who have more than 5 invoices.
SELECT
	COUNT(invoice_no) AS total_invoices
FROM sales_data
GROUP BY customer_id
HAVING COUNT(invoice_no) > 5;

#Find categories with more than 10,000 total quantity sold.
select category,sum(quantity) as total_quantity from sales_data group by category having sum(quantity)>10000;

#Show malls where average quantity per invoice is greater than 3.
select shopping_mall,avg(quantity) from sales_data group by shopping_mall having avg(quantity)>3;

#Find customers whose total spending is greater than 10,000.
SELECT customer_id,SUM(quantity * price) AS total_spending FROM sales_data GROUP BY customer_id
HAVING SUM(quantity * price) > 10000;

#Show categories with minimum price greater than 500.
select category,min(price) from sales_data group by category having min(price)>500;

#Show malls where total revenue is less than 100,000.
select shopping_mall ,sum(quantity*price) as total_revenue from sales_data group by shopping_mall having sum(quantity*price)>100000;

#Show all sales made in the year 2021.
select * from sales_data where year(invoice_date)=2021;

#Show all sales made in the year 2022.
select * from sales_data where year(invoice_date)=2022;

#Find total revenue per year.
select year(invoice_date) as Year, sum(quantity*price) as total_revenue from sales_data group by year(invoice_date);

#Find total revenue per month.
select sum(quantity*price) as total_revenue,month(invoice_date) from sales_data group by month(invoice_date);

#Find the month with highest total revenue.
select month(invoice_date) as month ,sum(quantity*price) as total_revanue from sales_data
group by month(invoice_date) order by total_revanue desc limit 1;

#Count number of invoices per year.
select count(invoice_no) as no_of_invoice , year(invoice_date) from sales_data group by year(invoice_date);

#Show sales made between two given dates.
SELECT * FROM sales_data WHERE invoice_date BETWEEN '2022-02-15' AND '2022-04-10';

#Find the top 5 highest priced invoices.
SELECT invoice_no,SUM(quantity * price) AS total_invoice_value FROM sales_data
GROUP BY invoice_no ORDER BY total_invoice_value DESC LIMIT 5;

#Find the top 3 categories by total revenue.
select category,sum(quantity*price) as total_revenue from sales_data group by category order by sum(quantity*price) desc limit 3;

#Find the shopping mall with highest total revenue.
select shopping_mall,sum(quantity*price) as total_revanue from sales_data GROUP BY shopping_mall order by sum(quantity*price) desc limit 1;

#Find the category with highest average price.
select category,avg(price) as ave_price from sales_data group by category order by avg(price) desc limit 1;

#Find customers who purchased from more than one category.
SELECT customer_id,COUNT(DISTINCT category) AS category_count FROM sales_data
GROUP BY customer_id HAVING COUNT(DISTINCT category) > 1;

#Find customers who purchased from more than one shopping mall.
SELECT customer_id FROM sales_data GROUP BY customer_id
HAVING COUNT(DISTINCT shopping_mall) > 1;

#Find the invoice with highest total amount (quantity × price).
SELECT invoice_no,SUM(quantity * price) AS total_amount
FROM sales_data GROUP BY invoice_no ORDER BY total_amount DESC LIMIT 1;

#Rank shopping malls based on total revenue (highest to lowest)
SELECT shopping_mall,SUM(quantity * price) AS total_revenue FROM sales_data
GROUP BY shopping_mall ORDER BY total_revenue DESC;

