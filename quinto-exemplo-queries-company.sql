select * from employee;
-- Gerente e seu departamento
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- Dependentes dos empregados
select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

select Bdate, Address from employee where Fname = 'John' and Minit = 'B' and Lname = 'Smith';

-- Recuperando departamente específico
select * from departament where Dname = 'Research';

select Fname, Lname, Address from employee, departament where Dname = 'Research' and Dnumber = Dno;

select * from project;

select Pname, Essn, Fname, Hours from project, works_on, employee where Pnumber = Pno and Essn = Ssn;