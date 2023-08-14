-- distribution of patients by age at each encounter description:

with age_distribution as (select distinct(patientId), description, age(start, birthdate) as patient_age
from encounters_patient)
select
description, 
count (*) filter (where extract(year from patient_age) between 0 and 9) as "0-9",
count (*) filter (where extract(year from patient_age) between 10 and 19) as "10-19",
count (*) filter (where extract(year from patient_age) between 20 and 29) as "20-29",
count (*) filter (where extract(year from patient_age) between 30 and 39) as "30-39",
count (*) filter (where extract(year from patient_age) between 40 and 49) as "40-49",
count (*) filter (where extract(year from patient_age) between 50 and 59) as "50-59",
count (*) filter (where extract(year from patient_age) between 60 and 69) as "60-69",
count (*) filter (where extract(year from patient_age) between 70 and 79) as "70-79",
count (*) filter (where extract(year from patient_age) between 80 and 89) as "80-89",
count (*) filter (where extract(year from patient_age) between 90 and 99) as "90-99",
count (*) filter (where extract(year from patient_age) >= 100) as "100+",
round((stddev(extract(year from patient_age))),2) as standard_deviation
from age_distribution
group by description
order by description;