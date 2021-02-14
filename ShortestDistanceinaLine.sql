-- able point holds the x coordinate of some points on x-axis in a plane, which are all integers.
--  
-- 
-- Write a query to find the shortest distance between two points in these points.
--  
-- 
-- | x   |
-- |-----|
-- | -1  |
-- | 0   |
-- | 2   |


# Write your MySQL query statement below
with cte as 
(
select  
    x,
    x - lag(x) over (order by x) as next_value
from 
    point 
)
select 
min(next_value) as shortest
from cte