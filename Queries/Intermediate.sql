#Intermediate
use amazon_sales;
#1. What is the total revenue generated so far?
select round(sum(totalamount)) as total_revenue
from orders;

#2. Which product category has sold the most units?
select category, sum(quantity) as total_units
from orders
group by category
order by total_units desc
limit 1;

#3. List the top 5 customers by total amount spent.
select c.customername ,sum(o.totalamount) as total_spent
from customers_data c
join orders o
on c.customerid=o.customerid
group by c.customerid,c.customername
order by total_spent desc
limit 5;

#4. Which sellers have generated more than a set revenue threshold(10000)? (HAVING)
select sellerid ,sum(totalamount) as total_revenue
from orders
group by sellerid
having sum(totalamount) >10000
order by total_revenue desc;

#5. What is the average order value per city?
select round(avg(o.totalamount),2) as average_order_value , c.city 
from orders o
join customers_data c
on c.customerid=o.customerid
group by city
order by average_order_value desc;

#6. How many orders did each payment type handle, and what's the average payment value per type?
select paymentmethod , count(*) as no_orders ,round(avg(totalamount),2) as avg_payment_values
from orders
group by paymentmethod;

#7.Which 10 products have sold the highest number of units?
select productname,sum(quantity) as total_units
from orders 
group by productname
order by sum(quantity) desc
limit 10;

#8. Find cities that have generated more than 5,00,000 in total revenue
select c.city ,sum(totalamount) as total_revenue
from orders o
inner join customers_data c
on c.customerid =o.customerid
group by c.city
having total_revenue >500000;

#9. Find all customers and their orders, including customers who have never placed an order.
select c.*,o.*
from customers_data c
left join orders o
on c.customerid =o.customerid;

#10.Find customers who have never placed an order.
select c.customername ,o.orderid
from customers_data c
left join orders o
on c.customerid =o.customerid
where o.orderid is null;

#11. Find customers who have placed at least one order and show their total revenue.
select c.customername,sum(o.totalamount) as total_revenue
from customers_data c
left join orders o 
on c.customerid =o.customerid
group by c.customerid,c.customername
having total_revenue >0
order by total_revenue desc;




