-- q1
-- Create Department Table
CREATE TABLE Department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100) NOT NULL
);

-- Create Employee Table
CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100) NOT NULL,
    salary NUMBER NOT NULL,
    dept_id NUMBER,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create Project Table
CREATE TABLE Project (
    proj_id NUMBER PRIMARY KEY,
    proj_name VARCHAR2(100) NOT NULL,
    dept_id NUMBER,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Create Works_On Table
CREATE TABLE Works_On (
    emp_id NUMBER,
    proj_id NUMBER,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Project(proj_id),
    PRIMARY KEY (emp_id, proj_id)  -- Composite primary key
);

-- q2
-- Insert data into Department Table
INSERT ALL
    INTO Department (dept_id, dept_name) VALUES (1, 'Human Resources')
    INTO Department (dept_id, dept_name) VALUES (2, 'Engineering')
    INTO Department (dept_id, dept_name) VALUES (3, 'Marketing')
    INTO Department (dept_id, dept_name) VALUES (4, 'Sales')
SELECT * FROM dual;

-- Insert data into Employee Table
INSERT ALL
    INTO Employee (emp_id, emp_name, salary, dept_id) VALUES (101, 'Alice Johnson', 60000, 1)
    INTO Employee (emp_id, emp_name, salary, dept_id) VALUES (102, 'Bob Smith', 75000, 2)
    INTO Employee (emp_id, emp_name, salary, dept_id) VALUES (103, 'Charlie Brown', 50000, 3)
    INTO Employee (emp_id, emp_name, salary, dept_id) VALUES (104, 'Diana Prince', 70000, 2)
SELECT * FROM dual;

-- Insert data into Project Table
INSERT ALL
    INTO Project (proj_id, proj_name, dept_id) VALUES (201, 'Recruitment System', 1)
    INTO Project (proj_id, proj_name, dept_id) VALUES (202, 'New Product Launch', 2)
    INTO Project (proj_id, proj_name, dept_id) VALUES (203, 'Marketing Campaign', 3)
    INTO Project (proj_id, proj_name, dept_id) VALUES (204, 'Sales Analytics', 4)
SELECT * FROM dual;

-- Insert data into Works_On Table
INSERT ALL
    INTO Works_On (emp_id, proj_id) VALUES (101, 201)
    INTO Works_On (emp_id, proj_id) VALUES (102, 202)
    INTO Works_On (emp_id, proj_id) VALUES (103, 203)
    INTO Works_On (emp_id, proj_id) VALUES (104, 202)
SELECT * FROM dual;

-- q3
select emp_name, salary from employee

-- q4
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary
FROM 
    Employee e
JOIN 
    Department d ON e.dept_id = d.dept_id;

-- q5
SELECT 
    e.emp_name,
    p.proj_name
FROM 
    Employee e
JOIN 
    Works_On w ON e.emp_id = w.emp_id
JOIN 
    Project p ON w.proj_id = p.proj_id;

-- q7
SELECT 
    emp_name
FROM 
    Employee
WHERE 
    salary > (SELECT AVG(salary) FROM Employee);

-- q8
SELECT 
    d.dept_name
FROM 
    Department d
LEFT JOIN 
    Project p ON d.dept_id = p.dept_id
WHERE 
    p.proj_id IS NULL;
-- o/p : no data found

-- q10
SELECT 
    e.emp_name,
    d.dept_name
FROM 
    Employee e
JOIN 
    Department d ON e.dept_id = d.dept_id
WHERE 
    e.salary = (
        SELECT MAX(salary)
        FROM Employee
        WHERE dept_id = d.dept_id
    );

-- q12
SELECT 
    e1.emp_name AS emp1,
    e2.emp_name AS emp2,
    e1.salary
FROM 
    Employee e1
JOIN 
    Employee e2 ON e1.salary = e2.salary
WHERE 
    e1.emp_id <> e2.emp_id;
order by e1.salary desc;
