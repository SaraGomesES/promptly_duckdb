-- treatments per diagnosis with total cost below average:

select diagnosis, medication, count(*) as occurrence,
round(sum(totalcost), 2) as totalcost
from medications_per_patient
group by diagnosis, medication
having round(sum(totalcost), 2) < (select avg(totalcost) from medications_per_patient)
order by diagnosis, medication;

-- treatments per diagnosis with total cost above average:

select diagnosis, medication, count(*) as occurrence,
round(sum(totalcost), 2) as totalcost
from medications_per_patient
group by diagnosis, medication
having round(sum(totalcost), 2) > (select avg(totalcost) from medications_per_patient)
order by diagnosis, medication;