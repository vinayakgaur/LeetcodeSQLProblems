-- Table: Friends
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- | activity      | varchar |
-- +---------------+---------+
-- id is the id of the friend and primary key for this table.
-- name is the name of the friend.
-- activity is the name of the activity which the friend takes part in.
-- Table: Activities
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key for this table.
-- name is the name of the activity.
--  
-- 
-- Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.
-- 
-- Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends.




# Write your MySQL query statement below

with data as (
select 
    activity,
    count(name) as cnt
from friends
group by 1)
select 
    activity
from data 
where 
    cnt != (select max(cnt) from data )
and 
    cnt != (select min(cnt) from data)