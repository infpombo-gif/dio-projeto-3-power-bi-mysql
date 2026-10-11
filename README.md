# dio-projeto-3-power-bi-mysql
README.md
```sql
USE company_constraints;

-- 1. Funcionários sem supervisor
SELECT Fname, Lname, Ssn, Super_ssn
FROM employee
WHERE Super_ssn IS NULL;

-- 2. Departamentos e seus responsáveis
SELECT d.Dname, d.Dnumber, d.Mgr_ssn, e.Fname, e.Lname
FROM departament d
LEFT JOIN employee e
    ON d.Mgr_ssn = e.Ssn;

-- 3. Funcionários por departamento
SELECT d.Dname, COUNT(e.Ssn) AS Total_Funcionarios
FROM departament d
LEFT JOIN employee e
    ON d.Dnumber = e.Dno
GROUP BY d.Dnumber, d.Dname
ORDER BY Total_Funcionarios;

-- 4. Total de horas por projeto
SELECT p.Pname, SUM(w.Hours) AS Total_Horas
FROM project p
LEFT JOIN works_on w
    ON p.Pnumber = w.Pno
GROUP BY p.Pnumber, p.Pname;

-- 5. Verificar projetos sem funcionários alocados
SELECT p.Pname
FROM project p
LEFT JOIN works_on w
    ON p.Pnumber = w.Pno
WHERE w.Pno IS NULL;

-- 6. Departamentos e respectivas localidades
SELECT d.Dname, l.Dlocation
FROM departament d
LEFT JOIN dept_locations l
    ON d.Dnumber = l.Dnumber
ORDER BY d.Dname, l.Dlocation;
```
