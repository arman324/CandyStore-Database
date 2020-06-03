USE CandyStore
Go

select * from BirthdayService
select * from vBirthdayService

create view vBirthdayService AS
    SELECT ServiceName, [Description], Price
    FROM BirthdayService
    WHERE BirthdayServiceId not in (0)


