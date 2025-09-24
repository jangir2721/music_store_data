create table studentId(
	employee_id	INT	primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50),
	department varchar(50),
	salary numeric(10,2),
	joining_date date,
	age INT	
);



select * from studentId;

select department || '-' || salary as idea from studentId;

select avg(salary)::numeric(10,2) as salary_sum
from studentId;

select first_name, upper(first_name) as caital
from studentId;

select first_name, lower(last_name) as small
from studentId;

select email, replace(email,'gmail.com','manish.com') as "new id"
from studentId;

select first_name, last_name, age,
	(case 
		when age>=60 then 'bhudhe'
		when age<60 and age>=50 then 'gyani'
		when age<=49 and age>=40 then 'motyar'
		else 'tabar'
		end):: varchar(10)  as new_age_catgory
		from studentId;


select first_name, last_name, department,
(case
when department like 'Operations' then 'sales wala'
when department like 'IT' then 's/w engg.'
when department like 'HR' then 'high post'
when department like 'Finance' then 'pese wala'
else 'ghoomne wala'
end):: varchar(15) as KAM
from studentId;

select first_name, last_name, department,
(case
when department = 'Operations' then 'sales wala'
when department = 'IT' then 's/w engg.'
when department = 'HR' then 'high post'
when department = 'Finance' then 'pese wala'
else 'ghoomne wala'
end):: varchar(15) as KAM
from studentId;

alter table studentId
add column upgrade_salary numeric(10,2);

update studentId
set upgrade_salary= salary*2
where department like 'IT';

update studentId
set upgrade_salary= salary
where department not in ('IT');

select first_name, department, salary, upgrade_salary 
from studentId order by first_name asc;




