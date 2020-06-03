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