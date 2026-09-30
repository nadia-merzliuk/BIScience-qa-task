# Task 3 - SQL queries

[Back to overview](../readme.md)

## Task

Schema:

- `Products(id, name, category, price, stock)`
- `Orders(id, product_id, user_id, quantity, order_date)`
- `Users(id, name, email)`

Write SQL queries to:

1. Get all products in the "electronics" category for a user (choose the user criterion: id, name, etc.).
2. Calculate the total quantity ordered for each product across all orders.

Sample data is in the [overview](../readme.md#task-3-sql-querying).

## Files

- [Task3-Solution.sql](Task3-Solution.sql): the queries
- [seed.sql](seed.sql): creates the tables and inserts the sample data from the task
- [ecommerce.db](ecommerce.db): SQLite database created from `seed.sql`

## How to run

```bash
cd task3
sqlite3 -header -column ecommerce.db < Task3-Solution.sql
```

Or open `ecommerce.db` in any SQLite client (DB Browser for SQLite, DBeaver) and run the queries from the file.

## Results on the sample data

Query 1, user id 1 (Alice Johnson):

| id | name       | category    | price  |
|----|------------|-------------|--------|
| 1  | Laptop     | Electronics | 999.99 |
| 2  | Smartphone | Electronics | 499.99 |

Query 2:

| id | name         | category    | total_quantity_ordered |
|----|--------------|-------------|------------------------|
| 3  | Headphones   | Accessories | 6                      |
| 5  | Desk Lamp    | Furniture   | 4                      |
| 2  | Smartphone   | Electronics | 4                      |
| 1  | Laptop       | Electronics | 2                      |
| 4  | Office Chair | Furniture   | 2                      |
