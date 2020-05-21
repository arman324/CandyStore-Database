USE CandyStore
Go

create table Product (
    ProductId INT,
    Name varchar(20) not null,
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
    CityId INT,
    CityName varchar(30) not null UNIQUE,
    CountryId int,
    PRIMARY KEY (CityId),
    FOREIGN KEY(CountryId) references Country(CountryId)
)

create table Branch (
    BranchId INT,
    BranchName varchar(30) not null UNIQUE,
    CityId int,
    PRIMARY KEY (BranchId),
    FOREIGN KEY(CityId) references City(CityId)
)

create table Customer (
    CustomerId INT,
    CustomerName varchar(30) not null,
    CustomerLastName varchar(30) not null,
    PhoneNumber varchar(12),
    CityId int,
    PRIMARY KEY (CustomerId),
    FOREIGN KEY(CityId) references City(CityId)
)


create table Manager (
    ManagerId INT,
    ManagerName varchar(30) not null,
    ManagerLastName varchar(30) not null,
    NationalCode varchar(20) UNIQUE,
    BranchId int,
    PRIMARY KEY (ManagerId),
    FOREIGN KEY(BranchId) references Branch(BranchId)
)

create table Employee (
    EmployeeId INT,
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
    InvoiceHeaderId INT,
    CustomerId INT,
    BranchId INT,
    BirthdayServiceStatus VARCHAR(4),
    BirthdayServiceId INT,
    TotalCost NUMERIC(10,2),
    OrderDate TIMESTAMP not null,
    EmployeeId INT,
    PRIMARY KEY (InvoiceHeaderId),
    CHECK (BirthdayServiceStatus in ('YES','NO')),
    FOREIGN KEY(BirthdayServiceId) references BirthdayService(BirthdayServiceId),
    FOREIGN KEY(CustomerId) references Customer(CustomerId),
    FOREIGN KEY(BranchId) references Branch(BranchId),
    FOREIGN KEY(EmployeeId) references Employee(EmployeeId)
)

create table InvoiceDetail (
    InvoiceDetailId INT,
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
INSERT INTO Country VALUES ('sd', 'US' , 'North America')


INSERT INTO City VALUES (1,'Berlin',1)
INSERT INTO City VALUES (2,'Munich',1)
INSERT INTO City VALUES (3,'Leipzig',1)
INSERT INTO City VALUES (4,'Paris',2)
INSERT INTO City VALUES (5,'Bologna',3)
INSERT INTO City VALUES (6,'Toronto',4)
INSERT INTO City VALUES (7,'Ottawa',4)
INSERT INTO City VALUES (8,'Tokyo',5)
INSERT INTO City VALUES (9,'Dallas',6)
INSERT INTO City VALUES (10,'New York',6)


INSERT INTO Branch VALUES (1,'CanST_01',1)
INSERT INTO Branch VALUES (2,'CanST_02',3)
INSERT INTO Branch VALUES (3,'CanST_03',4)
INSERT INTO Branch VALUES (4,'CanST_04',6)
INSERT INTO Branch VALUES (5,'CanST_05',1)
INSERT INTO Branch VALUES (6,'CanST_06',10)
INSERT INTO Branch VALUES (7,'CanST_07',7)
INSERT INTO Branch VALUES (8,'CanST_08',2)
INSERT INTO Branch VALUES (9,'CanST_09',5)
INSERT INTO Branch VALUES (10,'CanST_10',9)
INSERT INTO Branch VALUES (11,'CanST_11',2)
INSERT INTO Branch VALUES (12,'CanST_12',8)


INSERT INTO Manager VALUES (1,'Michael','Halpert','032-3295023',1)
INSERT INTO Manager VALUES (2,'Andy','Levinson','065-7218492',2)
INSERT INTO Manager VALUES (3,'Josh','Wallace','096-8329213',3)
INSERT INTO Manager VALUES (4,'Andy','Levinson','084-4235784',4)
INSERT INTO Manager VALUES (5,'Angela','Kapoor','023-9183923',5)
INSERT INTO Manager VALUES (6,'Martin','Bridge','099-1359523',6)
INSERT INTO Manager VALUES (7,'Jan','Bernard','076-9173719',7)
INSERT INTO Manager VALUES (8,'David','Green','038-8885234',8)
INSERT INTO Manager VALUES (9,'James','Smith','055-4637223',9)
INSERT INTO Manager VALUES (10,'Evelyn','ALbro','018-9423596',10)


INSERT INTO Employee VALUES (1,'Avery','Albin','Cashier','043-8422023',1)
INSERT INTO Employee VALUES (2,'Jackson','Barks','Custodian','011-6245234',1)
INSERT INTO Employee VALUES (3,'Madison','Basil','Delivery Driver','033-0032833',1)
INSERT INTO Employee VALUES (4,'William','Bevis','Delivery Driver','052-8822031',1)
INSERT INTO Employee VALUES (5,'Mason','Camm','Cashier','012-0238939',2)
INSERT INTO Employee VALUES (6,'Jane','Bruckman','Custodian','067-9992319',2)
INSERT INTO Employee VALUES (7,'Clark','Budge','Cashier','099-8394023',3)
INSERT INTO Employee VALUES (8,'Tanner','Capp','Custodian','074-8430313',3)
INSERT INTO Employee VALUES (9,'Clayton','Bigwood','Cashier','046-0523413',4)
INSERT INTO Employee VALUES (10,'Sawyer','Canby','Custodian','037-0004231',4)
INSERT INTO Employee VALUES (11,'Vanessa','Capshaw','Delivery Driver','072-5230032',4)
INSERT INTO Employee VALUES (12,'Wade','Claydon','Cashier','088-8349343',5)
INSERT INTO Employee VALUES (13,'Reed','Danby','Custodian','043-3299942',5)
INSERT INTO Employee VALUES (14,'Paige','Eno','Cashier','028-1032211',6)
INSERT INTO Employee VALUES (15,'Holden','Clift','Custodian','094-9532933',6)
INSERT INTO Employee VALUES (16,'Tyson','Flitter','Delivery Driver','090-8888432',6)
INSERT INTO Employee VALUES (17,'Parker','Gedman','Cashier','052-8423423',7)
INSERT INTO Employee VALUES (18,'Alexis','Dalton','Custodian','054-8593234',7)
INSERT INTO Employee VALUES (19,'Marley','Flemons','Cashier','063-7753832',8)
INSERT INTO Employee VALUES (20,'Archer','Covel','Custodian','068-9903011',8)
INSERT INTO Employee VALUES (21,'Graham','Dale','Cashier','082-3339923',9)
INSERT INTO Employee VALUES (22,'Maggie','Clay','Custodian','033-6887423',9)
INSERT INTO Employee VALUES (23,'Rylan','Evens','Cashier','063-0009991',10)
INSERT INTO Employee VALUES (24,'Annie','Courte','Custodian','024-5323421',10)
INSERT INTO Employee VALUES (25,'Juliet','Grenfell','Cashier','071-9583293',11)
INSERT INTO Employee VALUES (26,'Lane','Gaunt','Custodian','018-8574630',11)
INSERT INTO Employee VALUES (27,'Peyton','Halpert','Cashier','002-9993281',12)
INSERT INTO Employee VALUES (28,'Harley','Hardison','Custodian','062-0129313',12)
