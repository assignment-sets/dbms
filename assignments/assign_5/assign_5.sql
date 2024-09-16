-- q1
SELECT
    *
FROM
    EMPLOYEE
    CROSS JOIN DEPARTMENT;

-- q2
select
    e.f_name,
    d.d_loc
from
    employee e
    inner join DEPARTMENT d on d.d_name = e.dept;

-- q3
SELECT
    e.f_name,
    e.doj
FROM
    employee e
    INNER JOIN department d ON e.dept = d.d_name
WHERE
    d.d_loc = 'Delhi';

-- q4
create table
    emp_address (
        emp_id number primary key,
        city varchar2 (50),
        district varchar2 (50),
        state varchar2 (50)
    );

insert all 
into emp_address(emp_id, city, district, state) values (1, 'Suri', 'Birbhum', 'wb')
into emp_address(emp_id, city, district, state) values (2, 'Kolkata', 'Kolkata', 'wb')
into emp_address(emp_id, city, district, state) values (3, 'Bhubaneswar', 'Khurda', 'Odisha')
into emp_address(emp_id, city, district, state) values (4, 'Durgapur', 'Burdwan', 'wb')
into emp_address(emp_id, city, district, state) values (5, 'Noida', 'GB Nagar', 'up')
into emp_address(emp_id, city, district, state) values (6, 'Secu', 'Hyderabad', 'Telangana')
into emp_address(emp_id, city, district, state) values (7, 'Dehradun', 'Dehradun', 'Uttarakhand')
into emp_address(emp_id, city, district, state) values (8, 'Asansol', 'Burdwan', 'wb')
into emp_address(emp_id, city, district, state) values (9, 'Siliguri', 'Darjeeling', 'wb')
into emp_address(emp_id, city, district, state) values (10, 'Kolkata', 'Kolkata', 'wb')
into emp_address(emp_id, city, district, state) values (11, 'Jalpaiguri', 'Jalpaiguri', 'wb')
into emp_address(emp_id, city, district, state) values (12, 'Delhi', 'Delhi', 'Delhi')
select * from dual;

-- q5
SELECT
    e.f_name,
    d.d_loc,
    a.city
FROM
    employee e
    INNER JOIN department d ON e.dept = d.d_name
    INNER JOIN emp_address a ON e.emp_id = a.emp_id;

-- q6
SELECT
    d.d_name AS dept,
    e.f_name AS manager
FROM
    department d
    INNER JOIN employee e ON d.hod_id = e.emp_id
WHERE
    e.manager_id IS NULL;

-- q7
create table
    job_grades (
        grade varchar2 (1),
        lowest_sal number (7),
        highest_sal number (7)
    );

INSERT ALL
    INTO job_grades (grade, lowest_sal, highest_sal) VALUES ('A', 10000, 24999)
    INTO job_grades (grade, lowest_sal, highest_sal) VALUES ('B', 25000, 49999)
    INTO job_grades (grade, lowest_sal, highest_sal) VALUES ('C', 50000, 100000)
SELECT * FROM dual;

-- q8
SELECT
    e.f_name,
    e.l_name,
    e.salary,
    j.grade
FROM
    employee e
    INNER JOIN job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

-- q10
INSERT INTO
    department (d_name, d_loc, hod_id)
VALUES
    ('Human Resources', 'New York', 6);

INSERT INTO
    department (d_name, d_loc, hod_id)
VALUES
    ('Legal', 'San Francisco', 7);