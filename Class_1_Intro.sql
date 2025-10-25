show databases;
-- Create a database where we will store student related tables
create database students;
-- remove database and all tables inside it
drop database students;

create database data_students;
-- select the database that we want to use
use data_students;
-- create a table to store student information(sid,sname,age)
create table student_info
(
sid int,
sname varchar(11),
age int
);
-- insert some values inside the tabl
insert into student_info values(1,"Ankita",25);
insert into student_info values(2,"Anshika",20);
-- inserting multiple information at one time
insert into student_info values(3,"Savitri",56),(4,"Shailendra",53),(5,"Shiv",0);
-- Inserting data for some not every column
insert	into student_info(st_id,sname) values(6,"Sakti");

-- Display the table
select * from student_info;
select sname,age from student_info;
-- create course table (cid,coursename)
create table DA_courses
(
cid int,
coursename varchar(11)
);
insert into DA_courses values(1,"FODA"),(2,"Excel"),(3,"Power BI"),(4,"Python"),(5,"SinsertQL");
select * from DA_courses;
-- drop: it will remove all the data including the structure 
create table DA_courses_dummy1
(
cid int,
coursename varchar(11)
);
insert into DA_courses_dummy1 values(1,"FODA"),(2,"Excel"),(3,"Power BI"),(4,"Python"),(5,"SinsertQL");
select * from DA_courses_dummy1;
-- drop table DA_courses_dummy;
-- rtruncate: emove the data but keep the structure
truncate table DA_courses_dummy1;
select * from DA_courses_dummy1;
-- delete: deleting only one row(row wise deletion)

-- add new column call marks : alter command
alter table student_info add column marks int;
-- change the data type of sname from varchar to char
alter table student_info modify column sname char(11);
-- change the sid column name to st_id
alter table student_info change column sid st_id int;
-- remove the age column
alter table student_info drop column age;
select * from student_info;




