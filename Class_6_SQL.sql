use data_student_temmp;
select * from employees;
-- we are using empdata.csv;
select * from empdata;
Alter table empdata change column ï»¿empid empid int;
Alter table empdata modify column mgrid int;
select * from empdata;

-- self join
select e.empname,m.empname
from empdata as e
inner join empdata as m
on e.mgrid=m.empid;

set global log_bin_function_creators=1; -- allow to write functions
-- functions are in SQL already sum(), max(), min() etc
-- user define function
-- stored procedure are the tasks which we are calling and user define function are operations
-- codes for all fuctions
-- 1 fullname
-- CREATE FUNCTION 'fullname' (f varchar(20),l varchar(20))
-- RETURNS VARCHAR
-- BEGIN
-- RETURN concat(f," ",l);
-- END
select *, fullname(first_name,last_name) as ename from employee;
-- How can we calculate age 
select *, timestampdiff(year,dob,currdate()) from sales;
-- age
-- CREATE FUNCTION 'age' (d date)
-- RETURN INTEGER
-- BEGIN
-- RETURN timestampdiff(year,d,currdate())
-- END
select *, age(dob) as emp_age from sales;
-- 10% as bonus and get total salary
select * , (.1*salary+salary) as total_salary from employee;
-- 3.net_salary
-- CREATE FUNCTION 'net_salary' (s int)
-- RETURN INTEGER
-- BEGIN
-- RETURN (.1*s+s);
-- END
select *,net_salary(salary) as total from employees;

select * from sales;
-- 4.get_title
-- CREATE FUNCTION 'get_title' (g varchar(1), e varchar(30))
-- RETURN VARCHAR(30)
-- BEGIN
-- if g='M' then
-- return concat("Mr. ",e)
--  else
--  return concat("Ms. ",e)
--  end if;`
--  END
select *, get_title(gender,ename) as fullname from sales;

-- Triggers
-- Trigger: one action happens other actions
-- we can create triggers on DML commands(insert,update,delete)
-- We can create two triggers on each command 1. Before, 2. After
-- Before trigger: Action perform before data is inserted/deleted/updated.
-- After trigger: Action perform after data is inserted/deleted/updated.
-- triggers
-- student table
create table std1(
sid int auto_increment primary key,
sname varchar(30),
age int,
dept varchar(30),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp);
-- audit table
create table audit(
id int auto_increment primary key,
actions varchar(10),
sid int,
sname varchar(30),
old_age int,
new_age int,
log_time timestamp default current_timestamp);

-- Before insert trigger
-- CREATE DEFINER= 'root' @'localhost' TRIGGER 'std1_BEFORE_INSERT' BEFORE
-- if new.age<18 then
-- set new.age=18;
-- end if;
-- END
insert into std1(sname,age,dept) values("Savi",8,"IT");
select * from std1;

-- if any new data is inserted in std1 it should be recorded in audit table
-- after insert trigger
-- CREATE DEFINER = 'root'@'localhost' TRIGGER 'std1_AFTER_INSERT' AFTER IN
-- insert into audit(actions,sid,sname,new_age) values
-- ("Ins",new.sid,new.sname,new.age);
-- END
insert into std1(sname,age,dept) values("Savitri",6,"EE");
select * from std1;
select * from audit;

-- update lucy's age but if new age is less than 18 then it should be remain as old age
-- before update trigger
-- CREATE DEFINER= 'root'@'localhost' TRIGGER  'std1_BEFORE_UPDATE'  BEFORE UPDATE
-- if new.age<18 then
-- set new.age=old.age
-- end if;
-- END
update std1 set age=10 where sid=2;
select * from std1;
-- after update: any new update should also recorded in the audit table 
-- CREATE DEFINER= 'root'@'localhost' TRIGGER 'std1_AFTER_UPDATE' AFTER UPDATE
-- insert into audit(actions,sid,sname,old_age,new_age) values
-- ("upd", old.sid,old.sname,old.age,new.age);
-- END
update std1 set age=25 where sid=2;
select * from std1;
select * from audit;
-- beofre delete: If any student from IT dept then that row shoul not be deleted and custom error message should be displayed
insert into std1(sname,age,dept) values("Ankita",25,"IT");
select * from std1;
-- to generate personalize error message we use signal sqlstate
-- before delete trigger
-- CREATE DEFINER='root'@'localhost' TRIGGER 'std1	_BEFORE_DELETE' BEFORE DELETE
-- if old.dept="IT" then
-- signal sqlstate '45000'
-- set message_text="IT Student can not be removed";
-- end if;
-- END
delete from std1 where sid=3;
select * from std1;
-- after delete: if any student leaves then his information should be recorded in the audit table
-- after delete trigger
-- CREATE DEFINER='root'@'localhost' TRIGGER 'std1_AFTER_DELETE' AFTER DELETE
-- insert into audit(actions,sid,sname,old_age) values
-- ("Del",old.sid,old.sname,old.age);
-- END
delete from std1 where sid = 2;
select * from std1;
select * from audit;














