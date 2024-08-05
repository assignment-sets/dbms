CREATE TABLE
    employee (
        emp_id NUMBER PRIMARY KEY, -- Employee ID
        f_name VARCHAR2 (50) NOT NULL, -- First Name
        l_name VARCHAR2 (50) NOT NULL, -- Last Name
        job_type VARCHAR2 (50), -- Job Type
        salary NUMBER (10, 2), -- Salary (10 digits, 2 after the decimal point)
        commission NUMBER (8, 2), -- Commission (5 digits, 2 after the decimal point)
        dept VARCHAR2 (50), -- Department
        manager_id NUMBER, -- Manager ID (Foreign Key if needed)
        doj DATE -- Date of Joining
    );

INSERT ALL INTO employee (
    emp_id,
    f_name,
    l_name,
    job_type,
    salary,
    commission,
    dept,
    manager_id,
    doj
)
VALUES
    (
        1,
        'Arun',
        'Khan',
        'Manager',
        90000.00,
        NULL,
        'Production',
        NULL,
        TO_DATE ('1998-06-04', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        2,
        'Barun',
        'Kumar',
        'Manager',
        80000.00,
        NULL,
        'Marketing',
        NULL,
        TO_DATE ('1998-02-09', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        3,
        'Chitra',
        'Kapoor',
        'Engineer',
        60000.00,
        NULL,
        'Production',
        1,
        TO_DATE ('1998-01-08', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        4,
        'Dheeraj',
        'Mishra',
        'Manager',
        75000.00,
        NULL,
        'Sales',
        4,
        TO_DATE ('2001-12-27', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        5,
        'Emma',
        'Dutt',
        'Engineer',
        55000.00,
        NULL,
        'Production',
        1,
        TO_DATE ('2002-03-20', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        6,
        'Floki',
        'Dutt',
        'Accountant',
        70000.00,
        NULL,
        'Accounts',
        NULL,
        TO_DATE ('2000-07-16', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        7,
        'Dheeraj',
        'Kumar',
        'Clerk',
        40000.00,
        NULL,
        'Accounts',
        6,
        TO_DATE ('2016-07-01', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        8,
        'Saul',
        'Good',
        'Engineer',
        60000.00,
        NULL,
        'R & D',
        NULL,
        TO_DATE ('2014-09-06', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        9,
        'Mou',
        'Bhat',
        'Clerk',
        30000.00,
        NULL,
        'Sales',
        4,
        TO_DATE ('2018-03-08', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        10,
        'Sunny',
        'Deol',
        'Salesman',
        20000.00,
        10000.00,
        'Marketing',
        2,
        TO_DATE ('2001-03-31', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        11,
        'Bobby',
        'Deol',
        'Engineer',
        35000.00,
        NULL,
        'R & D',
        8,
        TO_DATE ('2017-10-17', 'YYYY-MM-DD')
    ) INTO employee (
        emp_id,
        f_name,
        l_name,
        job_type,
        salary,
        commission,
        dept,
        manager_id,
        doj
    )
VALUES
    (
        12,
        'Aamir',
        'Khan',
        'Salesman',
        15000.00,
        5000.00,
        'Marketing',
        2,
        TO_DATE ('2013-01-11', 'YYYY-MM-DD')
    )
SELECT
    *
FROM
    dual;

-- q1
select
    f_name,
    l_name,
    job_type
from
    employee;

-- q2
SELECT
    f_name || ' is a ' || job_type AS employee_details
FROM
    employee
WHERE
    f_name = 'Arun';

-- q3
SELECT
    f_name || '’s monthly salary is Rs. ' || TO_CHAR (salary, 'FM999,999.00') AS monthly_salary_details
FROM
    employee;

-- q4
select
    d_name
from
    department;

-- q5
SELECT
    f_name,
    l_name
FROM
    employee
WHERE
    dept = 'Sales';

-- q6
SELECT
    f_name,
    l_name
FROM
    employee
WHERE
    salary > 50000;

-- q7
SELECT
    *
FROM
    employee
WHERE
    manager_id != 1;

-- q8
SELECT
    *
FROM
    employee
WHERE
    salary BETWEEN 40000 AND 70000;

-- q9
SELECT
    *
FROM
    employee
WHERE
    manager_id IN (1, 6, 8);

-- q10
SELECT
    f_name,
    salary
FROM
    employee
WHERE
    l_name LIKE 'K%';