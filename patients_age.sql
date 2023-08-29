-- to calculate the current age of patients:

select
Id, gender, birthdate, round(extract(year from age(current_date, birthdate)) +
(extract(month from age(current_date, birthdate)) / 12.0) +
(extract(day from age(current_date, birthdate)) / 365.0), 2) as age
from patients;

-- another way to calculate the current age of patients:
select
Id, gender, birthdate, round(((current_date - birthdate)/365.25), 2) as age
from patients;

-- to calculate the patient's age at the time of the encounter:
select
age(start, birthdate) as patient_age
from medications_per_patient;