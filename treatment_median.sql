-- treatments per diagnosis with total cost below median:

with medications_median as (
    select percentile_cont(0.5) within group (order by total_cost_per_medication) as median_totalcost 
    from medications_per_patient_t3
)
select diagnosis, medication, count(*) as occurrence,
round(sum(total_cost_per_medication), 2) as total_cost
from medications_per_patient_t3
group by diagnosis, medication
having total_cost < (select median_totalcost from medications_median)
order by diagnosis, medication;

-- treatments per diagnosis with total cost above median:

with medications_median as (
    select percentile_cont(0.5) within group (order by total_cost_per_medication) as median_totalcost 
    from medications_per_patient_t3
)
select diagnosis, medication, count(*) as occurrence,
round(sum(total_cost_per_medication), 2) as total_cost
from medications_per_patient_t3
group by diagnosis, medication
having total_cost > (select median_totalcost from medications_median)
order by diagnosis, medication;
