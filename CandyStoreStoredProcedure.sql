USE CandyStore
Go

-- STORED PROCEDURE 1 

create PROCEDURE CheckPhoneNumbersFormat 
AS
    BEGIN
        delete from CustomerPhoneNumber
        where CHARINDEX('-', PhoneNumber) = 0 or LEN(PhoneNumber) < 12
END

EXECUTE CheckPhoneNumbersFormat


-- STORED PROCEDURE 2
create PROCEDURE CheckExpirationDate
AS
    BEGIN
        select * 
        from Product
        where CONVERT(date,DATEADD(DAY, -90, GETDATE())) > ExpirationDate
END


EXECUTE CheckExpirationDate


-- STORED PROCEDURE 3
