-- create table medications_per_patient:

create table medications_per_patient_t3 as select
patients.Id as patientId, patients.gender, patients.city,
age(max(medications.start), any_value(patients.birthdate)) as patient_age_at_last_treatment_start,
medications.description as medication,
medications.reasondescription as diagnosis,
round(sum(medications.totalcost),2) as total_cost_per_medication
from patients
inner join medications ON patients.Id=medications.patient
group by patientId, gender, city, medication, diagnosis
order by patientId, medication;
