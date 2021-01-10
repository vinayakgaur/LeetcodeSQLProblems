with c1 as
(select 
    user_id, visit_date, 
    ifnull(lead(visit_date,1) over(partition by user_id order by visit_date), '2021-1-1')as nex_date
from UserVisits
order by user_id)
select 
    user_id, 
    max(datediff(nex_date,visit_date)) as biggest_window
from c1
group by user_id;