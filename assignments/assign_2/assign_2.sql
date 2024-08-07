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

---------------------------------------------------------------------------------------------------------------------

create table person(
    driver_id varchar2(20) primary key,
    name varchar2(50) not null,
    address varchar2(100)
);

create table car(
    reg_no varchar2(20) primary key,
    model varchar2(50) not null,
    year number(4)
);

create table accident(
    report_no number primary key,
    "date" DATE,
    location varchar2(50)
);

create table owns(
    driver_id varchar2(20),
    reg_no varchar2(20)
);

create table participated(
    driver_id varchar2(20),
    reg_no varchar2(20),
    report_no number,
    damage_amount number(10, 2)
);

---------------------------------------------------**************-------------------------------------------------------
-- Inserting data into the person table
INSERT ALL
    INTO person (driver_id, name, address) VALUES ('D001', 'John Doe', '123 Main St')
    INTO person (driver_id, name, address) VALUES ('D002', 'Jane Smith', '456 Elm St')
    INTO person (driver_id, name, address) VALUES ('D003', 'Mike Johnson', '789 Oak St')
    INTO person (driver_id, name, address) VALUES ('D004', 'Sarah Williams', '321 Pine St')
    INTO person (driver_id, name, address) VALUES ('D005', 'David Brown', '654 Maple St')
SELECT * FROM dual;

-- Inserting data into the car table
INSERT ALL
    INTO car (reg_no, model, year) VALUES ('C001', 'Toyota Camry', 2019)
    INTO car (reg_no, model, year) VALUES ('C002', 'Honda Civic', 2020)
    INTO car (reg_no, model, year) VALUES ('C003', 'Ford Mustang', 2018)
    INTO car (reg_no, model, year) VALUES ('C004', 'Chevrolet Silverado', 2021)
    INTO car (reg_no, model, year) VALUES ('C005', 'BMW X5', 2017)
SELECT * FROM dual;

-- Inserting data into the accident table
INSERT ALL
    INTO accident (report_no, "date", location) VALUES (1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Intersection A')
    INTO accident (report_no, "date", location) VALUES (2, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'Highway B')
    INTO accident (report_no, "date", location) VALUES (3, TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'Street C')
    INTO accident (report_no, "date", location) VALUES (4, TO_DATE('2022-04-20', 'YYYY-MM-DD'), 'Road D')
    INTO accident (report_no, "date", location) VALUES (5, TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'Avenue E')
SELECT * FROM dual;

-- Inserting data into the owns table
INSERT ALL
    INTO owns (driver_id, reg_no) VALUES ('D001', 'C001')
    INTO owns (driver_id, reg_no) VALUES ('D002', 'C002')
    INTO owns (driver_id, reg_no) VALUES ('D003', 'C003')
    INTO owns (driver_id, reg_no) VALUES ('D004', 'C004')
    INTO owns (driver_id, reg_no) VALUES ('D005', 'C005')
SELECT * FROM dual;

-- Inserting data into the participated table
INSERT ALL
    INTO participated (driver_id, reg_no, report_no, damage_amount) VALUES ('D001', 'C001', 1, 5000.00)
    INTO participated (driver_id, reg_no, report_no, damage_amount) VALUES ('D002', 'C002', 2, 10000.00)
    INTO participated (driver_id, reg_no, report_no, damage_amount) VALUES ('D003', 'C003', 3, 7500.00)
    INTO participated (driver_id, reg_no, report_no, damage_amount) VALUES ('D004', 'C004', 4, 20000.00)
    INTO participated (driver_id, reg_no, report_no, damage_amount) VALUES ('D005', 'C005', 5, 15000.00)
SELECT * FROM dual;

---------------------------------------------------**************-------------------------------------------------------

-- Establishing relationships between the tables

-- Adding foreign key constraint to owns table
ALTER TABLE owns
ADD CONSTRAINT fk_owns_driver
FOREIGN KEY (driver_id)
REFERENCES person (driver_id);

ALTER TABLE owns
ADD CONSTRAINT fk_owns_car
FOREIGN KEY (reg_no)
REFERENCES car (reg_no);

-- Adding foreign key constraint to participated table
ALTER TABLE participated
ADD CONSTRAINT fk_participated_driver
FOREIGN KEY (driver_id)
REFERENCES person (driver_id);

ALTER TABLE participated
ADD CONSTRAINT fk_participated_car
FOREIGN KEY (reg_no)
REFERENCES car (reg_no);

ALTER TABLE participated
ADD CONSTRAINT fk_participated_accident
FOREIGN KEY (report_no)
REFERENCES accident (report_no);

-- a. Update the damage amount for the car with a specific regno in accident with report number 12 to 25000
UPDATE participated
SET damage_amount = 25000
WHERE reg_no = 'C001' AND report_no = 12;

INSERT INTO accident (report_no, "date", location)
VALUES (6, TO_DATE('2022-06-15', 'YYYY-MM-DD'), 'Street F');

-- b. total number of people who owned cars that were involved in accidents
SELECT COUNT(DISTINCT p.driver_id) AS total_owners
FROM person p
JOIN owns o ON p.driver_id = o.driver_id
JOIN participated pt ON o.reg_no = pt.reg_no
JOIN accident a ON pt.report_no = a.report_no
WHERE EXTRACT(YEAR FROM a."date") = 2006;

-- c. Find the number of accidents involving a specific car model
SELECT COUNT(DISTINCT a.report_no) AS num_accidents
FROM accident a
JOIN participated pt ON a.report_no = pt.report_no
JOIN car c ON pt.reg_no = c.reg_no
WHERE c.model = 'specific_model';

