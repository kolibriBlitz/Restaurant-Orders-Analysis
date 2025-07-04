#Look for patterns in dates: day of week
select /*ord.order_id,*/ 
date_format(ord.order_date,'%a') as Day_of_Week, 
/*time_format(ord.order_time,'%r') as time,*/
menu.category as cuisine,
sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where category <> 'Unknown'
group by Day_of_Week, cuisine
order by Day_of_Week, total_spend desc; 
/*Friday and Monday are biggest order $$ with Friday being a clear winner.
Italian and Asian dishes are the top two in terms of order $$ --> investigate price per dish vs number of orders relationship*/
select date_format(ord.order_date,'%a') as Day_of_Week, 
menu.category as cuisine,
count(ord.order_details_id) as total_orders
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where category<>'Unknown'
group by Day_of_Week, cuisine
order by Day_of_Week, total_orders desc; 

##Look for patterns in dates: time of day
select /*time_format(ord.order_time,'%r') as time_of_day,*/
menu.category as cuisine,
sum(menu.price) as total_spend_morning
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time < '11:30:00' and category <> 'Unknown'
group by cuisine
order by total_spend_morning desc; 

#check menu items sold by time of day: morning is smallest sales
select /*time_format(ord.order_time,'%r') as time_of_day,*/
item_name as dish,
count(item_name) as num_sold,
sum(menu.price) as total_spend_morning
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time < '11:30:00' and category <> 'Unknown'
group by dish
order by num_sold desc, total_spend_morning desc;

#earliest order time? 10:50 AM
select min(order_time) as earliest_order
from order_details;

select /*time_format(ord.order_time,'%r') as time_of_day,*/
menu.category as cuisine,
sum(menu.price) as total_spend_midday
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time between '11:30:00' and '16:00:00' and category <> 'Unknown'
group by cuisine
order by total_spend_midday desc; 

select /*time_format(ord.order_time,'%r') as time_of_day,*/
menu.category as cuisine,
sum(menu.price) as total_spend_evening
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time between '16:00:00' and '23:59:59' and category <> 'Unknown'
group by cuisine
order by total_spend_evening desc; 

#latest order time? 11:05 PM
select max(order_time) as latest_order
from order_details;