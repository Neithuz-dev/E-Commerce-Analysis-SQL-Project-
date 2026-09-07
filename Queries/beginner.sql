#beginner
use amazon_sales;
#1. List all customers from a specific city.
select *
from customers_data
where city = "Austin";

select * 
from customers_data
where city ="chicago";

#2. Show all orders placed in the last 30 days.
select *
from orders
where orderdate between '2024-01-09' and '2024-01-10';

#3. Find the 10 most expensive products.

select productname,unitprice
from orders
order by productname desc
limit 10;

#4. List all orders with status = 'delivered'
select * 
from orders
where orderstatus ="delivered";

#5. Find customers who signed up in 2025.
select count(*)
from orders
where orderdate between '2024-01-01' and '2024-12-31';

#6 .Find the total number of orders
select count(*) as total_orders from orders;

#7.Display the order ID, customer ID, total amount, and payment method for orders where the payment method is Credit Card.
select orderid,customerid,totalamount,paymentmethod
from orders
where paymentmethod = 'credit card';

#8.Calculate the total number of units sold across all orders.
select sum(quantity) as units_sold
from orders;
