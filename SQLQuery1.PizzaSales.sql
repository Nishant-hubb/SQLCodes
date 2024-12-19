select * from pizza_sales
---Daily Trend---
SELECT DATENAME(DW,order_date) as Order_Day, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
group by DATENAME(DW,order_date) 

---Hourly Trend---
SELECT DATEPART(HOUR,order_time) as Order_Hours, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time)

SELECT pizza_category,SUM(total_price) as Total_sales ,SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category

----Percentage of Sales by Pizza Category---
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

----Percentage of Sales by Pizza Category using Where filter---
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales where MONTH(order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
where MONTH(order_date)=1
GROUP BY pizza_category

----Percentage of Sales by Pizza Size---
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

---Total pizzas sold per each category---
SELECT pizza_category, SUM(quantity) as TotalOrderQuantity
from pizza_sales
group by pizza_category
order by TotalOrderQuantity desc

SELECT  top 5 pizza_name, SUM(quantity) as TotalPizzaSold
from pizza_sales
group by pizza_name
order by TotalPizzaSold desc

select top 5 pizza_name, SUM(quantity) as TotalPizzaSold
from pizza_sales
group by pizza_name
order by TotalPizzaSold asc

















