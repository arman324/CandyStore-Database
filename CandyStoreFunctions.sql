USE CandyStore
Go


--FUNCTION 1
CREATE FUNCTION PhoneNumber_Country (@PhoneNumber VARCHAR(15))
    RETURNS VARCHAR(60)
    BEGIN
    DECLARE @CountryName VARCHAR(60);

                            IF (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+49')
                             SET @CountryName = @PhoneNumber + ' is ' + 'Germany';

                            ELSE IF (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+33')
                             SET @CountryName = @PhoneNumber + ' is ' + 'France';

                            ELSE IF (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+39')
                             SET @CountryName = @PhoneNumber + ' is ' + 'Italy';

                            ELSE IF (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+1')
                             SET @CountryName = @PhoneNumber + ' is ' + 'Canada Or USA';

                            ELSE IF (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+81')
                             SET @CountryName = @PhoneNumber + ' is ' + 'Japan';

                            ELSE 
                             SET @CountryName = @PhoneNumber + ' isn''t recognizable';

    RETURN @CountryName                      
END


--FUNCTION 2
CREATE FUNCTION ManagerInformation (@Id INT)
    RETURNS TABLE
    AS

        RETURN
        SELECT CONCAT(Manager.ManagerName, CONCAT (' ',ManagerLastName)) as ManagerName, NationalCode, Branch.BranchName
        FROM Manager 
         INNER JOIN Branch
          ON (Manager.BranchId = Branch.BranchId)
        WHERE Manager.ManagerId = @Id


-- FUNCTION 3
create FUNCTION Countries_date (@year int,
                         @name varchar(50)
                        )
    returns table 

    as 

        return 
              
            select Distinct Product.Name, CountryName
            from InvoiceDetail
                inner join InvoiceHeader
                on (InvoiceDetail.InvoiceHeaderId = InvoiceHeader.InvoiceHeaderId)
                inner join Branch
                    on (InvoiceHeader.BranchId = Branch.BranchId)
                inner join City
                    on (City.CityId = Branch.CityId)
                inner join Country
                    on (Country.CountryId = City.CountryId)
                inner join Product
                    on (InvoiceDetail.ProductId = Product.ProductId)
            where (Product.Name = @name) 
                    and 
                   (year(InvoiceHeader.OrderDate) = @year)



-- FUNCTION 4
create FUNCTION PhoneNumber_Name (@PhoneNumber VARCHAR(15))
    returns table 
    as
    return
        select Customer.CustomerId, CustomerName, CustomerLastName, CityName 
        from Customer inner join City
                on (Customer.CityId = City.CityId)
             inner join CustomerPhoneNumber
                on (Customer.CustomerId = CustomerPhoneNumber.CustomerId)
        where CustomerPhoneNumber.PhoneNumber = @PhoneNumber 
                            

