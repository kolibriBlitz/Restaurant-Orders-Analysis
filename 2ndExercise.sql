#View the order_details table. What is the date range of the table? 89 days
Select *
from order_details;
select datediff(max(order_date), min(order_date)) as date_range
from order_details;

#How many orders were made within this date range? How many items were ordered within this date range?
select max(order_id) as total_orders,/* count(distinct(order_id)) as orders,*/ count(order_details_id) as total_items_ordered
from order_details;

#Which orders had the most number of items?
select order_id, count(*) as num_items
from order_details
group by order_id
order by num_items desc;	

#How many orders had more than 12 items? 23
select count(*) as high_item_orders
from 
	(select order_id, count(*) as num_items
	from order_details
	group by order_id
	having num_items > 12) as high_item_orders;
