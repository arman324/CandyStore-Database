USE CandyStore
Go

-- TRIGGER 1     
create TRIGGER CheckPhoneNumber
 on CustomerPhoneNumber
 INSTEAD of INSERT
 as 
 declare @PhoneNumber varchar(15);
 set @PhoneNumber = (select PhoneNumber from inserted)
 if (LEN(@PhoneNumber) < 12)
  begin 
        print 'Invalid phoneNumber - try again'   
  end
  else 
  insert into CustomerPhoneNumber 
  select CustomerId,concat('+',@PhoneNumber)
  from inserted 


insert into CustomerPhoneNumber values(39,'49-2330')
insert into CustomerPhoneNumber values(39,'49-2300000000')
select * from CustomerPhoneNumber
