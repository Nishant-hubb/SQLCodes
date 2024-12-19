select [SalesOrderNumber],[OrderQuantity] , SUM([UnitPrice]) as Total_Sales
from FactInternetSales
group by [SalesOrderNumber],[OrderQuantity]