# Time Analysis – We know *what* they're eating, but what about ***when***

## Goals
- Deep dive into time trends discovered in [Mel's Analysis](../code/Mels_Analysis.sql).
- Discover any patterns in sales relating to the day of the week.
- Discover any patterns in sales relating to time of day at the hour level.
- Practice more complex querying skills.

## Skills Practiced
| Command     | Purpose                                |
|-------------|----------------------------------------|
| `SELECT`    | [e.g., Retrieve specific columns]       |
| `WHERE`     | [e.g., Filter rows based on conditions] |
| `GROUP BY`  | [e.g., Aggregate data for analysis]     |
| `ORDER BY`  | [e.g., Sort data by values]             |
| `JOIN`      | [Optional – remove if not used]         |

## Key Observations
- Sales peak on Fridays and Mondays, followed closely by Saturday and Sunday.
  - Seems to confirm the payday pattern.
- Orders peak in two-hour time windows from 1200 to 1400 and 1700 to 1900.
  - Customers seem to have reliable "lunch" and "dinner" times.
- The "senior" or "early bird" hour from 1600 to 1700 is relatively heavy in sales. Opportunity calling? 📞
  -  More "early bird" sales on Wednesday only and only by a hundred dollar margin.
- Korean Beef Bowl and Edamame are in top five most ordered items at every time of day.

## Notes or Challenges
- I consulted with ChatGPT before implementing the common table expression (CTE) methodology and window functions.
  - It clarified the differences between when to use subqueries versus CTEs.
- Researched MySQL documentation to deepen my understanding of window functions and validate ChatGPT’s recommendations.
  - I continued to iterate with ChatGPT by steering the conversation, requesting probing questions and critical thinking prompts rather than direct code solutions, to better understand the concepts, address root problems and help it teach me more effectively.
- Minor syntax issues like missing semicolons and extraneous commas remain a constant threat to flawless execution...and my sanity.   

> 📝 See [`Time_Analysis.sql`](../code/Time_Analysis.sql) for the full query set
