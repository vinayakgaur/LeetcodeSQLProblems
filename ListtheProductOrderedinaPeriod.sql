-- Table: Products
-- 
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+
-- product_id is the primary key for this table.
-- This table contains data about the company's products.
-- Table: Orders
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+
-- There is no primary key for this table. It may have duplicate rows.
-- product_id is a foreign key to Products table.
-- unit is the number of products ordered in order_date.







# PRODUCT_NAMES >= 100 units where order date = Feb 2020

select
    product_name,
    sum(unit) as unit
from 
    products as p
join orders  as o using (product_id)
where o.order_date between '2020-02-01' and '2020-02-29'
group by 1 
having unit >= 100