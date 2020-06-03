USE CandyStore
Go


create function PhoneNumber_Country (@PhoneNumber VARCHAR(15))
    returns varchar(60)
    BEGIN
    declare @CountryName varchar(60);

                            if (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+49')
                             set @CountryName = @PhoneNumber + ' is ' + 'Germany';

                            else if (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+33')
                             set @CountryName = @PhoneNumber + ' is ' + 'France';

                            else if (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+39')
                             set @CountryName = @PhoneNumber + ' is ' + 'Italy';

                            else if (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+1')
                             set @CountryName = @PhoneNumber + ' is ' + 'Canada Or USA';

                            else if (SUBSTRING (@PhoneNumber,1,PATINDEX('%-%',@PhoneNumber)-1) = '+81')
                             set @CountryName = @PhoneNumber + ' is ' + 'Japan';

                            else 
                             set @CountryName = @PhoneNumber + ' isn''t recognizable';

    RETURN @CountryName                             
end
