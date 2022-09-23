-- case statement
use company_constraints;

select Salary from employee;

-- Precisou desabilitar o safe mode
update employee set Salary =
	case
		when Dno = 5 then Salary + 2004
        when Dno = 4 then Salary + 1501
        when Dno = 1 then Salary + 3002
        else Salary + 0
	end;
