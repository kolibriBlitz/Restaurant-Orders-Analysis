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
|`COUNT` 	|Aggregate order counts|
|`SUM`|Add values in a column|
|`ROUND`|Format percentages to 1 decimal place|
|`GROUP BY`|	Aggregate data at the item or category level|
|`ORDER BY`|	Sort data to surface top and bottom performers|
|`WITH`||
|`CROSS JOIN`|	Combine each row with a one-row table for easy ratio math|
|`CREATE`...`FUNCTION`|	Define reusable routines for cleaner and portable queries|
|`INT` / `DECIMAL`|	Specify data types for return values in functions|

## Key Observations
- [Insert interesting findings or things you noticed while writing queries]
- [E.g., Edamame appears frequently as a solo item]
- [E.g., Italian dishes have higher average price than others]

## Notes or Challenges
- [Optional section – mention any errors, unexpected results, or lessons learned]
- [E.g., Needed to use `DISTINCT` to get unique counts]
- [E.g., Originally forgot to exclude NULL item_ids]

> 📝 See [`Numbers_Game.sql`](../code/Numbers_Game.sql) for the full query set
