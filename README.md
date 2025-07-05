# SQL_Projects
## Restaurant Orders

### Project Goals
- Practice SQL skills through hands-on, iterative querying.
- Think like a business analyst by looking for patterns, spotting anomalies, and turning data into actionable strategies.
- Advise a fictional restaurant owner on ways to **increase revenue** and **boost orders**.

### Methodology
1. Getting to know you: Studied database schema for table relationships, column names and column data types. Looked at a few rows of data in each table to get a feel for what is there. 
2. Cleanliness is next to Godliness: Check data for anomalies and missing data to ensure accurate results.
3. Investigated high-ticket orders: Looked at high-value purchase to see what is already driving revenue.
4. Investigated low-ticket orders: Looked at low-value purchases to see if they offered untapped opportunity.
5. Observed popularity trends: Identified most-ordered dishes and cuisines to inform menu strategy.
6. Introduced a time element: Analyzed order timestamps to identify revenue-driving periods.

### Results and Insights
**⏰Time-Based Trends**
- *“We make money on payday.”*
  - High-ticket orders cluster around a 2-hour window in the first, middle, and last weeks of each month—likely correlating with paydays.
- Surprisingly **no spike** near Valentine’s Day, signaling a missed marketing opportunity (e.g., a prix fixe dinner, couples' event, etc.).

**👇🏼 Low-End Orders**
- *“If a bug could accelerate fast enough, it could crack a windshield.”*
  - Edamame shows up often as a solo order—customers love it.
  - Suggests a segment of price-conscious or snack-focused buyers.

- **Opportunity:** Offer more inexpensive Asian side dishes, or use edamame in bundled promos (e.g., “Buy an entrée, get edamame for $1”, "Buy 2 edamame, get 1 half off", etc.).

**Menu Popularity** \
*“quip to be inserted later...for now enjoy food emojis 🍝🍣🌮🍔 ”*
- The hamburger is the most-ordered item, followed closely by edamame.
- The top five dishes are all American or Asian cuisine, suggesting strong cross-cultural appeal.
- Italian cuisine ranks lower in frequency but higher in spend—suggesting it attracts higher-ticket customers.

[***More to come!***](#more)

### Business Recommendations
- 💡 Payday Promotions: Launch timed specials around pay periods.
- 💡 Valentine's Day Campaign: Target high-spending customers with seasonal offerings.
- 💡 Leverage Low-Cost Favorites: Use edamame in combo deals or snack menus to increase order size.
- 💡 Expand Italian Offerings: Keep or grow upscale Italian dishes to appeal to higher-spend clientele.
- 💡 Morning Changes: Cut costs by reducing menu offerings to only the most popular, reducing staff or opening after 11:30 AM. 

### BONUS MALLET <a name="more"></a>
- Add human dimension to schema with server data.
  - Do certain servers consistently have higher ticket orders? If so, why?
  - Do certain servers consistently sell over [threshold amount] of items? If so, why?
