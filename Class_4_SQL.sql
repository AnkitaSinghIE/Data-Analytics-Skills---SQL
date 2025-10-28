use data_student_temmp;
select * from sales;
desc sales;
alter table sales modify column dob date;
-- Window function
-- over: which function needs to be applied(partition by | order by)
select *, sum(salary) over(order by employee_id) from sales;
-- avg salary of every department
select department, avg(salary) from sales group by department;-- grouped infromation
select *,avg(salary) over (partition by department) as avg_sal from sales;-- grouped infromation in row level format
-- data should be arrange in salary wise
select *,avg(salary) over (partition by department order by salary) as avg_sal from sales;
-- it will result cummulative result that is running total(adding the previous and give result)
select *,max(salary) over (partition by department order by salary) as max_sal from sales;
select *,sum(salary) over (partition by department order by salary) as sum_sal from sales;

-- row number()
select *, row_number() over (partition by department) as serial_number from sales;
-- renking: 
-- dense_rank()
select *,dense_rank() over (order by salary desc) as rnk from sales;
select *,dense_rank() over (partition by department order  by salary desc) as rnk from sales;

-- rank(): skip ranking
select *,rank() over (order by salary desc) as rnk from sales;
-- compare dense and skip ranking
select *,rank() over (order by salary desc) as rnk_s,dense_rank() over (order by salary desc) as rnk_d from sales;

-- lead: next value
-- lag: previous value
select ename,salary,lead(salary) over (order by salary) as ld  from sales; -- lead
select ename,dob,lead(dob)over (order by dob) as next_age from sales; -- lead
select ename,salary,lag(salary) over (order by salary) as lg  from sales; -- lag

-- CTE(Common Tools Expressions)
-- it is not present neither occupy any memory
-- give me the employee details with the third highest salary
-- using view
create view s_3 as (select *, dense_rank() over (order by salary desc) as rnk1 from sales);
-- view actually present and occupy memory
select * from s_3 where rnk1=3;
-- using CTE
with CTE_S3 as
(select *, dense_rank() over (order by salary desc) as rnk1 from sales)
select * from CTE_S3 where rnk1=3;

-- String Functions
-- length
select *,length(ename) as name_length from sales;
-- uppercase
select *,upper(ename) as emp_name from sales;
-- lower case
select ename,lower(department) as dept from sales;
-- trim: remove extra space
select trim("Hello     World  ") as trimmed;
-- left
select ename,left(ename,3) le from sales;
-- right
select ename,right(ename,3) re from sales;
-- substring or mid
select ename,substring(ename,3,5) as sb from sales;
-- replace
select ename,replace(ename,"J","X") as repl from sales;
-- concat
select first_name,last_name,concat(first_name,last_name) as full_name from sales;

-- Date function
select dob, year(dob) as Year from sales;
select dob, month(dob) as Month from sales;
select dob, day(dob) as Day from sales;
select now() as current_datetime, curdate() as curr_date, curtime() as curr_time;
-- dob, eligible date in which they can vote
select ename,dob,date_add(dob,interval 18 year) as eligible from sales;
-- 5 months before birth
select ename,dob,date_sub(dob,interval 5 month) as previous from sales;
-- age : curdate(),dob
select datediff(curdate(),dob) as age from sales;
select timestampdiff(year,dob,curdate()) as age from sales;

-- Transaction: ACID(Atomicity, Consistency, Isolation, Durablity)














