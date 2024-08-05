-- table structure -->
-- EmployeeID	FirstName	LastName	DepartmentID	Salary	HireDate
-- 1	    John	    Doe	            101	        50000	15-Jan-2023
-- 2	    Jane	    Smith	        102	        60000	20-Feb-2023
-- 3	    Michael	    Johnson	        101	        55000	10-Mar-2023
-- 4	    Emily	    Williams	    103	        52000	05-Apr-2023
-- 5	    David	    Brown	        102	        58000	15-May-2023
-- 6	    Sarah	    Jones	        101	        53000	20-Jun-2023
-- use of above table using update/modify/alter
-- adding constraint after creating table structure
alter table
    employee
add
    constraint pk_employee primary key (employeeid);

--pk_employee is the explicitly deefined name of primary key
-- modify statement to add constraint
alter table
    employee
modify
    firstname not null;

-- insert date 
INSERT INTO
    Employee (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        HireDate
    )
VALUES
    (
        7,
        'Davido',
        'Leo',
        102,
        58000,
        TO_DATE('2024-02-28', 'YYYY-MM-DD') --different formats
    );

INSERT INTO
    Employee (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        HireDate
    )
VALUES
    (
        7,
        'Davido',
        'Leo',
        102,
        58000,
        TO_DATE('20-Jan-2024', 'DD-Mon-YYYY') --different formats
    );

-- dropping a col
ALTER TABLE
    Employee DROP COLUMN DepartmentID;

-- chaging the size/length of field in table : 
alter table
    employee
modify
    firstname varchar2(100);

-- **in a tablee if col is populates the datatype cant be altered only the length can be changed
-- **however if the col is not populated with data it is possible to change the datatype for that specific col
-- createing and operating view : 
create view emp as
select
    employeeid,
    firstname
from
    employee;

-- more to learn : 
-- 1.join
-- 2.where clause
-- 3.relation and fk
-- 4.update vs alter-- 5.dual
-- 6.group
-- 7.order by
-- *select keyword is used for cols selection and where is for col wise row selection
-- aggregate functions
-- order by : sorting of vals col wise
--* sorting orders
--*length keyword

-- aggregate functions
select
    count(*)
from
    employee;

-- *count(*) vs count(distinct)

select
    max(salary) as highest_salary,
    avg(salary) as avg_salary,
    sum(salary) as total_salary
from
    employee;
