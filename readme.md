# QA Engineer technical task

| Task | Answer |
|------|--------|
| 1. PUBG API: Postman collection for a player's ranked stats | [task1](task1/) |
| 2. Test cases for product search | [task2](task2/) |
| 3. SQL queries | [task3](task3/) |

Each folder has a readme with the task and how to run or check the answer.

## Task 1: PUBG API (Postman)

There is an API for developers from the multiplatform game PUBG. Documentation: https://documentation.pubg.com/en/introduction.html

Create a Postman collection to get ranked stats for a single player for the current season. Choose any player you like.

You can use the following API key (or get your own):

```text
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5MTZiNDkyMC00MjkyLTAxM2ItZDhmNC0wYWY1YTFlYjIzODEiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNjY4MDIyMDg5LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6InZpZGV0c2thLXRlc3QifQ.qxL0V-YTTSWxl0KYkWwM5i53s0Leo2yalvFTU9lEipE
```

Additional requirements:

- There should be an ability to import the solution to Postman easily.
- There should be an ability to verify the requested stats for another player with just 1 change.

Answer: [task1](task1/)

## Task 2: Testing the search functionality

The application allows users to search for products by:

- name
- category
- keywords

Search results can be filtered by:

- price range

Search results can be sorted by:

- relevance
- price

Task:

1. Design up to 15 test cases.
2. Include non-obvious checks and ways to break the search.

Answer: [task2](task2/)

## Task 3: SQL Querying

Database schema for an eCommerce application:

- `Products(id, name, category, price, stock)`
- `Orders(id, product_id, user_id, quantity, order_date)`
- `Users(id, name, email)`

Sample data:

Users

| id | name          | email             |
|----|---------------|-------------------|
| 1  | Alice Johnson | alice@example.com |
| 2  | Bob Smith     | bob@example.com   |
| 3  | Carol Davis   | carol@example.com |
| 4  | David Brown   | david@example.com |
| 5  | Eve Wilson    | eve@example.com   |

Products

| id | name         | category    | price  | stock |
|----|--------------|-------------|--------|-------|
| 1  | Laptop       | Electronics | 999.99 | 50    |
| 2  | Smartphone   | Electronics | 499.99 | 100   |
| 3  | Headphones   | Accessories | 79.99  | 200   |
| 4  | Office Chair | Furniture   | 150.00 | 30    |
| 5  | Desk Lamp    | Furniture   | 40.00  | 75    |

Orders

| id | product_id | user_id | quantity | order_date |
|----|------------|---------|----------|------------|
| 1  | 1          | 1       | 1        | 2024-08-10 |
| 2  | 2          | 1       | 2        | 2024-08-15 |
| 3  | 3          | 2       | 3        | 2024-08-20 |
| 4  | 4          | 3       | 1        | 2024-08-25 |
| 5  | 5          | 4       | 1        | 2024-08-25 |
| 6  | 1          | 5       | 1        | 2024-08-26 |
| 7  | 3          | 1       | 1        | 2024-08-27 |
| 8  | 2          | 3       | 2        | 2024-08-28 |
| 9  | 3          | 2       | 2        | 2024-08-29 |
| 10 | 4          | 4       | 1        | 2024-08-30 |
| 11 | 5          | 5       | 3        | 2024-08-31 |

Task: write SQL queries for the following scenarios:

1. Retrieve a list of all products in the "electronics" category for a user (specify user criterion: id, name, etc.).
2. Calculate the total quantity ordered for each product across all placed orders.

Answer: [task3](task3/)
