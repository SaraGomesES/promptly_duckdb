-- gender distribution by encounterclass description:

select
encounterclass,
description,
count(*) as total_patients,
sum(case when gender = 'M' then 1 else 0 end) as total_male,
sum(case when gender = 'F' then 1 else 0 end) as total_female,
round((sum(case when gender = 'M' then 1 else 0 end) * 100 / count(*)), 2) as male_proportion,
round((sum(case when gender = 'F' then 1 else 0 end) * 100 / count(*)), 2) as female_proportion
from encounters_patient
group by encounterclass, description
order by encounterclass, description;