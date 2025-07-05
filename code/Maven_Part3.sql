#Combine the menu_items and order_details tables into a single table
select * from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id;

/*What were the least and most ordered items? Chicken Tacos & Hamburger 
What categories were they in? Mexican & American*/
select menu.category as Cuisine, menu.item_name, count(menu.item_name) as total_orders from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id 
group by menu.category, menu.item_name
order by total_orders DESC;

#What were the top 5 orders that spent the most money?
select ord.order_id, sum(menu.price) as order_total from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id	
group by ord.order_id
order by order_total desc
limit 5;

#View the details of the highest spend order. Which specific items were purchased?
select menu.category as cuisine, sum(menu.price) as total_spend, menu.item_name as items
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_id = 440
group by cuisine, menu.item_name
order by total_spend; 

#BONUS: View the details of the top 5 highest spend orders
select ord.order_id, menu.category as cuisine, sum(menu.price) as total_spend
 from order_details as ord
join menu_items as menu on menu.menu_item_id = ord.item_id
where ord.order_id in (330,440,1957,2075,2675)
group by ord.order_id, cuisine
order by ord.order_id, total_spend desc; 
  
