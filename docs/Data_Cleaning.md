# Data Cleaning Practice – Garbage In, Garbage Out

## Goals
- Practice looking for data anomalies, e.g., NULL values, typos, outliers, etc.
- Update table rows.
- Make decisions about handling anomalies.

## Skills Practiced
| Command     | Purpose                                |
|-------------|----------------------------------------|
| `SELECT`    | [e.g., Retrieve specific columns]       |
| `WHERE`     | [e.g., Filter rows based on conditions] |
| `IS NULL`  | [e.g., Aggregate data for analysis]     |
| `BETWEEN`  | [e.g., Sort data by values]             |
| `UPDATE`      | [Optional – remove if not used]         |

## Key Observations
- All NULL items were standalone single item orders.

## Notes or Challenges
- This step was initially skipped because I started this project in a guided setting.
- I checked for NULL values first because they are most obvious. I checked typos next.
- I needed to research the proper syntax for updating a table. Overall SQL commands are intuitive and logical, but if your brain isn't acting that way then you're screwed.
- I have been unsuccessful at removing the null row from menu_items so far.

> 📝 See [`Data_Cleaning.sql`](../code/Data_Cleaning.sql) for the full query set
