-- Creating Customers Table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

--Creating Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES (1, 'Alice', 'New York');
INSERT INTO Customers VALUES (2, 'Bob', 'Chicago');
INSERT INTO Customers VALUES (3, 'Charlie', 'New York');
INSERT INTO Customers VALUES (4, 'David', 'Los Angeles');
INSERT INTO Customers VALUES (5, 'Eve', 'Chicago');
INSERT INTO Customers VALUES (6, 'Frank', 'Miami');
INSERT INTO Customers VALUES (7, 'Grace', 'Los Angeles');
INSERT INTO Customers VALUES (8, 'Helen', 'Miami');

-- Insert sample data into Orders
INSERT INTO Orders VALUES (101, 1, '2024-01-05', 250.00);
INSERT INTO Orders VALUES (102, 2, '2024-01-10', 150.00);
INSERT INTO Orders VALUES (103, 1, '2024-02-15', 300.00);
INSERT INTO Orders VALUES (104, 3, '2024-02-20', 500.00);
INSERT INTO Orders VALUES (105, 2, '2024-03-05', 200.00);
INSERT INTO Orders VALUES (106, 4, '2024-03-18', 700.00);
INSERT INTO Orders VALUES (107, 5, '2024-03-25', 120.00);
INSERT INTO Orders VALUES (108, 6, '2024-04-02', 450.00);
INSERT INTO Orders VALUES (109, 7, '2024-04-12', 600.00);
INSERT INTO Orders VALUES (110, 8, '2024-04-20', 320.00);
INSERT INTO Orders VALUES (111, 1, '2024-05-01', 220.00);
INSERT INTO Orders VALUES (112, 4, '2024-05-10', 350.00);
INSERT INTO Orders VALUES (113, 5, '2024-05-15', 500.00);
INSERT INTO Orders VALUES (114, 6, '2024-05-25', 410.00);
INSERT INTO Orders VALUES (115, 7, '2024-06-01', 275.00);
INSERT INTO Orders VALUES (116, 8, '2024-06-05', 190.00);
INSERT INTO Orders VALUES (117, 2, '2024-06-12', 330.00);
INSERT INTO Orders VALUES (118, 3, '2024-06-18', 250.00);
INSERT INTO Orders VALUES (119, 4, '2024-07-02', 800.00);
INSERT INTO Orders VALUES (120, 5, '2024-07-08', 150.00);
