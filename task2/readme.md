# Task 2 - Testing the search functionality

[Back to overview](../readme.md)

## Task

Users can search products by name, category and keywords, filter results by price range, and sort by relevance or price.

1. Design up to 15 test cases.
2. Include non-obvious checks and ways to break the search.

## Answer

[Task2-Search-Test-Cases.md](Task2-Search-Test-Cases.md): assumptions, then 15 test cases in a table (preconditions, steps, test data, expected result, priority).

Which test cases cover which part of the feature:

| Feature | Test cases |
|---------|------------|
| Search by name | TC-01, TC-06, TC-08 |
| Search by category | TC-02 |
| Search by keywords | TC-03, TC-06 |
| Price filter | TC-04, TC-07, TC-14 |
| Sort by relevance | TC-06 |
| Sort by price | TC-05, TC-14 |
| Trying to break the search | TC-07, TC-09, TC-10, TC-11, TC-12, TC-13, TC-15 |
