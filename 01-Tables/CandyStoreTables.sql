USE CandyStore
Go

create table Product (
    ProductId INT IDENTITY(1,1),
    Name varchar(50) not null,
    Color varchar(20),
    ProductionDate date not null,
    ExpirationDate date not null,
    Price NUMERIC (10,2) not null,
    PRIMARY KEY (ProductId)
)

create table Country ( 
    CountryId INT IDENTITY(1,1),
    CountryName varchar(20) not null UNIQUE,
    CountryCode varchar(5) not null, 
    ContinentName varchar (20) not null,
    PRIMARY KEY (CountryId)
)

create table City (
    CityId INT IDENTITY(1,1),
    CityName varchar(30) not null UNIQUE,
    CountryId int,
    PRIMARY KEY (CityId),
    FOREIGN KEY(CountryId) references Country(CountryId)
)

create table Branch (
    BranchId INT IDENTITY(1,1),
    BranchName varchar(30) not null UNIQUE,
    CityId int,
    PRIMARY KEY (BranchId),
    FOREIGN KEY(CityId) references City(CityId)
)

create table Customer (
    CustomerId INT IDENTITY(1,1),
    CustomerName varchar(30) not null,
    CustomerLastName varchar(30) not null,
    CityId int,
    PRIMARY KEY (CustomerId),
    FOREIGN KEY(CityId) references City(CityId)
)

create table CustomerPhoneNumber (
    CustomerId INT,
    PhoneNumber varchar(15),
    FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId)
)

create table Manager (
    ManagerId INT IDENTITY(1,1),
    ManagerName varchar(30) not null,
    ManagerLastName varchar(30) not null,
    NationalCode varchar(20) UNIQUE,
    BranchId int,
    PRIMARY KEY (ManagerId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)

create table Employee (
    EmployeeId INT IDENTITY(1,1),
    EmployeeName varchar(30) not null,
    EmployeeLastName varchar(30) not null,
    Role varchar(20) not null,
    NationalCode varchar(20) UNIQUE,
    BranchId int,
    PRIMARY KEY (EmployeeId),
    CHECK (Role in ('Cashier','Delivery Driver','Custodian')),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)

create table BirthdayService (
    BirthdayServiceId INT,
    ServiceName varchar(30),
    Description varchar(120),
    Price NUMERIC (10,2) not null,
    PRIMARY KEY (BirthdayServiceId)
)

create table InvoiceHeader (
    InvoiceHeaderId INT IDENTITY(1,1),
    CustomerId INT,
    BranchId INT,
    BirthdayServiceStatus VARCHAR(4),
    BirthdayServiceId INT,
    TotalCost NUMERIC(10,2),
    OrderDate DATE not null,
    EmployeeId INT,
    PRIMARY KEY (InvoiceHeaderId),
    CHECK (BirthdayServiceStatus in ('YES','NO')),
    FOREIGN KEY(BirthdayServiceId) references BirthdayService(BirthdayServiceId),
    FOREIGN KEY(CustomerId) references Customer(CustomerId),
    FOREIGN KEY(BranchId) references Branch(BranchId),
    FOREIGN KEY(EmployeeId) references Employee(EmployeeId)
)

create table InvoiceDetail (
    InvoiceDetailId INT IDENTITY(1,1),
    InvoiceHeaderId INT,
    ProductId INT,
    quantity BIGINT,
    UnitPrice NUMERIC(10,2),
    RowCost NUMERIC(10,2),
    PRIMARY KEY (InvoiceDetailId),
    FOREIGN KEY(InvoiceHeaderId) references InvoiceHeader(InvoiceHeaderId),
    FOREIGN KEY(ProductId) references Product(ProductId)
)

