# Exercise 1 - Explore the items table
The first set of questions in the Maven Analytics guided project.


## Goals
- Explore the data.
- Practice simply query expressions.
- Get a better understanding of the items table by finding:
    - the number of rows in the table,
    - the least and most expensive items, and
    - the item prices within each category.

## Skills
|Command|Purpose|
|:---:|---|
|`SELECT`|Retrieve specific columns|
|`WHERE`/`HAVING`|Filter rows based on conditions|
|`LIKE`|Comparison Operator|
| `AVG` | Calculate average value of a column |
|`GROUP BY`|Aggregate data for analysis|
|`ORDER BY`|Sort data|

## Key Observations
- American category has lowest average price but also least amount of items so it's more likely that Mexican is least expensive category when accounting for item weight
- Italian is most expensive category on average

## Notes or Challenges
- columns in `SELECT` statment need to be aggregated uf `GROUP BY` is used
- `LIKE` or `=` can be used for text comparisons

> 📝 See [`Maven_Part1.sql`](../code/Maven_Part1.sql) for the full query set
