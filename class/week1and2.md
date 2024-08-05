# SQL Commands and Table Operations

## Table Structure

```sql
EmployeeID  FirstName  LastName  DepartmentID  Salary  HireDate
1           John       Doe       101           50000   15-Jan-2023
2           Jane       Smith     102           60000   20-Feb-2023
3           Michael    Johnson   101           55000   10-Mar-2023
4           Emily      Williams  103           52000   05-Apr-2023
5           David      Brown     102           58000   15-May-2023
6           Sarah      Jones     101           53000   20-Jun-2023
```

## Table Modifications

### Adding a Primary Key Constraint
```sql
ALTER TABLE employee
ADD CONSTRAINT pk_employee PRIMARY KEY (employeeid);
-- pk_employee is the explicitly defined name of the primary key
```

### Adding a NOT NULL Constraint
```sql
ALTER TABLE employee
MODIFY firstname NOT NULL;
```

## Inserting Data

### Insert with Date Format 'YYYY-MM-DD'
```sql
INSERT INTO Employee (
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    Salary,
    HireDate
) VALUES (
    7,
    'Davido',
    'Leo',
    102,
    58000,
    TO_DATE('2024-02-28', 'YYYY-MM-DD')
);
```

### Insert with Date Format 'DD-Mon-YYYY'
```sql
INSERT INTO Employee (
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    Salary,
    HireDate
) VALUES (
    7,
    'Davido',
    'Leo',
    102,
    58000,
    TO_DATE('20-Jan-2024', 'DD-Mon-YYYY')
);
```

## Altering Table Structure

### Dropping a Column
```sql
ALTER TABLE Employee
DROP COLUMN DepartmentID;
```

### Changing Column Size
```sql
ALTER TABLE employee
MODIFY firstname VARCHAR2(100);
```

Note: 
- If a column is populated, only the length can be changed, not the datatype.
- If a column is not populated, it's possible to change the datatype.

## Creating and Operating Views

```sql
CREATE VIEW emp AS
SELECT employeeid, firstname
FROM employee;
```

## Aggregate Functions

### Count All Rows
```sql
SELECT COUNT(*) FROM employee;
```

### Multiple Aggregate Functions
```sql
SELECT
    MAX(salary) AS highest_salary,
    AVG(salary) AS avg_salary,
    SUM(salary) AS total_salary
FROM employee;
```

## Additional Concepts to Learn

1. JOIN
2. WHERE clause
3. Relations and Foreign Keys
4. UPDATE vs ALTER
5. DUAL table
6. GROUP BY
7. ORDER BY (for sorting values column-wise)
8. LENGTH keyword
9. COUNT(*) vs COUNT(DISTINCT)

Note: 
- SELECT keyword is used for column selection
- WHERE is for row selection based on column conditions
- Sorting orders are important in ORDER BY