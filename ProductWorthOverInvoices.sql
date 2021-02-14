-- Table: Product
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | name        | varchar |
-- +-------------+---------+
-- product_id is the primary key for this table.
-- This table contains the ID and the name of the product. The name consists of only lowercase English letters. No two products have the same name.
--  
-- 
-- Table: Invoice
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | invoice_id  | int  |
-- | product_id  | int  |
-- | rest        | int  |
-- | paid        | int  |
-- | canceled    | int  |
-- | refunded    | int  |
-- +-------------+------+
-- invoice_id is the primary key for this table and the id of this invoice.
-- product_id is the id of the product for this invoice.
-- rest is the amount left to pay for this invoice.
-- paid is the amount paid for this invoice.
-- canceled is the amount canceled for this invoice.
-- refunded is the amount refunded for this invoice.
--  
-- 
-- Write an SQL query that will, for all products, return each product name with total amount due, paid, canceled, and refunded across all invoices.
-- 
-- Return the result table ordered by product_name.





# Write your MySQL query statement below

select 
    name
    ,sum(i.rest) as rest
    , sum(i.paid) as paid
    , sum(i.canceled) as canceled
    , sum(i.refunded) as refunded
from 
    product as p
join invoice as i using (product_id)
group by 1
order by 1