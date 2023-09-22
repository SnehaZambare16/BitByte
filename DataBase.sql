use inidannetbank;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    RegistrationStatus VARCHAR(20),
    AdharNumber VARCHAR(12), -- Add Adhar Number attribute
    PANNumber VARCHAR(10)    -- Add PAN Number attribute
);

CREATE TABLE Account (
    AccountNumber INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10, 2),
    MinBalance DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2), -- Add InterestRate for Savings Account
    OverdraftLimit DECIMAL(10, 2), -- Add OverdraftLimit for Current Account
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(10, 2),
    TransactionDate DATE,
    Description VARCHAR(255),
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

CREATE TABLE Cheque (
    ChequeNumber INT PRIMARY KEY,
    CustomerID INT,
    ChequeAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    CustomerID INT,
    BillType VARCHAR(50),
    BillAmount DECIMAL(10, 2),
    DueDate DATE,
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE UtilityService (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(50)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    CustomerID INT,
    Username VARCHAR(50),
    Password VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE MoneyTransfer (
    TransferID INT PRIMARY KEY,
    SenderCustomerID INT,
    ReceiverCustomerID INT,
    Amount DECIMAL(10, 2),
    TransferDate DATE,
    TransferStatus VARCHAR(20),
    FOREIGN KEY (SenderCustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ReceiverCustomerID) REFERENCES Customer(CustomerID)
);
