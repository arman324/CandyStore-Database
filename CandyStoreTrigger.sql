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
