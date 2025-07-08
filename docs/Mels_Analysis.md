# Exercise 4: Mel's Brain Takes Over

## Goals
- Deep dive into order details.
  - Using the last exercise as a starting point, why limit ourselves to the highest sales? Let's look at the lowest sales for any patterns. 
- Dive into the time dimension.
  - Are there patterns in the dates or times when sales are high?
- Dive into the menu.
  - What are the most/least popular categories?
  - What are the most/least popular dishes?
  - What are the prices of these items?

## Skills Practiced
| Command     | Purpose                                |
|:-----------:|----------------------------------------|
| `SELECT`    | Retrieve specific columns      |
| `JOIN...ON`      | Combine data from two tables based on a common field        |
| `WHERE`     | Filter rows based on conditions |
|`<>`| Comparison operator|
|`COUNT`| Count number of records |
|`SUM`| Add values of a column |
|`AVG`| Find the average value of a column|
|`ROUND`|Round a value to a specific number of decimal places|
| `GROUP BY`  | Aggregate data for analysis    |
| `ORDER BY`  | Sort data            |
|`LIMIT`| Limit the amount of rows returned|

## Key Observations
- Sales are concentrated every two weeks, possibly indicating a relationship to payday.
- Edamame is popular but inexpensive. It often sells alone, indicating potential for add-on selling.
- No bump in sales around Valentine's Day holiday...unexpected. MISSED OPPORTUNITY!

## Notes or Challenges
- I researched date and time formatting in the MySQL documentation. This was really cool and useful! It led me to my deeper dive into [time analysis](../code/Time_Analysis.sql).

> 📝 See [`Mels_Analysis.sql`](../code/Mels_Analysis.sql) for the full query set
