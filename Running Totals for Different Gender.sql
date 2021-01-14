+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| player_name   | varchar |
| gender        | varchar |
| day           | date    |
| score_points  | int     |
+---------------+---------+
(gender, day) is the primary key for this table.
A competition is held between females team and males team.
Each row of this table indicates that a player_name and with gender has scored score_point in someday.
Gender is 'F' if the player is in females team and 'M' if the player is in males team.
 

Write an SQL query to find the total score for each gender at each day.

Order the result table by gender and day

-------------------------------------------------------



select 
    gender,
    day, 
    sum(score_points) over (partition by gender order by gender, day) as total
from scores
group by 1,2
order by 1,2