-- Table: Sessions
-- 
-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | session_id          | int     |
-- | duration            | int     |
-- +---------------------+---------+
-- session_id is the primary key for this table.
-- duration is the time in seconds that a user has visited the application.
--  
-- 
-- You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.
-- 
-- Write an SQL query to report the (bin, total) in any order.


# # Write your MySQL query statement below

with cte as
(
select 
    session_id
    , duration
    , case 
        when duration/60 between 0 and 5 then '[0-5>'
        when duration/60 between 5 and 10 then '[5-10>'
        when duration/60 between 10 and 15 then '[10-15>'
        when duration/60 > 15 then '15 or more' end as bin
from 
    sessions
),
 bins as (
select '[0-5>' as bin
    union all 
select '[5-10>' as bin
    union all
select '[10-15>' as bin
    union all 
select '15 or more' as bin
)
select 
    bins.bin as BIN
    , count(cte.session_id) AS TOTAL
from bins
left join cte on bins.bin = cte.bin
group by 1 