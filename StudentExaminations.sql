-- Table: Students
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- student_id is the primary key for this table.
-- Each row of this table contains the ID and the name of one student in the school.
--  
-- 
-- Table: Subjects
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- subject_name is the primary key for this table.
-- Each row of this table contains the name of one subject in the school.
--  
-- 
-- Table: Examinations
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- There is no primary key for this table. It may contain duplicates.
-- Each student from the Students table takes every course from Subjects table.
-- Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
--  
-- 
-- Write an SQL query to find the number of times each student attended each exam.
-- 
-- Order the result table by student_id and subject_name.



# Write your MySQL query statement below


# student_id, student_name, subject_name, count(subject_name) 

select st.student_id, st.student_name, sb.subject_name, count(ex.subject_name) attended_exams
from students st
join subjects sb
left join examinations ex
on st.student_id = ex.student_id
and ex.subject_name = sb.subject_name
group by 1, 3
order by 1,3