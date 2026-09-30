CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT);
CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT, category TEXT, price REAL, stock INTEGER);
CREATE TABLE Orders (id INTEGER PRIMARY KEY, product_id INTEGER, user_id INTEGER, quantity INTEGER, order_date TEXT);

INSERT INTO Users VALUES
(1,'Alice Johnson','alice@example.com'),
(2,'Bob Smith','bob@example.com'),
(3,'Carol Davis','carol@example.com'),
(4,'David Brown','david@example.com'),
(5,'Eve Wilson','eve@example.com');

INSERT INTO Products VALUES
(1,'Laptop','Electronics',999.99,50),
(2,'Smartphone','Electronics',499.99,100),
(3,'Headphones','Accessories',79.99,200),
(4,'Office Chair','Furniture',150.00,30),
(5,'Desk Lamp','Furniture',40.00,75);

INSERT INTO Orders VALUES
(1,1,1,1,'2024-08-10'),
(2,2,1,2,'2024-08-15'),
(3,3,2,3,'2024-08-20'),
(4,4,3,1,'2024-08-25'),
(5,5,4,1,'2024-08-25'),
(6,1,5,1,'2024-08-26'),
(7,3,1,1,'2024-08-27'),
(8,2,3,2,'2024-08-28'),
(9,3,2,2,'2024-08-29'),
(10,4,4,1,'2024-08-30'),
(11,5,5,3,'2024-08-31');
