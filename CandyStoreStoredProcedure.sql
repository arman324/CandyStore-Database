USE CandyStore
Go

-- STORED PROCEDURE 1 

create PROCEDURE CheckPhoneNumbersFormat 
AS
    BEGIN
        delete from CustomerPhoneNumber
        where CHARINDEX('-', PhoneNumber) = 0 
END

EXECUTE CheckPhoneNumbersFormat


