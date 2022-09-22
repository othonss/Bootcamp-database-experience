use company_constraints;
-- Expressões e alias

-- recolhendo o valor do INSS-*
select Fname, Lname, Salary, Salary*0.011 from employee;
select Fname, Lname, Salary, Salary*0.011 as INSS from employee;
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

select * 
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber);
    
select concat(Fname, ' ', Lname) as Complete_name, Salary, Salary*1.1 as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
    
select e.Fname, e.Lname, 1.1*e.Salary as increased_sal from employee as e,
works_on as w, project as p where e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX';

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select concat(Fname, ' ', Lname) as Complete_name, Salary, round(1.1*Salary,2) as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
    
-- concatenando e fornecendo alias
select Dname as Department, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- recuperando dados dos empregados que trabalham para o departamento de pesquisa
select Fname, Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber = Dno;

-- definindo alias para legibilidade da consulta
select e.Fname, e.Lname, e.Address from employee e, departament d
	where d.Dname = 'Research' and d.Dnumber = e.Dno;
    
    
desc dept_locations;
select * from dept_locations;
-- recuperando informações dos departmentos presenttes em Stafford
select Dname as Department_Name, Mgr_ssn as Manager, Address from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford';

-- recuperando todos os gerentes que trabalham em Stafford
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford' and Mgr_ssn = e.Ssn;

desc departament;
-- recuperando todos os gerentes, departamentos e seus nomes
select Dname as Department_Name, concat(Fname, ' ', Lname) as Manager, Dlocation  from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

desc project;
select Pnumber, Dnum, Lname, Address, Bdate from departament d, project p, employee e
	where d.Dnumber = p.Dnum and p.Plocation='Stafford' and Mgr_ssn = e.Ssn;

-- like e between


desc employee;
select * from project;
select concat(Fname, ' ', Lname) as Complete_Name, Dname as Department_Name, Address 
	from employee, departament where Dno = Dnumber and Address like '%Houston%';
select Fname, Lname from employee where (Salary > 3000.00 and Salary < 40000);
select Fname, Lname from employee where (Salary between 20000 and 40000);