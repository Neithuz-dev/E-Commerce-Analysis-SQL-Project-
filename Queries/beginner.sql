#beginner
select *
from customers_data
where city = "Austin";

select * 
from customers_data
where city ="chicago";

select *
from orders
where orderdate between '2024-01-09' and '2024-01-10';

select productname,unitprice
from orders
order by productname desc
limit 10;

select * 
from orders
where orderstatus ="delivered";
