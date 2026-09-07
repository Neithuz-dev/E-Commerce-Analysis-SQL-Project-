create database Amazon_sales;
use amazon_sales;

describe amazon;
create table customers_data (
customerid varchar(10) primary key,
customername varchar(50),
city varchar(20),
state varchar(10),
country varchar(20)
);

select customerid, count(*) as order_count
from amazon
group by customerid
having count(*) > 1;

insert into customers_data (
customerid ,
customername ,
city ,
state ,
country )
select distinct customerid,
max(customername),max(city),max(State),max(country)
from amazon
group by customerid;

select * from customers_data;

create table orders(
orderid varchar(20) primary key,
orderdate varchar(20),
customerid varchar(20),
productid varchar(20),
productname varchar(20),
category varchar(20),
brand varchar(20),
quantity int,
unitprice decimal(3,2),
discount decimal(3,2),
tax decimal(3,2),
shippingcost decimal(3,2),
totalamount decimal(3,2),
paymentmethod varchar(20),
orderstatus varchar(20),
sellerid varchar(20)
);
insert into orders(
orderid,
orderdate,
customerid,
productid,
productname,
category,
brand,
quantity,
unitprice,
discount,
tax,
shippingcost,
totalamount,
paymentmethod,
orderstatus,
sellerid
)
select
orderid,
orderdate,
customerid,
productid,
productname,
category,
brand,
quantity,
unitprice,
discount,
tax,
shippingcost,
totalamount,
paymentmethod,
orderstatus,
sellerid
from amazon;

alter table orders
modify column unitprice decimal(10,2);
alter table orders
modify column totalamount decimal(10,2);
alter table orders
modify column tax decimal(10,2);
alter table orders
modify column shippingcost decimal(10,2);

alter table orders
modify column productname varchar(100);

select * 
from orders;

alter table orders
modify column orderdate date;