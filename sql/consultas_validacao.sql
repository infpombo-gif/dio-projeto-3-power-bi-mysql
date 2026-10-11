```sql
USE company_constraints;

-- 1. Funcionarios sem supervisor direto
SELECT Fname, Lname, Ssn, Super_ssn
FROM employee
WHERE Super_ssn IS NULL;

-- 2. Validar os gerentes dos departamentos
SELECT
    d.Dname,
    d.Dnumber,
    d.Mgr_ssn,
    e.Fname,
    e.Lname
FROM departament AS d
LEFT JOIN employee AS e
    ON d.Mgr_ssn = e.Ssn;

-- 3. Quantidade de funcionarios por departamento
SELECT
    d.Dname,
    COUNT(e.Ssn) AS Total_Funcionarios
FROM departament AS d
LEFT JOIN employee AS e
    ON d.Dnumber = e.Dno
GROUP BY d.Dnumber, d.Dname
ORDER BY Total_Funcionarios;

-- 4. Total de horas por projeto
SELECT
    p.Pname,
    SUM(w.Hours) AS Total_Horas
FROM project AS p
LEFT JOIN works_on AS w
    ON p.Pnumber = w.Pno
GROUP BY p.Pnumber, p.Pname;

-- 5. Projetos sem funcionarios alocados
SELECT p.Pname
FROM project AS p
LEFT JOIN works_on AS w
    ON p.Pnumber = w.Pno
WHERE w.Pno IS NULL;

-- 6. Departamentos e localidades
SELECT
    d.Dname,
    l.Dlocation
FROM departament AS d
LEFT JOIN dept_locations AS l
    ON d.Dnumber = l.Dnumber
ORDER BY d.Dname, l.Dlocation;
```
