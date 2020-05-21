use CandyStore;

create table Product (
    ProductId INT IDENTITY(1,1),
    Name varchar(20) not null,
    Color varchar(20),
    ProductionDate date not null,
    ExpirationDate date not null,
    Price NUMERIC (10,2) not null,
    PRIMARY KEY (ProductId)
)

create table Country ( 
    CountryId int IDENTITY(1,1),
    CountryName varchar(20) not null UNIQUE,
    CountryCode varchar(5) not null, 
    ContinentName varchar (20) not null,
    PRIMARY KEY (CountryId)
)

create table City (
    CityId int IDENTITY(1,1),
    CityName varchar(30) not null UNIQUE,
    CountryId int,
    PRIMARY KEY (CityId),
    FOREIGN KEY(CountryId) references Country(CountryId)
)

create table Branch (
    BranchId int IDENTITY(1,1),
    BranchName varchar(30) not null UNIQUE,
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
    NationalCode varchar(20) UNIQUE,
    BranchId int,
    PRIMARY KEY (ManagerId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)

create table Employee (
    EmployeeId int IDENTITY(1,1),
    EmployeeName varchar(30) not null,
    EmployeeLastName varchar(30) not null,
    NationalCode varchar(20) UNIQUE,
    BranchId int,
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)
 
create table InvoiceHeader (
    InvoiceHeaderId int IDENTITY(1,1),
    CustomerId INT,
    BranchId INT,
    TotalCost NUMERIC(10,2),
    OrderDate TIMESTAMP not null,
    EmployeeId INT,
    PRIMARY KEY (InvoiceHeaderId),
    FOREIGN KEY(CustomerId) references Customer(CustomerId),
    FOREIGN KEY(BranchId) references Branch(BranchId),
    FOREIGN KEY(EmployeeId) references Employee(EmployeeId)
)

create table InvoiceDetail (
    InvoiceDetailId int IDENTITY(1,1),
    InvoiceHeaderId INT,
    ProductId INT,
    quantity BIGINT,
    UnitPrice NUMERIC(10,2),
    RowCost NUMERIC(10,2),
    PRIMARY KEY (InvoiceDetailId),
    FOREIGN KEY(InvoiceHeaderId) references InvoiceHeader(InvoiceHeaderId),
    FOREIGN KEY(ProductId) references Product(ProductId)
)


INSERT INTO Country VALUES ('Germany', 'DE' , 'Europe')
INSERT INTO Country VALUES ('France', 'FR' , 'Europe')
INSERT INTO Country VALUES ('Italy', 'IT' , 'Europe')
INSERT INTO Country VALUES ('Canada', 'CA' , 'North America')
INSERT INTO Country VALUES ('Japan', 'JA' , 'Asia')
INSERT INTO Country VALUES ('USA', 'US' , 'North America')


INSERT INTO City VALUES ('Berlin',1)
INSERT INTO City VALUES ('Munich',1)
INSERT INTO City VALUES ('Leipzig',1)
INSERT INTO City VALUES ('Paris',2)
INSERT INTO City VALUES ('Bologna',3)
INSERT INTO City VALUES ('Toronto',4)
INSERT INTO City VALUES ('Ottawa',4)
INSERT INTO City VALUES ('Tokyo',5)
INSERT INTO City VALUES ('Dallas',6)
INSERT INTO City VALUES ('New York',6)


INSERT INTO Branch VALUES ('CanST_01',1)
INSERT INTO Branch VALUES ('CanST_02',3)
INSERT INTO Branch VALUES ('CanST_03',4)
INSERT INTO Branch VALUES ('CanST_04',6)
INSERT INTO Branch VALUES ('CanST_05',1)
INSERT INTO Branch VALUES ('CanST_06',10)
INSERT INTO Branch VALUES ('CanST_07',7)
INSERT INTO Branch VALUES ('CanST_08',2)
INSERT INTO Branch VALUES ('CanST_09',5)
INSERT INTO Branch VALUES ('CanST_10',9)
INSERT INTO Branch VALUES ('CanST_11',2)
INSERT INTO Branch VALUES ('CanST_12',8)


INSERT INTO Manager VALUES ('Michael','Halpert','032-3295023',1)
INSERT INTO Manager VALUES ('Andy','Levinson','065-7218492',2)
INSERT INTO Manager VALUES ('Josh','Wallace','096-8329213',3)
INSERT INTO Manager VALUES ('Andy','Levinson','084-4235784',4)
INSERT INTO Manager VALUES ('Angela','Kapoor','023-9183923',5)
INSERT INTO Manager VALUES ('Martin','Bridge','099-1359523',6)
INSERT INTO Manager VALUES ('Jan','Bernard','076-9173719',7)
INSERT INTO Manager VALUES ('David','Green','038-8885234',8)
INSERT INTO Manager VALUES ('James','Smith','055-4637223',9)
INSERT INTO Manager VALUES ('Evelyn','ALbro','018-9423596',10)

