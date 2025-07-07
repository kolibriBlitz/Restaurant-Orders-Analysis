# Exercise 2 – Explore the orders table

## Goals
- Better understand the orders table by finding:
  - the date range,
  - the number of items within each order, and
  - the orders with the highest number of items.

## Skills Practiced
| Command     | Purpose                                |
|:---:|:---|
| `SELECT`    | Retrieve specific columns       |
| `WHERE`/`HAVING`     | Filter rows based on conditions |
| `GROUP BY`  | Aggregate data for analysis   |
| `MAX`| Retrieve maximum value of a column |
| `AVG` | Calculate average value of a column |
| `ORDER BY`  | Sort data |
| `DATEDIFF`| Get the time, in days, between two dates |
| Subquery      | Retrieve or calculate aggregation of a column from a simple query        |

## Key Observations
- The most items ordered in a single order is 14.
- There were 8 orders with 14 items.

## Notes or Challenges
- `WHERE` is processed before SQL recognizes assigned labels so use `HAVING` instead for those cases.
- I noticed that order_details_id field was unique to every record and that order_id was not. Therefore, order_id could be thought of as "purchase" and the order_details_id as each "item" of the purchase.
  - This made me use `select max(order_id) as total_orders, count(order_details_id) as total_items_ordered` to answer, "How many orders were made within this date range? How many items were ordered within this date range?" instead of `COUNT(DISTINCT(order_id))`. Technically, I wasn't wrong and I got the same answer! 😅
- I researched the code documentation for `DATEDIFF` and was happy to see that SQL includes built-in support for date math. Using direct subtraction can produce *interesting* results if you're not careful, especially when you're unsure if the output will be in days, seconds, or some mysterious internal code (I'm looking at you, Excel).
  
> 📝 See [`Maven_Part2.sql`](../code/Maven_Part2.sql) for the full query set
