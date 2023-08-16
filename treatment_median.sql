-- treatments per diagnosis with total cost below median:

with medications_median as (
    select percentile_cont(0.5) within group (order by totalcost) as median_totalcost 
    from medications_per_patient
)
select diagnosis, medication, count(*) as occurrence,
round(sum(totalcost), 2) as total_cost
from medications_per_patient
group by diagnosis, medication
having total_cost < (select median_totalcost from medications_median)
order by diagnosis, medication;

-- treatments per diagnosis with total cost above median:

with medications_median as (
    select percentile_cont(0.5) within group (order by totalcost) as median_totalcost 
    from medications_per_patient
)
select diagnosis, medication, count(*) as occurrence,
round(sum(totalcost), 2) as total_cost
from medications_per_patient
group by diagnosis, medication
having total_cost > (select median_totalcost from medications_median)
order by diagnosis, medication;