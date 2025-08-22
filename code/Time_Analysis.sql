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

#check times of day for each day of week, Morn/Afternoon/Eve
SELECT date_format(ord.order_date,'%a') as Day_of_Week,
CASE
	WHEN order_time < '11:30:00' then 'Morning'
    WHEN order_time between '11:30:00' and '16:00:00' then 'Afternoon'
    ELSE 'Evening'
END as Time_of_Day,
 sum(menu.price) as Total_Spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
group by Day_of_Week, Time_of_Day
order by Day_of_Week, total_spend desc; 

#When should we start serving dinner? 1600, 1700 or 1800? Are there category patterns?
#1600
select date_format(ord.order_date,'%a') as Day_of_Week,
/*menu.category as cuisine,*/
sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time between '16:00:00' and '17:00:00' and category <> 'Unknown'
group by day_of_week/*, cuisine*/
order by total_spend desc;
#1700
select date_format(ord.order_date,'%a') as Day_of_Week,
/*menu.category as cuisine,*/
sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_time between '17:00:00' and '18:00:00' and category <> 'Unknown'
group by day_of_week/*, cuisine*/
order by total_spend desc;
#can I get the difference?
#no, but what I got is still useful
select date_format(ord.order_date,'%a') as Day_of_Week,
case 
	when ord.order_time < '16:00:00' then 'Not_Dinner'
    when ord.order_time BETWEEN '16:00:00' and '17:00:00' then 'Early_Bird'
    when ord.order_time between '17:00:00' and '18:00:00' then 'Standard'
    else 'Dinner'
end as Dinner_Time,
round(avg(menu.price),2) as average_spend,
count(ord.order_id) as num_items,
sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
group by day_of_week, Dinner_Time
order by num_items desc, average_spend desc;
/*Survey says that higher sales come in after 1800.
Recommend if the restaurant is interested in marketing it's
higher ticket items/larger meal items to a specific time, 
that time should be 1800.
Also, most sales come before 1600.
Recommend more pushing lighter fare or smaller plates,
possibly raising prices of current menu items or offering bundles.
Third observation: Fewer items sold during Early_Bird, but max average spend.
Recommend a special time-related offer like "Early Bird Special" or a "Buy Before Five!" for premium meals.*/

#Deep dive using window functions
#What are the top five ordered items by time buckets.
WITH items_by_time AS (
  SELECT
    CASE 
      WHEN order_time < '16:00:00' THEN 'Not_Dinner'
      WHEN order_time BETWEEN '16:00:00' AND '17:00:00' THEN 'Early_Bird'
      WHEN order_time BETWEEN '17:00:00' AND '18:00:00' THEN 'Standard'
      ELSE 'Dinner'
    END AS Dinner_Time,
    menu.item_name as Dish,
    ord.order_id AS 'Order'
  FROM order_details AS ord
  JOIN menu_items AS menu ON ord.item_id = menu.menu_item_id
),
ranked_items as (
	SELECT
		Dinner_Time,
		Dish,
		count('Order') as Total_Orders,
		RANK() OVER (PARTITION BY Dinner_Time ORDER BY count('Order') DESC) AS Item_Rank
	FROM items_by_time
	GROUP BY Dinner_Time, Dish
	ORDER BY Dinner_Time, Item_Rank
)

SELECT *
FROM ranked_items
WHERE item_rank <= 5
ORDER BY Dinner_Time, Item_Rank;

#What are the top five highest revenue items by time buckets.
WITH items_by_time AS (
  SELECT
    CASE 
      WHEN order_time < '16:00:00' THEN 'Not_Dinner'
      WHEN order_time BETWEEN '16:00:00' AND '17:00:00' THEN 'Early_Bird'
      WHEN order_time BETWEEN '17:00:00' AND '18:00:00' THEN 'Standard'
      ELSE 'Dinner'
    END AS Dinner_Time,
    menu.item_name as Dish,
    menu.price AS Price
  FROM order_details AS ord
  JOIN menu_items AS menu ON ord.item_id = menu.menu_item_id
),
ranked_items as (
	SELECT
		Dinner_Time,
		Dish,
		sum(Price) as Total_Spend,
		RANK() OVER (PARTITION BY Dinner_Time ORDER BY sum(Price) DESC) AS Item_Rank
	FROM items_by_time
	GROUP BY Dinner_Time, Dish
	ORDER BY Dinner_Time, Item_Rank
)

SELECT *
FROM ranked_items
WHERE item_rank <= 5
ORDER BY Dinner_Time, Item_Rank;

/*Back to the beginning...what is the difference in revenue between the 4 o'clock (Early-Bird)
and the 5 o'clock (Standard) dinner hours?*/
WITH Early_Bird as (
	select date_format(ord.order_date,'%a') as Day_of_Week,
	/*menu.category as cuisine,*/
	sum(menu.price) as total_spend
	from order_details as ord
	join menu_items as menu on menu.menu_item_id = ord.item_id
	where ord.order_time between '16:00:00' and '17:00:00' and category <> 'Unknown'
	group by day_of_week/*, cuisine*/
),
Standard as (
	select date_format(ord.order_date,'%a') as Day_of_Week,
	/*menu.category as cuisine,*/
	sum(menu.price) as total_spend
	from order_details as ord
	join menu_items as menu on menu.menu_item_id = ord.item_id
	where ord.order_time between '17:00:00' and '18:00:00' and category <> 'Unknown'
	group by day_of_week/*, cuisine*/
)

SELECT eb.Day_of_Week, eb.total_spend as '4PM-5PM', st.total_spend as '5PM-6PM', (eb.total_spend - st.total_spend) as Difference
FROM Early_Bird as eb
Join Standard as st on eb.Day_of_Week = st.Day_of_Week
ORDER BY Difference desc;

#Back to a simpler query...what are peak order times?
SELECT hour(order_time) as Hour_Block, count(order_id) as Num_Orders, sum(price) as Total_Spend
from order_details
join menu_items on menu_item_id = item_id
group by hour_block
ORDER BY Num_Orders desc;
/*Open later...recommend 1100
Close earlier...recommend 2300
"Lunch" Peak: 1200-1400
"Dinner" Peak: 1700-2000
Recommend having an "Early Bird" or "Senior" specialty time 1600-1700 with bundles, combos, deals to encourage attendance and purchases*/
