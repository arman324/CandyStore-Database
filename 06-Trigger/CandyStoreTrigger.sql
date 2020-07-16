USE CandyStore
Go

-- TRIGGER 1     
create TRIGGER CheckPhoneNumber
 on CustomerPhoneNumber
 INSTEAD of INSERT
 as 
 declare @PhoneNumber varchar(15);
 set @PhoneNumber = (select PhoneNumber from inserted)
  insert into CustomerPhoneNumber 
  select CustomerId,concat('+',@PhoneNumber)
  from inserted 


insert into CustomerPhoneNumber values(39,'49-2300000000')
insert into CustomerPhoneNumber values(39,'230000000000')
insert into CustomerPhoneNumber values(39,'49-2330')
select * from CustomerPhoneNumber


-- TRIGGER 2
create TRIGGER CheckNationalCode
 on Manager
 AFTER INSERT
 AS
 declare @nationalCode varchar(20);
 set @nationalCode = (select NationalCode from inserted)

 if (SUBSTRING(@nationalCode,1,1) <> 0)
    set @nationalCode = CONCAT('0',@nationalCode)

 UPDATE Manager
 set NationalCode = CONCAT(SUBSTRING(@nationalCode,1,3),CONCAT('-',SUBSTRING(@nationalCode,4,len(@nationalCode))))
 where ManagerId = (select ManagerId from inserted)


-- TRIGGER 3
CREATE TRIGGER ModifyGetDate
 on InvoiceHeader
 AFTER INSERT
 as 
 DECLARE @BirthDayServiceId INT;
 Declare @YES_NO varchar(3);
 set @BirthDayServiceId = (select BirthdayServiceId from inserted)
 
   if @BirthDayServiceId = 0
    set @YES_NO = 'NO'
    else 
    set @YES_NO = 'YES'
 
    UPDATE InvoiceHeader
    set BirthdayServiceStatus = @YES_NO
    where InvoiceHeaderId = (select InvoiceHeaderId from inserted)



