CREATE TABLE Customers_login(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    account NVARCHAR(50) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
)