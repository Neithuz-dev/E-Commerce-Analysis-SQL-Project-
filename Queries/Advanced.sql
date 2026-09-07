#Advanced
use amazon_sales;
#1 Rank products by total revenue within each category using RANK() or DENSE_RANK().
select productname,category,sum(totalamount) as total_revenue , 
dense_rank() over (partition by productname order by sum(totalamount) desc) AS rank_products
from orders
group by productname,category;

#2 Find customers who spent more than the average customer spend (subquery).
select c.customername,sum(o.totalamount) as more_spend
from customers_data c 
join orders o
on c.customerid=o.customerid
group by c.customerid,c.customername
having sum(o.totalamount) >(select avg(total_spend)
from (select customerid,sum(totalamount) as total_spend
from orders
group by customerid ) as customer_avg_spend);

 #3.Identify repeat customers (customers with more than 2 order) using GROUP BY + HAVING.
 select c.customername,count(*) as order_count
 from orders o
 join customers_data c 
 on c.customerid =o.customerid
group by c.customerid,c.customername
having count(*)>2;

# 4.Create a view called monthly_sales_summary that a dashboard tool could read directly.

create view monthy_sales_summary as
select year(orderdate) as sales_year,
month(orderdate) as sales_month,
count(*) as total_orders,
sum(totalamount) as total_sales
from orders
group by year(orderdate), month(orderdate);

select * from monthy_sales_summary;

#6. Write a stored procedure get_customer_history(customer_id) that returns a customer's full order history.
delimiter //

create procedure get_customer_history(in p_customer_id varchar(20))
begin 
select o.orderid,o.orderdate,o.productid,
o.productname,o.category,o.quantity,o.unitprice,
o.totalamount,o.paymentmethod,o.orderstatus
from orders o
where o.customerid = p_customer_id
order by o.orderdate desc;
end//
delimiter ;

call get_customer_history('CUST030059');

#7.Create a stored procedure get_customer_orders(customer_id) that returns the number of orders and total spending for a given customer.
delimiter //

create procedure get_customer_orders(in p_customerid varchar(20))
begin
select customerid,count(*) as orders_count ,sum(totalamount) as total_spent
from orders
where customerid =  p_customerid
group by customerid;
end//

delimiter ;
call get_customer_orders('CUST048677');


#8.Find the second-highest spending customer.
select customerid,customername ,total_spent
from(
select c.customerid,c.customername,sum(o.totalamount) as total_spent
from customers_data c
join orders o
on c.customerid =o.customerid
group by c.customerid, c.customername) as customer_spend
order by total_spent desc
limit 1 offset 1;

