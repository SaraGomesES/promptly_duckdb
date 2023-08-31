-- treatments per diagnosis with total cost below average:

select diagnosis, medication, count(*) as occurrence,
round(sum(total_cost_per_medication), 2) as totalcost
from medications_per_patient_t3
group by diagnosis, medication
having totalcost < (select avg(total_cost_per_medication) from medications_per_patient_t3)
order by diagnosis, medication;

-- treatments per diagnosis with total cost above average:

select diagnosis, medication, count(*) as occurrence,
round(sum(total_cost_per_medication), 2) as totalcost
from medications_per_patient_t3
group by diagnosis, medication
having totalcost > (select avg(total_cost_per_medication) from medications_per_patient_t3)
order by diagnosis, medication;
