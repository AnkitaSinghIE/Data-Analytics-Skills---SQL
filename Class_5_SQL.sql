-- Transaction we follow ACID properties
-- When we are doing DML like insetion,updation or deletion in background it follow transaction rules(ACID)
-- Based on Transaction we have TCL(Transaction Control Language).-- Commit, rollback and Savepoint
use data_student_temmp;
 create table course(cid int, cname varchar(10));
 insert into course values(1,"FODA") -- automatically updated in the main database table.
 -- rollback 
start transaction; -- put you inside the transaction box
insert into course values(2,"Power BI"),(3,"Python"),(4,"SQL");
rollback; -- make you out from transaction box

-- commit
start transaction; -- put you inside the transaction box
insert into course values(2,"Power BI"),(3,"Python"),(4,"SQL");
commit; -- it will save the data in database

set sql_safe_updates=0;
start transaction;
delete from course where cid=1;
rollback;

-- savepoint
start transaction;
insert into course values(5,"Excel");
insert into course values(6,"DA");
savepoint s1; -- it is like bookmarking

insert into course values(7,"AIML");
insert into course values(8,"Devops");
savepoint s2;

insert into course values(9,"AWS");
rollback to s1;
-- if you rolling back with savepoint then end it with commit
commit;

-- Stored Procedures
-- writing the whole query might be tedious and time consuming when we are repeating same query
-- two steps 1> define the procedure like specify the task 2> whenever require call the procedure
-- CREATE PROCEDURE 'fetch_all_data' ()
-- BEGIN
-- select * from Sales;
-- END
-- call fetch_all_data();
-- parameterized procedure
-- call fetch_all_data(5); -- give the data of employee_id 5

-- CREATE PROCEDURE 'emp_info' (id int)
-- BEGIN
-- SELECT * FROM Sales where employee_id= id;
-- END
-- call emp_info(6);
-- update the data and create procedure
-- CREATE PROCEDURE 'update_sal' (id int,sal int)
-- BEGIN
-- update sales set salary=sal where employee_id=id;
-- END
-- call update_sal8,62000);
-- call emp_info(8);




alter table sales add column sal_status varchar(10);
-- call fetch_all_data;
-- CREATE PROCEDURE 'status' (i int)
-- BEGIN
-- declare s int;
-- select salary into s from sales where emplyee_id=i;
-- if s>60000 then
-- update sales set sal_status="High" where employee_id=i;
-- elseif s>50000 then
-- update sales set sal_status="Medium" where employee_id=i;
-- else
-- update sales set sal_status="Low" where employee_id=i;
-- end if;
-- END

-- CREATE PROCEDURE 'bonus_it_hr' ()
-- BEGIN
-- select *, case
-- when department="IT" then salary+5000
-- when deartment ="HR" then salary+5000
-- else
-- 0
-- end as Bonus
-- from sales;
-- END
-- CREATE PROCEDURE 'status_all' ()
-- BEGIN
-- declare i int default 1;
-- while i<=30 do
-- call status(i);
-- set i-i+1;
-- end while;
-- END
-- call status_all();
-- Joins two or more tables into a master tables (in most situation combing is done using the presence od common column)
-- inner join: only matching data from both tables
-- left join:  All data from left tble and matching from right table
-- right join: All data from right tble and matching from left table
-- outer join: All data from both tables
-- cross join: cartesian product,all combinations of rows between tables
-- self join: inner join with same tables
-- We are using emp_names and emp_sales table
select * from emp_names;
Alter table emp_names change column `ï»¿Eid` Eid int;
select * from emp_sales;
Alter table emp_sales change column ï»¿Eid Eid int;
select * from emp_sales;

-- master table have all the column from both tables.
-- Inner Join
select e.Eid,e,name.s.product,s.sales
from
emp_names as e
inner join
emp_sales as s
on
e.Eid=s.Eid;

-- left join
select * from
emp_names as e
left join
emp_sales as s
on
e.Eid=s.Eid;

-- right join
select * from
emp_names as e
right join
emp_sales as s
on
e.Eid=s.Eid;

-- cross join
select * from emp_names cross join emp_sales;

-- Union or Union All
create table t1(id int, sal int);
create table t2(id int, age int);
insert into t1 values(1,20000),(2,25000),(3,35000);
insert into t2 values(1,25),(3,31),(4,50);
-- union
select t1.id from t1
union
select t2.id from t2;

-- union all
select t1.id from t1
union all
select t2.id from t2;

-- outer join can be perform by taking help of union
-- outer join: All record from both table(left join union right join)
select * from t1 left join t2 on t1.id=t2.id
union
select * from t1 right join t2 on t1.id=t2.id















