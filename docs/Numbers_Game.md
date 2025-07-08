# Exercise 7 – Percentages Are Where It's At

## Goals
- Analyze how individual menu items contribute to total orders and revenue.
- Investigate whether popularity (orders) aligns with revenue generation (sales).
- Continue practicing with common table expressions (CTEs).
- Explore using `CROSS JOIN` and user-defined functions to simplify query structure and improve readability.

## Skills Practiced
| Command     | Purpose                                |
|:-----------:|---------------------------------------|
| `SELECT`|	Retrieve specific columns|
|`COUNT` 	|Count number of records|
|`SUM`|Add values in a column|
|`ROUND`|Format percentages to 1 decimal place|
|`GROUP BY`|	Aggregate data|
|`ORDER BY`|	Sort data|
|`WITH`|A common table expression (CTE) of a subquery result that can be referred to by a query statement|
|`CROSS JOIN`|	Combine each row with a one-row table for easy ratio math|
|`CREATE`...`FUNCTION`|	Define reusable routines for cleaner and portable queries|
|`INT` / `DECIMAL`|	Specify data types for return values in functions|

## Key Observations
- Some menu items, like Korean Beef Bowl and Spaghetti & Meatballs, contribute more to revenue than their order counts suggest.
  - Price of these items is likely on the high end...we can go back to previous queries to check.
  - These items might pair or bundle well in meals.
- Edamame is the top underperformer and biggest untapped opportunity.
  - It makes up 5.1% of orders but only 1.9% of sales - a –3.1% revenue gap.
  - Recommend increasing price or making it a part of a combo.
- Functions were successfully created to return total sales and order counts. While they increased query duration, they added flexibility and clarity to the code.

## Notes or Challenges
- Learned that `CROSS JOIN` is appropriate when merging a grouped dataset with a one-row dataset without a common column.
  - Learned that `CROSS JOIN` won't work if aggregation commands are used afterward (or it didn't when I tried...).
- Explored query readability by replacing a join on non-matching structures with inline subqueries and functions.
- Realized that performance tradeoffs may be worth it for clarity—especially in deliverables meant for stakeholders or collaborators.
  - Thinking ahead to larger, more complex datasets; where to draw the line between speed and clarity.

> 📝 See [`Numbers_Game.sql`](../code/Numbers_Game.sql) for the full query set
