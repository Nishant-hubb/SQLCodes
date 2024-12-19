select * from Sales
---Window functions in sql server
-- SUM, AVG, COUNT, MIN, MAX

select SalesCategory,SalesAmount,SalesDate,
SUM(SalesAmount) over(Partition by SalesCategory) as Totalamount,
AVG(SalesAmount) over(Partition by SalesCategory) as Avgamount
from Sales;

select SalesID,SalesCategory,SalesAmount,SalesDate,
SUM(SalesAmount) over() as Totalamount
from Sales;

---MAX and MIN---
select SalesCategory,SalesAmount,SalesDate,
Max(SalesAmount) over(Partition by SalesCategory) as Maxamount,
Min(SalesAmount) over(Partition by SalesCategory) as Minamount
from Sales;

select SalesCategory,SalesAmount,SalesDate,
ROW_NUMBER() over(order by SalesAmount Desc) as RowNum,
RANK() over(Order by SalesAmount Desc) as RankSales,
DENSE_RANK() over(order by SalesAmount Desc) as DenseRankSales
from Sales;
 
-- First_value and Last_value
select SalesCategory,SalesAmount,SalesDate,
FIRST_VALUE(SalesAmount) over(Partition by SalesCategory Order by SalesDate) as FirstSale,
LAST_VALUE(SalesAmount) over(Partition by SalesCategory Order by SalesDate ROWS between unbounded preceding and unbounded following) as LastSale
from Sales;

-- Lead and Lag
select SalesCategory,SalesAmount,SalesDate,
LAG(SalesAmount,1) over(Partition by SalesCategory Order by SalesDate) as PrevSale,
LEAD(SalesAmount,1) over(Partition by SalesCategory Order by SalesDate) as NextSale
from Sales;

-- Ntile
select salescategory, salesamount, salesdate,
	NTILE(3) over (order by Salesamount desc) as salesgroup
From Sales;

---Difference between current and previous sale using lag
select SalesID,SalesCategory,SalesAmount,SalesDate,
SalesAmount - LAG(SalesAmount,1) over (Order by SalesDate) as SalesDifference
from Sales;

-- Running total with SUM() and ROWS BETWEEN
select SalesID,SalesCategory,SalesAmount,SalesDate,
SUM(SalesAmount) over(order by SalesDate ROWS BETWEEN unbounded preceding and current row) as Total_Sales
from Sales;

-- Moving average of sales amount over last 3 rows
select SalesID,SalesCategory,SalesAmount,SalesDate,
AVG(SalesAmount) over(order by SalesDate ROWS BETWEEN 2 preceding and current row) as Moving_Avg
from Sales;

---USE NORTHWIND---
----Rank Employees Based On Number Of Orders Processed and Find their name by joining Employee column-----
select * from Orders
Select * from Employees
select E.FirstName +' '+ E.LastName as EmployeeName,O.EmployeeID, COUNT(OrderID) as OrderCount,
RANK() over(order by Count(O.OrderID) desc) as EmployeeRank
from Orders O
join Employees E on O.EmployeeID = E.EmployeeID
group by O.EmployeeID,E.FirstName,E.LastName;

-- Calculate the cumulative total(running total) of order amounts over time. Sum(Freight)

select OrderID,CustomerID,OrderDate,Freight,
SUM(Freight) over(order by OrderDate) as RunningTotal
from Orders;

-- For each order, find the date of the previous and next order in chronogical Order
select OrderID,CustomerID,OrderDate,
LAG(OrderDate,1) over(Order by OrderDate desc) as PrevSale,
LEAD(OrderDate,1) over(Order by OrderDate desc) as NextSale
from Orders;



















































