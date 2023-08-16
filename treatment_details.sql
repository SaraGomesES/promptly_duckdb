-- treatment details (diagnosis, medication, occurence, % of medication occurence by diagnosis, average duration in days and average total cost)

select diagnosis, medication, count(*) as occurrence,
round(count(*) * 100 / sum(count(*)) over (partition by diagnosis), 2) as percentage,
round(avg(extract(day from age(stop, start))),2) as avg_duration_days,
round((avg(totalcost)), 2) as avg_total_cost
from medications_per_patient
group by diagnosis, medication
order by diagnosis, medication;