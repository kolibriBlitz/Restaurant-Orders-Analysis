# Exercise 5: Data Cleaning – Garbage In, Garbage Out

## Goals
- Practice looking for data anomalies, e.g., NULL values, typos, outliers, etc.
- Update table rows.
- Make decisions about handling anomalies.

## Skills Practiced
| Command     | Purpose                                |
|-------------|----------------------------------------|
| `SELECT`    | Retrieve specific columns       |
| `WHERE`     | Filter rows based on conditions |
| `IS NULL`  | Check for values equal to NULL    |
| `BETWEEN`  | Comparison operator            |
|`NOT`/`<>`|Comparison operator|
|`AND`/`OR`|Conditional operator|
|`GROUP BY`| Aggregate data for analysis|
|`ORDER BY`| Sort data|
| `UPDATE`      | Update data in a table         |

## Key Observations
- All NULL items were standalone single item orders.

## Notes or Challenges
- This step was initially skipped because I started this project in a guided setting.
- I checked for NULL values first because they are most obvious. I checked typos next.
- I needed to research the proper syntax for updating a table. Overall SQL commands are intuitive and logical, but if your brain isn't acting that way then you're screwed.
- *It never ends!* I noticed that I mispelled "Unknown" in the `item_name` field when I coded my new row. I went back and updated it. 😎

> 📝 See [`Data_Cleaning.sql`](../code/Data_Cleaning.sql) for the full query set
