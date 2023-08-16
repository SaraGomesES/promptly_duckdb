-- occurrence of each treatment per diagnosis

select diagnosis, medication, count(*) as occurrence,
round(count(*) * 100 / sum(count(*)) over (partition by diagnosis), 2) as percentage 
from medications_per_patient
group by diagnosis, medication
order by diagnosis, medication;

-- occurence of each treatment by diagnosis per city

select city, diagnosis, medication, count(*) as occurrence,
round(count(*) * 100 / sum(count(*)) over (partition by city), 2) as percentage_city
from medications_per_patient
group by city, diagnosis, medication
order by city, diagnosis, medication;