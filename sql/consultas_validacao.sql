```sql
USE azure_company;

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

```sql
-- 7. Funcionarios sem departamento correspondente
SELECT
    e.Ssn,
    e.Fname,
    e.Lname,
    e.Dno
FROM employee AS e
LEFT JOIN departament AS d
    ON e.Dno = d.Dnumber
WHERE d.Dnumber IS NULL;

-- 8. Funcionarios com supervisor nao encontrado
SELECT
    e.Ssn,
    e.Fname,
    e.Lname,
    e.Super_ssn
FROM employee AS e
LEFT JOIN employee AS s
    ON e.Super_ssn = s.Ssn
WHERE e.Super_ssn IS NOT NULL
  AND s.Ssn IS NULL;

-- 9. Departamentos com gerente nao encontrado
SELECT
    d.Dnumber,
    d.Dname,
    d.Mgr_ssn
FROM departament AS d
LEFT JOIN employee AS e
    ON d.Mgr_ssn = e.Ssn
WHERE e.Ssn IS NULL;
```
