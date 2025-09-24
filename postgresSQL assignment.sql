create table bchaa(
	Name varchar,
	subject varchar(30),
	roll_no INT primary key,
	marks INT,
	department varchar(20)
);

insert into bchaa(Name,subject,roll_no,marks,department)
	values
		('Manish','Manths',2001,95,'FCE'),
		('Situ','English',2002,91,'ECE'),
		('Ram','Hindi',2003,97,'CE'),
		('Shyam','Physics',2004,79,'ME'),
		('Kisan','Chemistry',2005,83,'FCE');

select * from bchaa;
select name,marks from bchaa;

update bchaa
set marks=marks*0.90
where Name in ('Ram', 'Shyam','Situ');

delete from bchaa
where marks<85;

rollback;
truncate table bchaa;

alter table bchaa
add column email varchar(40);

select * from bchaa;

alter table bchaa
rename column department to dept;

select * from bchaa where name='Manish';

select * from bchaa order by marks asc;

insert into bchaa(name,subject,roll_no,marks,dept,email)
	values('abc','Bio',2006,65,'BE','abc@gmail.com');

update bchaa
set marks=marks+1;

	



