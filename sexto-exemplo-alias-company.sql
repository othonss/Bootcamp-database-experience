select * from departament;
select * from dept_locations;

select Dname, Dlocation as Departament_name from departament as d, dept_locations as l where d.Dnumber = l.Dnumber;

select concat(Fname, ' ' , Lname) as Employee from employee;
