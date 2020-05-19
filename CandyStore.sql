use CandyStore;

create table Product (
    ProductId bigint IDENTITY(1,1),
    Name varchar(20) not null,
    Color varchar(20),
    ProductionDate date not null,
    ExpirationDate date not null,
    Price NUMERIC (10,2) not null,
    PRIMARY KEY (ProductId)
)

create table Country( --The name of the country that the CandyStore has a branch in this country
    CountryId int IDENTITY(1,1),
    CountryName varchar(20) not null,
    CountryCode varchar(5) not null, --US , FR , DE
    ContinentName varchar (20) not null,
    PRIMARY KEY (CountryId)
)

create table City (
    CityId int IDENTITY(1,1),
    CityName varchar(30) not null,
    CountryId int,
    PRIMARY KEY (CityId),
    FOREIGN KEY(CountryId) references Country(CountryId)
)

create table Branch (
    BranchId int IDENTITY(1,1),
    BranchName varchar(30) not null,
    CityId int,
    PRIMARY KEY (BranchId),
    FOREIGN KEY(CityId) references City(CityId)
)

create table Customer (
    CustomerId int IDENTITY(1,1),
    CustomerName varchar(30) not null,
    CustomerLastName varchar(30) not null,
    PhoneNumber varchar(12),
    CityId int,
    PRIMARY KEY (CustomerId),
    FOREIGN KEY(CityId) references City(CityId)
)


create table Manager (
    ManagerId int IDENTITY(1,1),
    ManagerName varchar(30) not null,
    ManagerLastName varchar(30) not null,
    NationalCode varchar(20),
    BranchId int,
    PRIMARY KEY (ManagerId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)

create table Employee (
    EmployeeId int IDENTITY(1,1),
    EmployeeName varchar(30) not null,
    EmployeeLastName varchar(30) not null,
    NationalCode varchar(20),
    BranchId int,
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)