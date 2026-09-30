# Task 2 - Test cases for product search

**Feature:** users search products by name, category and keywords, filter the results by price range, and sort them by relevance or price.

## Assumptions

These points are not in the requirements, so I would confirm them with the team:

- The default sort is by relevance. Price sort can be ascending or descending.
- The price filter includes both boundaries (min <= price <= max).
- Keywords are tags on the product, separate from its name.
- Extra spaces in the query are ignored (trimmed, double spaces treated as one).
- Results are split into pages.
- Behaviour for an empty query is not defined (checked in TC-09).

**Priority:** P1 = must work for release, P2 = important, P3 = hardening.

**Approach:** equivalence classes and boundary values for the main functions. Most of the remaining cases go to negative input, security, non-Latin text and combined filter/sort state, because search usually breaks there.

## Test cases

| ID | Title | Preconditions | Steps | Test data | Expected result | Priority |
|----|-------|---------------|-------|-----------|-----------------|----------|
| TC-01 | Search by exact product name | Product "Apple iPhone 15" exists | 1. Enter the product name in the search field<br>2. Click Search | `Apple iPhone 15` | The product is in the results, first in the list | P1 |
| TC-02 | Search by category shows only that category | Category "Laptops" has products. "Laptop Stand" is in category "Accessories" | 1. Enter the category name<br>2. Click Search | `Laptops` | Only products from "Laptops" are shown, nothing from other categories. "Laptop Stand" (other category, but "Laptop" is in its name) is shown or hidden according to the agreed rule | P1 |
| TC-03 | Search by keyword | "AirPods Pro" has keyword "earbuds". The word is not in its name | 1. Enter the keyword<br>2. Click Search | `earbuds` | "AirPods Pro" is in the results | P1 |
| TC-04 | Price filter boundaries | Products with price exactly 100 and 200 exist | 1. Set price filter 100-200<br>2. Set price filter 101-199 | 100-200<br>101-199 | 1. Both products are shown<br>2. Both products are not shown | P1 |
| TC-05 | Sort by price | Search for "phone" returns more than one page. At least two products have the same price | 1. Search "phone"<br>2. Sort by price, low to high<br>3. Go through all pages<br>4. Sort high to low<br>5. Reload the page | `phone` | Prices go up (then down) across all pages, not only on page 1. Products with the same price stay in the same order after reload | P1 |
| TC-06 | Relevance order | "Headphones" is the exact name of product A. Product B has "Headphones" inside a longer name. Product C has only the keyword "headphones" | 1. Search "headphones"<br>2. Sort by relevance | `headphones` | Order is A, then B, then C. The order is not alphabetical and not by date added | P2 |
| TC-07 | Invalid price range | - | 1. Enter each price range from test data<br>2. Apply the filter | min 200, max 100<br>min -10<br>min `abc`<br>only max filled<br>max 1000000 | For each input: a validation message or a clear result (for example an empty list). No server error (500), no stack trace, not the whole catalog | P2 |
| TC-08 | Case and spaces in the query | Product "Apple iPhone 15" exists | 1. Search each value from test data<br>2. Compare with the results for `iPhone 15` | `IPHONE 15`<br>`iphone 15`<br>`iPhone 15` with spaces before and after<br>`iPhone 15` with two spaces between the words | The same results for all values | P2 |
| TC-09 | Empty and very short query | - | 1. Search each value from test data | empty<br>`a`<br>`ab` | The agreed behaviour (for example "Enter at least 3 characters"). The same behaviour every time. The page does not try to load the whole catalog | P2 |
| TC-10 | Injection and special characters | - | 1. Search each value from test data | `' OR 1=1 --`<br>`"; DROP TABLE products;--`<br>`{"$gt":""}`<br>`%` `_` `*` `?` `[ ]` `.*` `\` | Treated as normal text: no results, or only products that really contain these characters. No error, not the whole catalog | P1 |
| TC-11 | Accents and non-Latin text | Product "Café Latte Mug" exists. Product "Apple iPhone 15" exists | 1. Search each value from test data | `café`, `cafe`<br>`Аpple` (first letter is Cyrillic)<br>emoji, Chinese, Arabic text | `café` and `cafe` give the same results. `Аpple` with Cyrillic А does not find "Apple" products. Other input causes no error and is displayed correctly | P2 |
| TC-12 | XSS in the search query | - | 1. Search each value from test data<br>2. Look at the "No results for ..." text | `<script>alert(1)</script>`<br>`<img src=x onerror=alert(1)>` | The query is shown as plain text. No alert, no new elements on the page | P1 |
| TC-13 | Long query and load | Search for a common word returns many pages | 1. Search a very long query<br>2. Send the same search many times quickly<br>3. Open a far page of results | 10,000 characters<br>20+ searches in a row<br>page 50 | The long query is cut or rejected with a message, no error. Response time stays acceptable. Pages do not repeat or skip products | P3 |
| TC-14 | Search, filter and sort together | Search for "phone" returns more than one page | 1. Search "phone"<br>2. Set price 100-500<br>3. Sort by price<br>4. Go to page 2<br>5. Change sort to relevance | `phone`, 100-500 | The query and the price filter stay after every step. All products are within 100-500. The result count matches the filter | P1 |
| TC-15 | Typo and no results | - | 1. Search each value from test data | `ifone`<br>`qzxwv` | `qzxwv`: a clear "no results" message. `ifone`: no results, or only iPhone suggestions if fuzzy search exists. No unrelated products are shown to fill the page | P2 |

## Not covered here

Things I would add next: old results after a product is changed or deleted (cache), price format in different locales (1,000.50 vs 1.000,50), rate limiting of the search API, accessibility of the results list, analytics events for search.
