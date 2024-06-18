
select * from pizza_sales 

-- QUERIES FOR KPI'S.

select sum(total_price) as total_revenue from pizza_sales

select sum(total_price) / count(DISTINCT order_id) as avg_order_value from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select count(DISTINCT order_id) as total_orders from pizza_sales

select cast(sum(quantity) / count(DISTINCT order_id) as decimal (10,2)) as avg_pizzas_per_order from pizza_sales

-- QUERIES FOR DAILY AND MONTHLY TREND AND % OF SALES BY CATEGORIES AND SIZES

select DATENAME(dw,order_date) as order_day,COUNT(DISTINCT order_id) as total_orders_days
from pizza_sales
GROUP BY DATENAME(dw,order_date)

select DATENAME(MONTH,order_date) as month_name,COUNT(DISTINCT order_id) as total_orders_months
from pizza_sales
GROUP BY DATENAME(MONTH,order_date)

select pizza_category,sum(total_price)*100 / (select sum(total_price) from pizza_sales /*where month(order_date)=1*/) as percentage_by_category
from pizza_sales
-- where month(order_date)=1
group by pizza_category

select pizza_size,sum(total_price)*100 / (select sum(total_price) from pizza_sales /*where month(order_date)=1*/) as percentage_by_size
from pizza_sales
-- where month(order_date)=1
group by pizza_size

-- QUERIES FOR TOP 5 AND BOTTOM 5

select TOP 5 pizza_name, SUM(total_price) as total_revenue
from pizza_sales
GROUP BY pizza_name
order by total_revenue DESC

select TOP 5 pizza_name, SUM(quantity) as total_quantity
from pizza_sales
GROUP BY pizza_name
order by total_quantity DESC

select DISTINCT(pizza_size) from pizza_sales

