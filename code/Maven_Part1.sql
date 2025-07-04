#View the menu_items table and write a query to find the number of items on the menu
select * from menu_items;
select count(*) as total_items from menu_items;

#What are the least and most expensive items on the menu?
select item_name, price
from menu_items
order by price asc;
select item_name, price
from menu_items
order by price desc;

#How many Italian dishes are on the menu?
select category, category(item_name) as item_count
from menu_items
where category like 'Italian';

#What are the least and most expensive Italian dishes on the menu?
select item_name, price
from menu_items
group by category having category like 'Italian'
order by price;

#How many dishes are in each category? What is the average dish price within each category?
select category as Cuisine, count(*) as '#_dishes', round(avg(price),2) as Average_Price
from menu_items
group by category
order by Average_Price
