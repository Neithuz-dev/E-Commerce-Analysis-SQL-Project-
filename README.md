# E-Commerce-Analysis-SQL-Project-
# E-Commerce Analysis SQL Project

SQL analysis of an e-commerce platform's sales, customers, products, sellers, orders, and revenue using MySQL.

## 🛠️ Tools Used

* MySQL
* MySQL Workbench
* SQL

## 📊 Dataset Source

The dataset used in this project is the **Amazon Sales Dataset** from Kaggle.

**Dataset:** [Amazon Sales Dataset](https://www.kaggle.com/datasets/rohiteng/amazon-sales-dataset)

The raw dataset is stored in the `Raw_data` folder.

## 🗂️ Project Structure

```text
E-Commerce-Analysis-SQL-Project/
│
├── README.md
│
├── schema/
│   └── Schema_creation.sql
│
├── Raw_data/
│   └── Amazon.csv
│
├── queries/
│   ├── beginner.sql
│   ├── Intermediate.sql
│   └── Advanced.sql
│
└── screenshots/
    ├── result_screenshots/
    │   ├── total_revenue.png
    │   ├── top_category.png
    │   ├── top_customers.png
    │   ├── top_sellers.png
    │   └── average_order_city.png
    |    └── other screenshots
    │
    └── ER.png

```

## 🔗 ER Diagram

The database was organized into related tables using primary keys and foreign keys.

![ER Diagram](screenshots/ER.png)

## 🔍 Key Business Questions

### 1. What is the total revenue generated?

```sql
select sum(totalamount) as total_revenue
from orders;
```

**Purpose:** Calculates the total revenue generated from all orders.

**Result:**

![Total Revenue](screenshots/result_screenshots/total_revenue.png)

---

### 2. Which product category sold the most units?

```sql
select category, sum(quantity) as total_units
from orders
group by category
order by total_units desc
limit 1;
```

**Purpose:** Identifies the product category with the highest number of units sold.

**Result:**

![Top Category](screenshots/result_screenshots/top_category.png)

---

### 3. Who are the top 5 customers by total spending?

```sql
select c.customername, sum(o.totalamount) as total_spent
from customers_data c
join orders o
    on c.customerid = o.customerid
group by c.customerid, c.customername
order by total_spent desc
limit 5;
```

**Purpose:** Identifies the customers who have spent the most.

**Result:**

![Top Customers](screenshots/result_screenshots/top_customers.png)

---

### 4. Which sellers generated more than 10,000 in revenue?

```sql
select sellerid, sum(totalamount) as total_revenue
from orders
group by sellerid
having sum(totalamount) > 10000
order by total_revenue desc;
```

**Purpose:** Identifies sellers whose total revenue exceeds 10,000.

**Result:**

![Top Sellers](screenshots/result_screenshots/top_sellers.png)

---

### 5. What is the average order value per city?

```sql
select c.city, avg(o.totalamount) as average_order_value
from orders o
join customers_data c
    on c.customerid = o.customerid
group by c.city
order by average_order_value desc;
```

**Purpose:** Compares the average order value across different cities.

**Result:**

![Average Order Value by City](screenshots/result_screenshots/average_order_city.png)

## 📚 What I Learned

Through this project, I practiced SQL concepts for analyzing real-world e-commerce data and answering business-related questions. I learned how to use joins, aggregate functions, grouping, filtering, views, and stored procedures to extract useful insights from relational data.

I also gained practical experience designing tables using primary keys and foreign keys and creating an ER diagram in MySQL Workbench.

## 📌 SQL Concepts Practiced

* `select`
* `where`
* `order by`
* `group by`
* `having`
* `inner join`
* `sum()`
* `avg()`
* `count()`
* `max()`
* Subqueries
* Views
* Stored procedures
* Date filtering
* Primary keys
* Foreign keys
* Data normalization
* ER diagrams
