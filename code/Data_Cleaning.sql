#inspect data in menu_items table
Select count(*)
from menu_items;

#inspect data in order_details table
select count(*)
from order_details;

#check for null values
select *
from order_details
where order_details_id is null or order_id is null or order_date is null or order_time is null or item_id is null;
#looks like the only column with null values is item_id

#confirm
select *
from order_details
where order_id between 49 and 51;
#yes, there is a distinct order with no item_id

#how many rows with a null item_id? answer: 137
select count(*) as Total_Null_Items
from order_details
where item_id is null;

/*how many distinct orders had a null item_id? Were there any missing item numbers in the same order?
 Answer: 137, so no these were distinct orders*/
select count(distinct(order_id)) as Distinct_Null_Orders
from order_details
where item_id is null;

#find the null row
select * from menu_items;
select * from menu_items where menu_item_id is null;

#replace with 0, 'unknown', 'unknown', 0 until information can be obtained from restaurant
insert into menu_items values(0,'Uknown','Unknown',0.00);
update order_details
set item_id = 0
where item_id is null;

#check updates
select * from order_details
where order_id = 50;
select count(*) as Num_UpdatedNull_Items 
from order_details
where item_id = 0;
select count(*) as Num_Null_Items
from order_details
where item_id is null;
#All item_id have been updated from null to 0

#check for typos in price or item number
SELECT * from menu_items
order by price desc;

select * from order_details as od
join menu_items as mi on item_id = menu_item_id
where price > 19.95;
#no price typos that add false money

select * from order_details as od
join menu_items as mi on item_id = menu_item_id
where item_id not BETWEEN 101 and 132 and item_id<> 0; /*valid item ids are 101-132 and nulls were replaced by 0*/
#no typos for an invalid item
