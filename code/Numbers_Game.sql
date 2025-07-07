WITH item_sales as(
SELECT mi.item_name as item, count(od.order_id) as total_item_orders,sum(mi.price) as total_item_sales
FROM menu_items as mi
JOIN order_details as od on od.item_id = mi.menu_item_id
GROUP BY mi.item_name
),
total_sales as(
SELECT count(od.order_id) as total_orders,sum(mi.price) as total_spend
from order_details as od
join menu_items as mi on od.item_id = mi.menu_item_id
)

SELECT sales.item as Dish, 
round((total_item_orders/total_orders)*100,1) as '%_orders', 
round((total_item_sales/total_spend)*100,1) as '%_sales',
round(((total_item_sales/total_spend)-(total_item_orders/total_orders))*100,1) as '%revenue_gap'
from item_sales as sales
CROSS join total_sales
ORDER BY 4 desc, 3 desc;

select sum(price) as total$, count(order_id) as total_orders
from menu_items
join order_details on item_id = menu_item_id;

