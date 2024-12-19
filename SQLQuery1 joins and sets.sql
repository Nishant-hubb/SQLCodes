select * from Employees
select * from Projects
select * from Departments

-- Inner join 
-- You have two tables, Employees and Departments. You want to retrieve the details of employees along with the department names, 
--but only for employees who have been assigned to a department.--

select Employees.EmpName, Departments.DeptName
from Employees
Inner join Departments on Employees.DeptID = Departments.DeptID

-- Left join or Left outer join
-- You want to list all employees and their departments, but also include employees who haven't been assigned a department.

select Employees.EmpName, Departments.DeptName
from Employees
Left join Departments on Employees.DeptID = Departments.DeptID

-- Right Join or Right Outer join
-- You want to list all departments and the employees in them. If no employees are assigned to a department, still show the department.

select Employees.EmpName, Departments.DeptName
from Employees
Right join Departments on Employees.DeptID = Departments.DeptID

-- Full Outer Join
-- You want to list all employees and departments, even if some employees are not assigned to a department or some departments have no employees.

select Employees.EmpName, Departments.DeptName
from Employees
Full outer join Departments on Employees.DeptID = Departments.DeptID

-- Cross join
-- You want to find all possible team assignments by pairing each employee with every project.

SELECT Employees.EmpName, Projects.ProjectName
from Employees
cross join Projects

-- Self Join
--You have an employee hierarchy in a single Employees table where each employee has a ManagerID, and you want to list of all employees along with their managers.

SELECT e1.EmpName as Employee, e2.Empname as Manager
from Employees e1
left join Employees e2 on e1.ManagerID = e2.EmpID

--USE NORTHWIND
USE NORTHWND
SELECT * FROM Products

--Find all the ProductName which are discontinued and their UnitPrice id less than 10.--
select ProductName, ProductID, UnitPrice as Price from Products
where UnitPrice > 10 and Discontinued = 1;
 
 --list the product categories along with the number of products in each categories--
 select * from Categories
 Select c.CategoryName, COUNT (p.ProductID) as NumberofProducts
 from Categories c 
 join Products p on c.CategoryID=p.CategoryID
 group by CategoryName;



 ---List the name of the Employees along with names of customers they served and the total number of orders placed by each customer(Northwind)---
 
 select E.FirstName +' '+ E.LastName as EmployeeName, C.CompanyName as CustomerName, COUNT(o.OrderID) as TotalOrders
 from Employees E
 join Orders O on E.EmployeeID=O.EmployeeID
 join Customers C on O.CustomerID=C.CustomerID
 group by C.CompanyName, E.FirstName, E.LastName;

select e.FirstName + ' ' + e.LastName as EmployeeName, c.companyName as CustomerName, Count(o.orderID) as TotalOrders
from Employees e
join orders o on e.EmployeeID = o.EmployeeID
join Customers c on o.CustomerID = c.customerID
Group by c.CompanyName, e.FirstName, e.LastName 
 
 select * from Products
 select * from Employees
 select * from Customers
 select * from Orders




