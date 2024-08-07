create table employee (
    emp_id varchar2 (20),
    f_name varchar2 (50) not null,
    l_name varchar2 (50) not null,
    job_type varchar2 (50),
    salary number (10, 2),
    dept varchar2 (50),
    commission number (10, 2),
    manager_id varchar2 (20)
);

---------------------------------------------------------------------------------------------------------------------
alter table
    employee
add
    constraint employee_pk primary key (emp_id);

---------------------------------------------------------------------------------------------------------------------
ALTER TABLE
    employee
MODIFY
    f_name NOT NULL;

ALTER TABLE
    employee
MODIFY
    salary NOT NULL;

---------------------------------------------------------------------------------------------------------------------
alter table
    employee
add
    date_of_joining DATE;

---------------------------------------------------------------------------------------------------------------------
create table department (
    d_name varchar2 (50) primary key,
    d_loc varchar2 (100),
    HOD_id varchar2 (20)
);

---------------------------------------------------------------------------------------------------------------------
CREATE TABLE location (
    loc_id VARCHAR2 (20),
    city VARCHAR2 (50),
    contact_no VARCHAR2 (15)
);

---------------------------------------------------------------------------------------------------------------------
ALTER TABLE
    location
MODIFY
    city VARCHAR2 (55);

---------------------------------------------------------------------------------------------------------------------
alter table
    location drop column contact_no;

---------------------------------------------------------------------------------------------------------------------
alter table
    employee
add
    constraint fk_dept foreign key (dept) references department (d_name);

---------------------------------------------------------------------------------------------------------------------
alter table
    location rename column city to address;

---------------------------------------------------------------------------------------------------------------------
alter table
    location rename to loc;

---------------------------------------------------------------------------------------------------------------------
insert
    all into loc
values
    ('1', 'kolkata') into loc
values
    ('2', 'mumbai')
select
    1
from
    dual;

---------------------------------------------------------------------------------------------------------------------
truncate table loc;

---------------------------------------------------------------------------------------------------------------------
drop table loc;

---------------------------------------------------------------------------------------------------------------------
insert
    all into department
values
    ('sales', 'kol', '4') into department
values
    ('Accounts', 'delhi', '6') into department
values
    ('Production', 'kol', '1') into department
values
    ('Marketing', 'kol', '2') into department
values
    ('R & D', 'Marketing', '8')
select
    1
from
    dual;

---------------------------------------------------------------------------------------------------------------------
INSERT ALL
    INTO employee VALUES (1, 'Arun', 'Khan', 'Manager', 90000.00, NULL, 'Production', NULL, TO_DATE('1998-06-04', 'YYYY-MM-DD'))
    INTO employee VALUES (2, 'Barun', 'Kumar', 'Manager', 80000.00, NULL, 'Marketing', NULL, TO_DATE('1998-02-09', 'YYYY-MM-DD'))
    INTO employee VALUES (3, 'Chitra', 'Kapoor', 'Engineer', 60000.00, NULL, 'Production', 1, TO_DATE('1998-01-08', 'YYYY-MM-DD'))
    INTO employee VALUES (4, 'Dheeraj', 'Mishra', 'Manager', 75000.00, NULL, 'Sales', 4, TO_DATE('2001-12-27', 'YYYY-MM-DD'))
    INTO employee VALUES (5, 'Emma', 'Dutt', 'Engineer', 55000.00, NULL, 'Production', 1, TO_DATE('2002-03-20', 'YYYY-MM-DD'))
    INTO employee VALUES (6, 'Floki', 'Dutt', 'Accountant', 70000.00, NULL, 'Accounts', NULL, TO_DATE('2000-07-16', 'YYYY-MM-DD'))
    INTO employee VALUES (7, 'Dheeraj', 'Kumar', 'Clerk', 40000.00, NULL, 'Accounts', 6, TO_DATE('2016-07-01', 'YYYY-MM-DD'))
    INTO employee VALUES (8, 'Saul', 'Good', 'Engineer', 60000.00, NULL, 'R & D', NULL, TO_DATE('2014-09-06', 'YYYY-MM-DD'))
    INTO employee VALUES (9, 'Mou', 'Bhat', 'Clerk', 30000.00, NULL, 'Sales', 4, TO_DATE('2018-03-08', 'YYYY-MM-DD'))
    INTO employee VALUES (10, 'Sunny', 'Deol', 'Salesman', 20000.00, 10000.00, 'Marketing', 2, TO_DATE('2001-03-31', 'YYYY-MM-DD'))
    INTO employee VALUES (11, 'Bobby', 'Deol', 'Engineer', 35000.00, NULL, 'R & D', 8, TO_DATE('2017-10-17', 'YYYY-MM-DD'))
    INTO employee VALUES (12, 'Aamir', 'Khan', 'Salesman', 15000.00, 5000.00, 'Marketing', 2, TO_DATE('2013-01-11', 'YYYY-MM-DD'))
SELECT * FROM dual;

---------------------------------------------------------------------------------------------------------------------
select
    *
from
    department;

---------------------------------------------------------------------------------------------------------------------
select
    d_name,
    d_loc
from
    department;

---------------------------------------------------------------------------------------------------------------------
select
    f_name,
    l_name,
    salary,
    (salary + 1000) as bonus_salary
from
    employee;

---------------------------------------------------------------------------------------------------------------------
select
    (salary + 1000) as yearly_bonus_sal,
    (salary + (100 * 12)) as monthly_bonus_sal
from
    employee;

---------------------------------------------------------------------------------------------------------------------
select
    f_name as name,
    salary as annsal
from
    employee;

---------------------------------------------------------------------------------------------------------------------
SELECT
    l_name AS "LasT",
    (salary + 100) AS "NewSal"
FROM
    employee;

---------------------------------------------------------------------------------------------------------------------
SELECT
    emp_id,
    f_name,
    l_name,
    job_type
FROM
    employee
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            employee
    );

---------------------------------------------------------------------------------------------------------------------
SELECT
    emp_id,
    f_name,
    l_name,
    job_type
FROM
    employee
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employee
    );

---------------------------------------------------------------------------------------------------------------------
select
    avg(salary)
from
    employee;