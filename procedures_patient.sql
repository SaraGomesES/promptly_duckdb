-- create table procedures_patient:

create table procedures_patient as select
patients.Id as patientId, patients.gender, patients.birthdate, patients.city,
procedures.start, procedures.stop, procedures.base_cost, procedures.description, procedures.reasondescription as procedure_reason
from patients
inner join procedures ON patients.Id=procedures.patient;
