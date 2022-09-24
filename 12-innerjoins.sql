use company_constraints;
-- join statement
desc employee;
desc works_on;

-- join (por padrão é inner join se não for específicado ao SGBD)
select * from employee join works_on on Ssn = Essn;

-- A query debaixo é igual a de cima em relação ao retorno
select * from employee, works_on where Ssn = Essn;

select * from employee join departament on Ssn = Mgr_ssn;

select Fname, Lname, Address
	from (employee join departament on Dno = Dnumber)
    where Dname = 'Research';

-- join on -> inner join on
select * from dept_locations;
select * from departament;

select Dname as Departament, Dept_create_date as StartDate, Dlocation as Location
	from departament inner join dept_locations 
    using(Dnumber)
    group by Dlocation
    order by Dept_create_date;

-- cross join

select * from employee cross join dependent;

-- join com mais de 3 tabelas


	-- project, works_on e employee
select concat(Fname, ' ', Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName, Pno as ProjectNumber, Plocation as Location from employee 
		inner join works_on on Ssn = Essn
        inner join project on Pno = Pnumber
        where Pname like 'Product%' 
        order by Pnumber;
        
    -- departament, dept_location, employee
select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament 
	inner join dept_locations using(Dnumber)
    inner join employee on Ssn = Mgr_ssn
    group by Dnumber
     having count(*)>1;
     
select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament 
	inner join dept_locations using(Dnumber)
    inner join employee on Ssn = Mgr_ssn
    group by Dnumber;
    
select Dnumber, Dname, concat(Fname, ' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus from departament 
	inner join dept_locations using(Dnumber)
    inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
    group by Dnumber;
   
    
    -- departament, project, employee