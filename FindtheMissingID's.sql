-- Table: Customers
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | customer_name | varchar |
-- +---------------+---------+
-- customer_id is the primary key for this table.
-- Each row of this table contains the name and the id customer.
--  
-- 
-- Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.





# Write your MySQL query statement below


# CUSTOMER_id between 1 and 100 and 
#  not in customer_id 
# order by asc 

with recursive seq
as(
select 
        1 as value
union all 
select
        value + 1
    from seq
where value < (select max(customer_id) from customers) )
select 
    value as ids
from 
    seq
where value not in (select customer_id from customers)
order by 1 ;