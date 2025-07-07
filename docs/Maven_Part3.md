# Exercise 3 – Analyze customer behavior

## Goals
- Combine the items and orders tables.
- Find the least and most ordered categories.
- Dive into the details of the highest spend orders.
  
## Skills Practiced
| Command     | Purpose                                |
|:-----------:|----------------------------------------|
| `SELECT`    | Retrieve specific columns      |
| `JOIN...ON`      | Combine data from two tables based on a common field        |
| `WHERE`     | Filter rows based on conditions |
|`IN`| Comparison operator|
|`COUNT`| Count number of records |
|`SUM`| Add values of a column |
| `GROUP BY`  | Aggregate data for analysis    |
| `ORDER BY`  | Sort data            |

## Key Observations
- Chicken tacos are the least purchased item and hamburgers are the most purchased.
  - If the unknown item is one single item, then even that was ordered more than chicken tacos. INVESTIGATION TIME!
- Most expensive order was mostly Italian items, which is the most expensive category on average. 

## Notes or Challenges
- This data set was simple and only one join type was used - the inner join - which I simply called with `JOIN`.
  - Whenever I am working with joins, I imagine a Venn diagram in my head:
    - `INNER JOIN` is just the overlap is shaded.
    - `LEFT JOIN` is the whole left circle including the overlap is shaded.
    - `RIGHT JOIN` is the whole right circle including the overlap is shaded.
    - `FULL JOIN` is both circles and the overlap are shaded.
- I didn't need to use assigned names for the tables with the join because there were no duplicate column names, but I did it anyway to practice. The best queries in the world are useless if they can't be communicated to or understood by others.
- A lot of "`as` names" in these queries to clean things up in table presentation.

> 📝 See [`Maven_Part3.sql`](../code/Maven_Part3.sql) for the full query set
