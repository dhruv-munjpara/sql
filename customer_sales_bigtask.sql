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

#=====================================Display sales ordered by price (highest first).
SELECT * FROM sales_data ORDER BY price;

#====================Display sales ordered by invoice_date (latest first).
select * from sales_data order by invoice_date desc;

#Find the minimum price from sales.
select min(price) from sales_data;



