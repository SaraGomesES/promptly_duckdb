-- create table encounters_patient:

create table encounters_patient as select
patients.Id as patientId, patients.gender, patients.birthdate, patients.city,
encounters.start, encounters.stop, encounters.encounterclass, encounters.description, encounters.reasondescription as encounter_reason
from patients
inner join encounters ON patients.Id=encounters.patient;
