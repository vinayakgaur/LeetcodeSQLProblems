-- Table: Customers
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- +---------------+---------+
-- customer_id is the primary key for this table.
-- This table contains information about customers.
--  
-- 
-- Table: Orders
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | order_date    | date    |
-- | customer_id   | int     |
-- | cost          | int     |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- This table contains information about the orders made by customer_id.
-- Each customer has one order per day.
--  
-- 
-- Write an SQL query to find the most recent 3 orders of each user. If a user ordered less than 3 orders return all of their orders.
-- 
-- Return the result table sorted by customer_name in ascending order and in case of a tie by the customer_id in ascending order. If there still a tie, order them by the order_date in descending order.





# Write your MySQL query statement below


with data as
(select 
    c.name as customer_name, 
    c.customer_id,
    o.order_id,
    o.order_date,
    row_number() over(partition by customer_id order by order_date desc) as ranking
from customers as c
 join orders as o using (customer_id)
)
select 
    customer_name,
    customer_id,
    order_id,
    order_date
from 
    data
where ranking <=3
order by 1,2, order_date desc