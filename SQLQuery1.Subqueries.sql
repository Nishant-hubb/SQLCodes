select * from Employees
select * from Departments
select * from Projects

-- Find Employees who work in Departments other than 'HR'
select EmpID,EmpName from Employees
where DeptID != (select DeptID from Departments where DeptName = 'HR');

---List Departments that have no employees assigned
select DeptName from Departments
where DeptID not in (select DeptID from Employees where DeptID is not null);

-- List employees who work in the same department as Bob  (Answer - Bob, David)
Select EmpName from Employees
where DeptID = (select DeptID from Employees where EmpName = 'Bob')

--Find the number of employees in each department
select DeptName, (select COUNT(*) from Employees where Employees.DeptID=Departments.DeptID) as EmployeeCount
from Departments

--Find the manager of each employee
Select EmpName, (select EmpName from Employees as Manager where Manager.EmpID=Employees.ManagerID) as ManagerName
from Employees

select * from Products
select * from Employees
select * from Orders
select * from [Order Details]
-- Find customers who have placed orders above average order amount.
select CustomerID, CompanyName from Customers 
where CustomerID in (select CustomerID from Orders 
where Freight > (select AVG(Freight) from Orders))

--Retrieve a list of products whose unitprice is greater than average unit price of their category
select ProductName, UnitPrice,CategoryID
from Products P where UnitPrice>(select AVG(UnitPrice) from Products where CategoryID=P.CategoryID)

select * from Subquery1

Create View Subquery1 as
select ProductName, UnitPrice,CategoryID
from Products P where UnitPrice>(select AVG(UnitPrice) from Products)

----- Create a view to show the Product Name, Category name, and Suppliername of all products
select * from Products
select * from Categories
Select * from suppliers

Create View ProductDetailsView as
Select P.ProductName, C.CategoryName, S.CompanyName as Supplier_Name
From Products P
join Categories C on P.CategoryID=C.CategoryID
join Suppliers S on P.SupplierID=S.SupplierID

select * from ProductDetailsView

--how many distinct categories of Products are there
select COUNT(distinct CategoryName) as DistinctCategories
from ProductDetailsView

---- What are the names of all suppliers providing beverages using Productdetailsview
select distinct Supplier_Name 
from ProductDetailsView
where CategoryName = 'Beverages';

   
-- List  all products and their suppliers for the category 'confections'
select ProductName,Supplier_Name from ProductDetailsView
where CategoryName='Confections'

-- what are the top 3 categories by the number of products
-- Drop and  Create a view to show the Product Name, Category name, and Suppliername of all products
create view ProductDetailsView as
Select P.ProductName, C.CategoryName, S.CompanyName 
from Products P 
join Categories C on P.CategoryID=C.CategoryID                       
join Suppliers S on P.SupplierID=S.SupplierID ;

-- Retrieve a list of products whose unitprice is above the average unitprice
select ProductName,UnitPrice
from Products 
where UnitPrice>(Select AVG(UnitPrice) from Products)

-- Retrieve a list of products whose unitprice is above the average unitprice of their category
select ProductName,UnitPrice 
from Products p1
where UnitPrice>(select AVG(UnitPrice) from Products p2 where p1.categoryID=p2.categoryID)

 -- what are the top 3 categories by the number of products
 select top 3 CategoryName, COUNT(ProductName) as ProductCount
 from ProductDetailsView
 group by CategoryName
 order by ProductCount desc




























































































































































