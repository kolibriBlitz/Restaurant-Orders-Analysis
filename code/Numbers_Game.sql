-- CTE for total orders and sales grouped by item
WITH item_sales as(
SELECT mi.item_name as item, count(od.order_id) as total_item_orders,sum(mi.price) as total_item_sales
FROM menu_items as mi
JOIN order_details as od on od.item_id = mi.menu_item_id
GROUP BY mi.item_name
),
-- CTE for ungrouped total orders and sales
total_sales as(
SELECT count(od.order_id) as total_orders,sum(mi.price) as total_spend
from order_details as od
join menu_items as mi on od.item_id = mi.menu_item_id
)

-- query to calculate the share of each item to the total orders and sales, plus the revenue gap
SELECT sales.item as Dish, 
round((total_item_orders/total_orders)*100,1) as '%_orders', 
round((total_item_sales/total_spend)*100,1) as '%_sales',
round(((total_item_sales/total_spend)-(total_item_orders/total_orders))*100,1) as '%revenue_gap'
from item_sales as sales
CROSS join total_sales
ORDER BY 4 desc, 3 desc;

-- Had a thought💡: create functions for something as simple as the one-row totals table
create function GetTotalSales()
	returns decimal(10,2) deterministic
    return (
    select sum(mi.price) 
    from order_details as od
	join menu_items as mi on od.item_id = mi.menu_item_id
    );

create function GetTotalOrders()
	returns int DETERMINISTIC
    return (
    SELECT count(od.order_id)
	from order_details as od
	join menu_items as mi on od.item_id = mi.menu_item_id
    );
-- test: SUCCESS    
select GetTotalSales();
select GetTotalOrders();

-- Apply functions to new query to group percentages by category
SELECT category as Cuisine, 
round((count(od.order_id)/GetTotalOrders())*100,1) as '%_orders', 
round((sum(mi.price)/GetTotalSales())*100,1) as '%_sales',
round(((sum(mi.price)/GetTotalSales())-(count(od.order_id)/GetTotalOrders()))*100,1) as '%revenue_gap'
from menu_items as mi
JOIN order_details as od on menu_item_id = item_id
GROUP BY Cuisine
ORDER BY 4 desc, 3 desc;

-- Rerun initial query using functions instead of CTE cross join
WITH item_sales as(
SELECT mi.item_name as item, count(od.order_id) as total_item_orders,sum(mi.price) as total_item_sales
FROM menu_items as mi
JOIN order_details as od on od.item_id = mi.menu_item_id
GROUP BY mi.item_name
)
-- query to calculate the share of each item to the total orders and sales, plus the revenue gap
SELECT item as Dish, 
round((total_item_orders/GetTotalOrders())*100,1) as '%_orders', 
round((total_item_sales/GetTotalSales())*100,1) as '%_sales',
round(((total_item_sales/GetTotalSales())-(total_item_orders/GetTotalOrders()))*100,1) as '%revenue_gap'
from item_sales
ORDER BY 4 desc, 3 desc;

-- Notes: Using the function increases duration, but does provide portability, scalability and readability.

        
