-- 1
create table job_history(
    emp_id number not null,
    start_date date,
    end_date date,
    job_type varchar2(20),
    d_name varchar2(20)
);

INSERT ALL
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'Manager', 'Sales')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Senior Manager', 'Marketing')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (2, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), 'Analyst', 'Finance')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (3, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'Developer', 'IT')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (2, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'Senior Analyst', 'Finance')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (4, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'Designer', 'Creative')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (5, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-10-30', 'YYYY-MM-DD'), 'HR', 'Human Resources')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (6, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'), 'Support', 'Customer Service')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (5, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'), 'Senior HR', 'Human Resources')
    INTO job_history (emp_id, start_date, end_date, job_type, d_name) VALUES (3, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'Lead Developer', 'IT')
SELECT * FROM dual;

-- 2
SELECT 
    curr.emp_id,
    curr.job_type AS current_job_type,
    prev.job_type AS previous_job_type
FROM 
    job_history curr
LEFT JOIN 
    job_history prev ON curr.emp_id = prev.emp_id 
                     AND prev.end_date < curr.start_date
WHERE 
    curr.end_date = (
        SELECT MAX(end_date) 
        FROM job_history 
        WHERE emp_id = curr.emp_id
    )
ORDER BY 
    curr.emp_id;

-- 3
SELECT 
    curr.emp_id,
    curr.job_type AS current_job,
    curr.d_name AS current_department,
    prev.job_type AS previous_job,
    prev.d_name AS previous_department
FROM 
    job_history curr
LEFT JOIN 
    job_history prev ON curr.emp_id = prev.emp_id 
                     AND prev.end_date < curr.start_date
WHERE 
    curr.end_date = (
        SELECT MAX(end_date) 
        FROM job_history 
        WHERE emp_id = curr.emp_id
    )
ORDER BY 
    curr.emp_id;

-- 4
SELECT 
    curr.emp_id,
    curr.job_type
FROM 
    job_history curr
WHERE 
    curr.job_type IN (
        SELECT prev.job_type
        FROM job_history prev
        WHERE prev.emp_id = curr.emp_id
          AND prev.end_date < curr.start_date
    )
    AND curr.end_date = (
        SELECT MAX(end_date) 
        FROM job_history 
        WHERE emp_id = curr.emp_id
    )
ORDER BY 
    curr.emp_id;
-- no data found

-- 5
SELECT emp_id as emp
FROM job_history
GROUP BY emp_id
HAVING COUNT(*) = 1;

-- 6
-- invalid question

-- 7
select * from job_history
where job_type = (
    select job_type from job_history
    where emp_id = 6
)

-- 8
SELECT * 
FROM job_history 
WHERE job_type IN (
    SELECT job_type 
    FROM job_history 
    WHERE emp_id = 3
) 
AND salary > (
    SELECT salary 
    FROM job_history 
    WHERE emp_id = 6
);

-- 9
select job_type, salary from job_history
where salary = (
    select min(salary) from job_history
)

-- 10
