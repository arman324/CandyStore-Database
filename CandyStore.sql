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

create table Branch (
    BranchId int IDENTITY(1,1),
    BranchName varchar(30) not null,
    CityName varchar(30) not null,
    CountryId int,
    PRIMARY KEY (BranchId),
    FOREIGN KEY(CountryId) references Country(CountryId)
)


