select * from BirthdayService
select * from Product
select * from Customer
select * from Branch
select * from Employee
select * from Manager
select * from City
select * from Country
select * from InvoiceHeader
select * from InvoiceDetail

select * from vManagerOfBranch
select * from vSumTotalForEachCustomer
select * from vlistOfAllDeliveryDrivers
select * from vEmployee
select * from vManager

-- Query 1
select Customer.CustomerName + ' ' + Customer.CustomerLastName as Name, Country.CountryName, Country.ContinentName
from Customer 
 inner join City
  ON (Customer.CityId = City.CityId)
 inner join Country
   ON (City.CountryId = Country.CountryId)
where Country.ContinentName = 'North America'


-- Query 2
with newTable1 (CountryName, TotalSales) as
    (select Country.CountryName ,SUM(InvoiceHeader.TotalCost)
    from InvoiceHeader 
     inner join Branch
         ON (InvoiceHeader.BranchId = Branch.BranchId)
     inner join City
         ON (Branch.CityId = City.CityId)
     inner join Country
          ON (City.CountryId = Country.CountryId)
    GROUP BY CountryName)

select Country.CountryName, ISNULL(TotalSales, 0) as TotalSales
from Country left join newTable1
on (Country.CountryName = newTable1.CountryName)
ORDER BY TotalSales DESC


-- Query 3
select vSumTotalForEachCustomer.CustomerID, vSumTotalForEachCustomer.CustomerName, vSumTotalForEachCustomer."Sum total of all Purchases over the time", CityName
from vSumTotalForEachCustomer
 inner join Customer
  ON (vSumTotalForEachCustomer.CustomerID = Customer.CustomerId)
 inner join City
   ON (Customer.CityId = City.CityId)
order by 'Sum total of all Purchases over the time' DESC


-- Query 4
with myTable(BranchId, TotalCost) AS 
    (select BranchId, SUM(TotalCost) as TotalCost
    from InvoiceHeader
    group by (BranchId))

select BranchName, myTable.TotalCost
from myTable 
 inner join Branch
  ON (myTable.BranchId = Branch.BranchId)
    

-- Query 5
WITH newTabel1(CountryName, ContinentName) as 
    (select Country.CountryName, ContinentName 
    from Country)

select case GROUPING(Country.CountryName)
        when 0 then Country.CountryName
        when 1 then 'ALL Countries'
        END AS Country, 
        case GROUPING(Country.ContinentName) 
        when 0 then Country.ContinentName
        when 1 then case GROUPING(Country.CountryName) 
                        when 0 then (select ContinentName from newTabel1 where Country.CountryName = newTabel1.CountryName)
                        when 1 then 'All Continents'
                        end
        END AS Continent, 
        SUM(InvoiceHeader.TotalCost) as TotalCost,
        COUNT(InvoiceHeader.InvoiceHeaderId) as SalesCount

from InvoiceHeader 
     inner join Branch
         ON (InvoiceHeader.BranchId = Branch.BranchId)
     inner join City
         ON (Branch.CityId = City.CityId)
     inner join Country
          ON (City.CountryId = Country.CountryId)
GROUP BY GROUPING SETS(
    (),
    (Country.CountryName), 
    (Country.ContinentName)
) 
order by Country.CountryName, Country.ContinentName   
