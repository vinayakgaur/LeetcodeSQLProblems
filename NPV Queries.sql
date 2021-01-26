Table: NPV

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
| npv           | int     |
+---------------+---------+
(id, year) is the primary key of this table.
The table has information about the id and the year of each inventory and the corresponding net present value.
 

Table: Queries

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
+---------------+---------+
(id, year) is the primary key of this table.
The table has information about the id and the year of each inventory query.
 

Write an SQL query to find the npv of all each query of queries table.

Return the result table in any order.



-----------------------------------------------------

select 
    q.id,
    q.year,
    ifnull(n.npv,0) as npv
from 
    queries as q
left join npv as n on q.id=n.id and q.year= n.year
order by 1