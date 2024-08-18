-- q1
SELECT
    upper(f_name) AS upper,
    lower(f_name) AS lower
FROM
    employee
WHERE
    ROWNUM <= 3;

-- q2
SELECT
    EMP_ID,
    F_NAME,
    L_NAME,
    CONCAT(F_NAME, ' ') || L_NAME AS FULL_NAME,
    INSTR(F_NAME, 'ee') AS POSITION_OF_EE,
    ROUND(LENGTH(F_NAME), 2) AS FULL_NAME_LENGTH
FROM
    employee
WHERE
    ROWNUM <= 5;

-- q3
SELECT
    EMP_ID,
    SALARY,
    ROUND(SQRT(SALARY), 2) AS SALARY_SQRT
FROM
    employee
WHERE
    ROWNUM <= 3;

--------------------------------------------------
SELECT
    EMP_ID,
    SALARY,
    POWER(SALARY, 2) AS SALARY_SQUARED
FROM
    employee
WHERE
    ROWNUM <= 3;

--------------------------------------------------
SELECT
    EMP_ID,
    SALARY,
    CEIL(SALARY) AS SALARY_CEIL
FROM
    employee
WHERE
    ROWNUM <= 3;

--------------------------------------------------
SELECT
    EMP_ID,
    MANAGER_ID,
    ROUND(EXP(MANAGER_ID), 2) AS SALARY_EXP
FROM
    employee
WHERE
    ROWNUM <= 3;

--------------------------------------------------
SELECT
    EMP_ID,
    SALARY,
    MOD(SALARY, 9999) AS SALARY_MOD
FROM
    employee
WHERE
    ROWNUM <= 3;

-- q4
select
    ceil(14.887) as ceil_val,
    floor(14.887) as floor_val
from
    dual;

--------------------------------------------------
select
    round(17.49989) as round_of
from
    dual;

--------------------------------------------------
select
    power(8, 7) as res
from
    dual;

-- q5
SELECT
    SYSDATE AS CURRENT_DATE
FROM
    dual;

-- q6
SELECT
    emp_id,
    round(((TRUNC(SYSDATE) - TRUNC(DOJ)) / 7), 2) AS EXPERIENCE_WEEKS
FROM
    employee
WHERE
    DEPT = 'Sales';

-- q7
SELECT
    EMP_ID,
    DOJ,
    round(MONTHS_BETWEEN(SYSDATE, DOJ), 2) AS MONTHS_EXPERIENCE
FROM
    employee
WHERE
    DEPT = 'Sales';

--------------------------------------------------
SELECT
    EMP_ID,
    DOJ,
    ADD_MONTHS(DOJ, 6) AS DOJ_AFTER_6_MONTHS
FROM
    employee
WHERE
    DEPT = 'Sales';

--------------------------------------------------
SELECT
    EMP_ID,
    DOJ,
    NEXT_DAY(DOJ, 'SUNDAY') AS NEXT_SUNDAY
FROM
    employee
WHERE
    DEPT = 'Sales';

--------------------------------------------------
SELECT
    EMP_ID,
    DOJ,
    LAST_DAY(DOJ) AS LAST_DAY_OF_MONTH
FROM
    employee
WHERE
    DEPT = 'Sales';

--------------------------------------------------
SELECT
    EMP_ID,
    DOJ,
    TO_CHAR(DOJ, 'DD-MON-YYYY') AS DOJ_FORMATTED
FROM
    employee
WHERE
    DEPT = 'Sales';

-- q8
SELECT
    EMP_ID,
    SALARY,
    CASE
        WHEN DEPT = 'Sales' THEN SALARY * 1.10
        WHEN DEPT = 'Marketing' THEN SALARY * 1.20
        ELSE SALARY
    END AS REVISED_SALARY
FROM
    employee
where
    rownum <= 5;

-- q9
SELECT
    EMP_ID,
    SALARY,
    CASE
        WHEN SALARY BETWEEN 0
        AND 19999 THEN SALARY * 0
        WHEN SALARY BETWEEN 20000
        AND 39999 THEN SALARY * 0.09
        WHEN SALARY BETWEEN 40000
        AND 59999 THEN SALARY * 0.20
        WHEN SALARY BETWEEN 60000
        AND 79999 THEN SALARY * 0.30
        WHEN SALARY >= 80000 THEN SALARY * 0.45
    END AS TAX_AMOUNT
FROM
    employee
WHERE
    DEPT = 'Production';

-- q10
SELECT
    *
FROM
    employee
    CROSS JOIN department;

-- q11
select
    e.f_name,
    d.d_loc
from
    employee e
    inner join department d on e.dept = d.d_name;