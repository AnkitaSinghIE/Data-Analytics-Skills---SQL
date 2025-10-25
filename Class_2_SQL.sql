-- show databases;
use data_students;
show tables;
-- insert into student_info values(1,"Ankita",25);
-- insert into student_info values(2,"Anshika",20);
-- insert into student_info values(3,"Savitri",56),(4,"Shailendra",53),(5,"Shiv",0);
-- insert	into student_info(st_id,sname) values(6,"Sakti");

-- select * from student_info;
-- select * from student_info where st_id>3;
-- select st_id,sname  from student_info where st_id>3;
-- Disable safe mode to modify the data 
-- set sql_safe_updates=0; command will allow us to delete and update our data
set sql_safe_updates=0;
-- delete from student_info where st_id=3;
-- update
-- update student_info set st_id=7 where sname="Savi";
-- update student_info set marks=null;
-- update student_info set marks=75 where st_id=6;
-- update student_info set marks=50 where marks is null;
-- -- Delete
-- delete from student_info where st_id=1;
-- select * from student_info;
-- Rename Table
-- rename table student_info to student_info_data;
select * from student_info_data;
-- create database data_student_temmp;
use data_student_temmp;
-- limit
select * from employee limit 5;
-- Order by (Arranage it in ascending order of salary)
select * from employee order by salary; -- by default ascending
-- for descending
select * from employee order by salary desc;
-- dhow the top 2b rows  table based on descending order of salary
select * from employee order by salary desc limit 2;
select * ,.1*salary as Bonus from employee;
-- In select we can only display the data no effect in database 
-- if you want to use that data then export it
-- toal salary(sum of salary and bonus-->.1*salary
select * , salary+.1*salary as TotalSalary from employee;
-- Different operators in SQL with where clause(=,>,<,>=,<=,!=/<> ,etc)
select * from employee where department='IT';
select * from employee where age<=40;
select * from employee where department<>'IT';
select * from employee where age is null;
select * from employee where age is not null;
-- all employee where salary is higher than 40k and less than 70k
select * from employee where salary>40000 and salary<70000;
select * from employee where salary between 40000 and 70000;
select * from employee where salary not between 40000 and 70000;
-- all employees where department is IT, HR and sales
select * from employee where department='IT' or department='HR' or 'Sales';
-- case insensitive but be mindful while using it
select * from employee where department in ('HR','IT','Sales');

-- Like Operators: pattern matching, wildcards: %(any number of characters), _ (single characters)
select * from employee;
select * from employee where employee_name like 'C%';
-- all employee details where last name has 5 characters and ends with n
select * from employee where last_name like '____n';

-- SQL aggregate Functions(sum, count, average, min, max)
select sum(salary) from employee;
select count(*) as employee_count from employee;
select avg(age) as avg_age from employee;
select max(salary) as maximum_salary from employee;
select min(salary) as minimum_salary from employee;

-- group by 
select department,max(salary) as max_sal from employee group by department;
select department,count(*) as count_emp from employee group by department;

-- get me the department where count is higher than 7

select department,count(*) as count_emp from employee group by department having count_emp>7;
-- whenever we are applying filters in grouped data then we will use having clause

-- get me department wise count only IT and HR
select department,count(*) as count_emp from employee group by department having department in ('IT','HR');
-- difference between where and having
-- > In where filtering before group by is done
-- > In having filtering on grouped data
select department,count(*) as count_emp 
from employee 
where salary>70000
group by department having department in ('IT','HR','Sales');
-- constraints: restrictions
 -- Domain constraint
 -- KEY Constraint
 -- Referential Constraint
-- Domain Constraints(unique,null,check,default)
-- 1. Unique - sid
-- 2. null constraint - sname
-- 3. check - age
-- 4. default - Course
-- All above four constraint is applied while creating table
 create table std_const(
 sid int unique,
 sname varchar(10) not null,
 age int check(age>17),
 course varchar(10) default "FODA");
 desc std_const;-- describing the table
 insert into std_const values (1,"Ankita",25,"Power BI");
 insert into std_const values (2,"Anki",25,"Python");
 insert into std_const(sid,age,course) values (3,25,"SQL");
 insert into std_const values (4,"Anya",25,"Excel");
 insert into std_const(sid,sname,age) values (5,"Savi",56);
 select * from std_const;

-- key constraint -- primary key
-- all values need to be unique and not null
create table std_pk(
 sid int primary key,
 sname varchar(10) not null,
 age int check(age>17),
 course varchar(10) default "FODA");
 insert into std_pk values (1,"Ankita",25,"Excel");
 insert into std_pk(sname,age) values ("Shivi",27);
 insert into std_pk values (1,"Ria",35,"Python");
 select * from std_pk;


























