#Add time and date data to top 5 orders
select ord.order_id, 
date_format(ord.order_date,'%a, %m/%d/%y') as order_date, 
time_format(ord.order_time,'%r') as time,
/* menu.category as cuisine,*/ 
sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_id in (330,440,1957,2075,2675)
group by ord.order_id, order_date, time
order by ord.order_id, total_spend desc; 

#Look at top 10 orders, see if trend continues
select ord.order_id, date_format(ord.order_date,'%a, %m/%d/%y') as order_date, time_format(ord.order_time,'%r') as time, menu.category as cuisine, sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_id in (440,2075,1957,330,2675,4482,1274,2188,3473,3583)
group by ord.order_id, order_date, time, cuisine
order by ord.order_id, total_spend desc;

#Look at lowest 10 orders
/*after data cleaning, there are 137 rows with no item number so $0.00
update query to exclude these entries*/
select ord.order_id, sum(menu.price) as order_total, count(menu.menu_item_id) as num_items, menu.item_name as item 
from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id	
where item_id<>0
group by ord.order_id, item
order by order_total asc
limit 10;

#Look at lowest 5 orders
/*after data cleaning, there are 137 rows with no item number so $0.00
update query to exclude these entries*/
select ord.order_id, sum(menu.price) as order_total from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id	
where item_id<>0
group by ord.order_id
order by order_total asc
limit 5;

#What are the most popular dishes
select mi.item_name as dish, count(od.order_details_id) as num_orders, mi.category as cuisine
from menu_items as mi
join order_details as od on item_id = menu_item_id
group by dish, category
order by num_orders desc
limit 10;

#What is the average price of each category?
/*After data cleaning, there is a category called 'Unknown' with 
no price point. Exclude this from results.*/
select category as Cuisine, round(avg(price),2) as Average_Price
from menu_items
where category <> 'Unknown'
group by category
order by Average_Price
