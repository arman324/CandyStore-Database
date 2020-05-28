USE CandyStore
Go

--Country
INSERT INTO Country VALUES ('Germany', 'DE' , 'Europe')
INSERT INTO Country VALUES ('France', 'FR' , 'Europe')
INSERT INTO Country VALUES ('Italy', 'IT' , 'Europe')
INSERT INTO Country VALUES ('Canada', 'CA' , 'North America')
INSERT INTO Country VALUES ('Japan', 'JA' , 'Asia')
INSERT INTO Country VALUES ('USA', 'US' , 'North America')
INSERT INTO Country VALUES ('sd', 'US' , 'North America')


--City
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


--Branch
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


--Manager
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


--Employee
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


--Product
INSERT INTO Product VALUES (1,'Nik-L-Nips Wax Bottles Candy','Colorful','2020-04-22','2022-04-22',5.99)
INSERT INTO Product VALUES (2,'Necco Wafers Candy','Colorful','2020-01-25','2021-01-25',3.69)
INSERT INTO Product VALUES (3,'Sugar Daddy Milk Caramel Pops','Brown','2020-02-15','2022-02-15',6.99)
INSERT INTO Product VALUES (4,'Pop Rocks Candy','Colorful','2019-12-05','2022-12-05',1.99)
INSERT INTO Product VALUES (5,'Nerds Candy','Colorful','2019-11-23','2022-05-23',7.69)
INSERT INTO Product VALUES (6,'Jawbreakers Candy','Colorful','2018-10-20','2020-10-20',4.99)
INSERT INTO Product VALUES (7,'Salt Water Taffy','Colorful','2020-03-21','2021-03-21',2.99)
INSERT INTO Product VALUES (8,'Jolly Ranchers Candy','Colorful','2020-05-16','2023-05-16',4.69)
INSERT INTO Product VALUES (9,'Smarties Candy','Colorful','2019-11-12','2020-11-12',2.99)
INSERT INTO Product VALUES (10,'Milk Duds','Brown','2019-12-07','2021-12-07',1.99)
INSERT INTO Product VALUES (11,'Charms Blow Pop','Colorful','2020-02-14','2022-08-14',1.69)
INSERT INTO Product VALUES (12,'Atomic Fireballs Candy','Red','2020-04-27','2022-04-27',6.69)
INSERT INTO Product VALUES (13,'Starburst Fruit Chews Candy','Pink','2020-03-09','2023-03-09',3.99)
INSERT INTO Product VALUES (14,'Junior Mints','Brown','2020-05-01','2021-05-01',5.99)
INSERT INTO Product VALUES (15,'Swedish Fish Candy','Colorful','2018-04-12','2020-10-12',2.69)
INSERT INTO Product VALUES (16,'Milky Way Candy Bar','Brown','2019-10-03','2021-04-03',5.99)
INSERT INTO Product VALUES (17,'Skittles Candy','Colorful','2020-02-04','2022-02-04',7.99)
INSERT INTO Product VALUES (18,'M&M''s Candy','Colorful','2020-04-26','2023-04-26',4.69)
INSERT INTO Product VALUES (19,'Life Savers Candy','Colorful','2020-03-13','2021-03-13',8.99)
INSERT INTO Product VALUES (20,'Laffy Taffy','Pink','2020-02-02','2021-02-02',2.69)


--Customer
INSERT INTO Customer VALUES (1,'Bristol','King','+49-3423132342',1)
INSERT INTO Customer VALUES (2,'Trenton','Maul','+49-9995043423',1)
INSERT INTO Customer VALUES (3,'Edith','Leatherwood','+49-5993430234',1)
INSERT INTO Customer VALUES (4,'Scott','Lloyd','+49-9576844445',1)
INSERT INTO Customer VALUES (5,'Taylor','Henslee','+49-3239995323',2)
INSERT INTO Customer VALUES (6,'Duke','Martin','+49-8394923034',2)
INSERT INTO Customer VALUES (7,'Reign','Henton','+49-7534523492',2)
INSERT INTO Customer VALUES (8,'Ryland','Jenkins','+49-9434023432',2)
INSERT INTO Customer VALUES (9,'Tatum','Matson','+49-8884934888',3)
INSERT INTO Customer VALUES (10,'Edison','Leavey','+49-7535342342',3)
INSERT INTO Customer VALUES (11,'Cannon','Leeman','+49-8859459346',3)
INSERT INTO Customer VALUES (12,'Sutton','Rogers','+33-9593000443',4)
INSERT INTO Customer VALUES (13,'Keaton','Howard','+33-0392343745',4)
INSERT INTO Customer VALUES (14,'Brock','Kimball','+39-5382341312',5)
INSERT INTO Customer VALUES (15,'Lewis','Inscoe','+39-9430329342',5)
INSERT INTO Customer VALUES (16,'Charley','Adams','+39-8392013234',5)
INSERT INTO Customer VALUES (17,'Mae','Kettell','+39-6630329342',5)
INSERT INTO Customer VALUES (18,'Macy','Barnes','+1-9943832733',6)
INSERT INTO Customer VALUES (19,'Axton','Spencer','+1-3234338853',6)
INSERT INTO Customer VALUES (20,'Henley','Webster','+1-4834300948',7)
INSERT INTO Customer VALUES (21,'Colby','Ives','+1-9493843448',7)
INSERT INTO Customer VALUES (22,'Trey','Wilkinson','+1-8884309993',7)
INSERT INTO Customer VALUES (23,'Anne','Lee','+1-2777332832',7)
INSERT INTO Customer VALUES (24,'Dorothy','Young','+81-8934534233',8)
INSERT INTO Customer VALUES (25,'Quinton','Lopez','+81-1119231342',8)
INSERT INTO Customer VALUES (26,'Crew','Kin','+81-5119923342',8)
INSERT INTO Customer VALUES (27,'Rosie','Gibson','+81-2992333342',8)
INSERT INTO Customer VALUES (28,'Wilson','Wright','+1-8832732313',9)
INSERT INTO Customer VALUES (29,'Aubrie','Scott','+1-8990392342',9)
INSERT INTO Customer VALUES (30,'Ivory','Kindrick','+1-3333852332',10)
INSERT INTO Customer VALUES (31,'Fletcher','Robinson','+1-9999000323',10)
INSERT INTO Customer VALUES (32,'Braden','Jagger','+1-7723832342',10)
INSERT INTO Customer VALUES (33,'Alden','Hemby','+1-8882934234',10)
INSERT INTO Customer VALUES (34,'Briggs','Isle','+1-9983473432',10)
INSERT INTO Customer VALUES (35,'Lilian','Corbyn','+1-9983723423',10)
INSERT INTO Customer VALUES (36,'Sam','Butler','+1-7890903231',10)
INSERT INTO Customer VALUES (37,'Mitchell','Ward','+1-6627307429',10)
INSERT INTO Customer VALUES (38,'Chris','Harrison','+1-8883923833',10)
INSERT INTO Customer VALUES (39,'Wilder','Edwards','+49-2303495320',1)


--BirthdayService
INSERT INTO BirthdayService VALUES (0,'Not used','The customer doesn''t use birthday services.',0.00)
INSERT INTO BirthdayService VALUES (1,'Firework Birthday Party','Make the new freedom the center of your birthday party by including fireworks.',39.99)
INSERT INTO BirthdayService VALUES (2,'Sports Birthday Party','Decorate the food with the honoree’s favorite sport. This means football candy or baseball chocolate.',49.69)


--InvoiceHeader
INSERT INTO InvoiceHeader VALUES (1,1,1,'NO',0,77.92,'2020-04-22',1)
INSERT INTO InvoiceHeader VALUES (2,1,5,'YES',2,245.79,'2019-12-17',12)
INSERT INTO InvoiceHeader VALUES (3,6,11,'No',0,225.43,'2020-02-13',25)
INSERT INTO InvoiceHeader VALUES (4,35,6,'No',0,373.45,'2020-03-05',14)
INSERT INTO InvoiceHeader VALUES (5,22,7,'YES',1,294.26,'2019-12-27',17)
INSERT INTO InvoiceHeader VALUES (6,14,9,'NO',0,200.33,'2019-12-08',21)
INSERT INTO InvoiceHeader VALUES (7,20,7,'NO',0,34.58,'2020-02-19',17)
INSERT INTO InvoiceHeader VALUES (8,10,2,'NO',0,18.83,'2020-04-10',5)
INSERT INTO InvoiceHeader VALUES (9,28,10,'NO',0,69.86,'2020-03-01',23)
INSERT INTO InvoiceHeader VALUES (10,13,3,'NO',0,125.23,'2019-12-19',7)


--InvoiceDetail
INSERT INTO InvoiceDetail VALUES (1,1,1,5,5.99,29.95)
INSERT INTO InvoiceDetail VALUES (2,1,20,3,2.69,8.07)
INSERT INTO InvoiceDetail VALUES (3,1,13,10,3.99,39.90)
INSERT INTO InvoiceDetail VALUES (4,2,3,3,6.99,20.97)
INSERT INTO InvoiceDetail VALUES (5,2,19,12,8.99,107.88)
INSERT INTO InvoiceDetail VALUES (6,2,20,25,2.69,67.25)
INSERT INTO InvoiceDetail VALUES (7,3,9,40,2.99,119.6)
INSERT INTO InvoiceDetail VALUES (8,3,12,10,6.69,66.9)
INSERT INTO InvoiceDetail VALUES (9,3,2,3,3.69,11.07)
INSERT INTO InvoiceDetail VALUES (10,3,4,14,1.99,27.86)
INSERT INTO InvoiceDetail VALUES (11,4,17,35,7.99,279.65)
INSERT INTO InvoiceDetail VALUES (12,4,8,20,4.69,93.8)
INSERT INTO InvoiceDetail VALUES (13,5,5,10,7.69,76.9)
INSERT INTO InvoiceDetail VALUES (14,5,14,13,5.99,77.87)
INSERT INTO InvoiceDetail VALUES (15,5,10,50,1.99,99.5)
INSERT INTO InvoiceDetail VALUES (16,6,7,67,2.99,200.33)
INSERT INTO InvoiceDetail VALUES (17,7,18,2,4.69,9.38)
INSERT INTO InvoiceDetail VALUES (18,7,2,4,3.69,14.76)
INSERT INTO InvoiceDetail VALUES (19,7,4,1,1.99,1.99)
INSERT INTO InvoiceDetail VALUES (20,7,11,5,1.69,8.45)
INSERT INTO InvoiceDetail VALUES (21,8,20,7,2.69,18.83)
INSERT INTO InvoiceDetail VALUES (22,9,6,14,4.99,69.86)
INSERT INTO InvoiceDetail VALUES (23,10,15,2,2.69,5.38)
INSERT INTO InvoiceDetail VALUES (24,10,17,15,7.99,119.85)
