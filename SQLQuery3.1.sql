select EmployeeKey,MaritalStatus,Gender from DimEmployee
where Gender= 'F';

select EmployeeKey,LastName from DimEmployee
where LastName = 'sMiTh';


select EmployeeKey,LastName from DimEmployee
where LastName like '%gi%'

