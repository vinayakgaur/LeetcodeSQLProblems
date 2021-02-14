-- Table: Orders
-- 
-- +-----------------+----------+
-- | Column Name     | Type     |
-- +-----------------+----------+
-- | order_number    | int      |
-- | customer_number | int      |
-- +-----------------+----------+
-- order_number is the primary key for this table.
-- This table contains information about the order ID and the customer ID.
--  
-- 
-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
-- 
-- It is guaranteed that exactly one customer will have placed more orders than any other customer.




# Write your MySQL query statement below
with cte as (
select 
    customer_number
    , rank() over(order by count(order_number) desc) as ranking
from 
    orders
group by 1
)
select 
    customer_number
from cte 
where ranking = 1