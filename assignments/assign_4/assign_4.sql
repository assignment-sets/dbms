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