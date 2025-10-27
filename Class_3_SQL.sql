show databases;
use data_student_temmp;
select * from employee;
-- Domain Constraint(unique,null,check,default)
-- Primary Key: Ensures all values in the column is unique and no null values, uniquely identify the complete row
insert into std_pk values (2,"Ankita",25,"Power BI");
 insert into std_pk values (3,"Anki",25,"Python");
 insert into std_pk values (4,"Anki",25,"SQL");
 insert into std_pk(sid,age,course) values (4,25,"SQL");
 insert into std_pk(sid,sname,age) values (5,"Savi",56);
 select * from std_pk;
 -- referential integrity/constraint
 --  foreign key: refering to primary key in other table
 -- Information not present in parent table can not be present in child table
create table std_course1(
sid int,
program varchar(10),
-- foreign key establishment
foreign key(sid) references std_pk(sid)
-- if change happen in parent should be in child
on delete cascade
on update cascade
);
insert into std_course1 values (1,"Excel");
insert into std_course1 values (2,"SQL");
insert into  std_course1 values (3,"Python");
insert into std_course1 values(4,"Power BI");
set sql_safe_updates=0;
delete from std_course where sid=2;
-- modifying child table should not affect parent table but modifying parent affect the child table
delete from std_pk where sid=4;
select * from std_pk;
select * from std_course1;
 -- Foreign key can be duplicated but it can't be null
 
 -- Sequence Object
 create table prog_info(
 pid int primary key auto_increment,
 pname varchar(10)
 );
 insert into prog_info(pname) values ("Python"),("Excel"),("Power BI");
 select * from prog_info;
 
 create table prog_info1(
 pid int primary key auto_increment,
 pname varchar(10)
 )auto_increment=1001;
 insert into prog_info1(pname) values ("Python"),("Excel"),("Power BI");
 select * from prog_info1;
 
 select * from employee;
 -- view --> temporary table
 -- view is a temporary table because it is not present in database we are just collecting information
 -- suppose that IT information should be given only IT dept manager
 -- Simple View: Basic view where clause can be used 
 create view emp_IT as select * from employee where department="IT";
 select * from emp_IT;
 -- Complex View: views created using joins, group by, order by, having
 -- update/delete will not work in complex view
 create view dept_max as select department, max(salary) as max_salary from employee group by department;
 select * from dept_max;
 delete from dept_max where department="IT";
 -- distinct: unique values in a column(single column)
 select distinct department from employee;
-- index: position number to make searching faster
-- when index created
-- large number of rows(>10 lakh rows)
-- frequently query from the database with huge number of rows
-- for small data it is not required

create index sal_ind on employee(salary);
create index age_ind on employee(age);
show indexes from employee;

-- Subquery
-- select query inside another select query
-- get me the employee details whose age is higher than the avg age
select * from employee where age>(select avg(age) from employee);
-- get me employee details where salary is greater than avg salary
select * from employee where salary>(select avg(salary) from employee);
-- get me the employee details who has maximum salary 
select * from employee where salary=(select max(salary) from employee);
-- get all the employee details who work as same department as Amy
select * from employee where department=(select department from employee where first_name='Amy');

-- Case statements
select *, case 
when salary>70000 then "High"
when salary between 50000 and 70000 then "Medium"
else "Low"
end as salary_label
from employee;

 

