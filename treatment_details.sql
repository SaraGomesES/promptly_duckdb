-- treatment details (diagnosis, medication, occurence, % of medication occurence by diagnosis and average total cost)

select diagnosis, medication, count(*) as occurrence,
round(count(*) * 100 / sum(count(*)) over (partition by diagnosis), 2) as percentage,
round((avg(total_cost_per_medication)), 2) as avg_total_cost
from medications_per_patient_t3
group by diagnosis, medication
order by diagnosis, medication;