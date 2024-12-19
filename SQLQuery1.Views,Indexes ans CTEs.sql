---Create a view of sales summary
Create view Sales_summary as
select ProductID, SUM(Quantity) as Total_quantity
from [Order Details]
group by ProductID

---Query from view where Quantity > 100
select * from Sales_summary where Total_quantity>100

----- create index on products table(Productname) where product is discontinued (Filtered Index)
create nonclustered index IX_NAProducts on Products(ProductName) where Discontinued = 1;

select * from Orders

--- create a view of customer details with customerid, companyname, ordered, orderdate and shipcity
create view CustomerDetails as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate, o.ShipCity
from Customers c
join Orders o on c.CustomerID=o.CustomerID ;

---ProductSales view to list product details along with quantity sold and order date
create view ProductSales as
select p.ProductID, p.ProductName, od.OrderID, od.Quantity, o.OrderDate
from Products p
join [Order Details] od on p.ProductID=od.ProductID
join Orders o on od.OrderID=o.OrderID
 
select * from ProductSales order by ProductID
select * from CustomerDetails 
select * from Orders
---Which customers have placed orders in 1998?? (Using views)
select CustomerID, CompanyName,OrderDate 
from CustomerDetails 
where year(OrderDate) = ('1998')

---Total quantity sold for each product
select ProductName, SUM(Quantity) as TotalQuantity from ProductSales
group by ProductName

--- List the Products sold with a Quanity Greater than 10, along with the order date
select ProductName,Quantity,OrderDate
from ProductSales
where Quantity>10

-- Total number of orders placed by each customer
Select CustomerID, COUNT(OrderID) as TotalOrders
from CustomerDetails
group by CustomerID

--Which customer have placed orders from 'Seattle'? (Homework)
Select CustomerID,CompanyName,ShipCity
from CustomerDetails
where ShipCity = 'Seattle'


---Create an indexed view
Create view dbo.TotalSalesPerProduct
with schemabinding as
select od.ProductID, SUM(od.Quantity * od.UnitPrice) as TotalSales,
count_big (*) as TotalCount
from dbo.[Order Details] od
group by od.ProductID

--Create a unique clustered index
create unique clustered index ix_TotalSales on dbo.TotalSalesPerProduct(ProductID)

select * from TotalSalesPerProduct

--------CTE---------
-- Calculate the total quantity ordered for each product in a CTE, then give where total Quanity > 100
with SalesCTE as(
select ProductID,SUM(Quantity) as Total_Quantity
from [Order Details]
group by ProductID)

select * from SalesCTE where Total_Quantity > 100;

 -- Using CTE give where order count is greater than 5
 -- Step 1 - Create a CTE with customerID and Ordercount
 -- Step 2 - Write query where ordercount > 5

with CountQuantity as (
select CustomerID, COUNT(OrderID) as OrderCount
from Orders
group by CustomerID)

select * from CountQuantity where OrderCount > 5;

---Print numbers from 1 to 5
with numbersCTE as(
select 1 as Number
union all
select Number +1
from numbersCTE
where Number < 5)

select Number from numbersCTE;

---Print even numbers from 1 to 10---
with EvenNumber as(
select 0 as Number
union all
select Number +2
from EvenNumber
where Number < 10)

select Number from EvenNumber;

































































































































































