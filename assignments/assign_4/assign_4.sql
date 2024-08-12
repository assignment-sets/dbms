-- q1
SELECT
    upper(f_name) AS upper,
    lower(f_name) AS lower
FROM
    employee
WHERE
    ROWNUM <= 3;


-- q2
