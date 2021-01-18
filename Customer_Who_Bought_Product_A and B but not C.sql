Table: Customers

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
customer_id is the primary key for this table.
customer_name is the name of the customer.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+
order_id is the primary key for this table.
customer_id is the id of the customer who bought the product "product_name".
 

Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

-----------------------------------------------------------




with a as
(
select 
    customer_id,
    customer_name
 from   
    customers
 join orders using (customer_id)
 where product_name = "A"),
b as (
select 
    customer_id,
    customer_name
 from   
    customers
 join orders using (customer_id)
 where product_name = "B")
 select 
    a.customer_id, a.customer_name
from a join b using (customer_id)
where customer_id NOT IN (select customer_id from orders where product_name = "C" )
order by 1