USE CandyStore
Go

create view vManagerOfBranch AS
    select CONCAT(Manager.ManagerName, CONCAT (' ',ManagerLastName)) as ManagerName, BranchName, CityName
    from Branch
     inner join Manager
      ON(Branch.BranchId = Manager.BranchId)
     inner join City
      ON(Branch.CityId = City.CityId)


create view vSumTotalForEachCustomer AS
    with myTable(id, sumTotal) AS 
        (select Customer.CustomerId, SUM (TotalCost) as sumTotal
        from InvoiceHeader 
         inner join Customer
          ON (InvoiceHeader.CustomerId = Customer.CustomerId)
        GROUP BY (Customer.CustomerId))
    select Customer.CustomerId, CONCAT(Customer.CustomerName, CONCAT (' ',Customer.CustomerLastName)) as CustomerName, myTable.sumTotal as 'Sum total of all Purchases over the time'  
    from myTable 
     inner join Customer
       ON (myTable.id = Customer.CustomerId)


create view vEmployee AS
    select [EmployeeId], EmployeeName + ' ' + EmployeeLastName as EmployeeName, Role, BranchName
    from Employee 
     inner join Branch
      ON(Employee.BranchId = Branch.BranchId)


create view vlistOfAllDeliveryDrivers AS
    select * 
    from vEmployee
    where Role = 'Delivery Driver'


create view vManager AS
    select ManagerId, ManagerName + ' ' + ManagerLastName as ManagerName, BranchName
    from Manager 
     inner join Branch
      ON(Manager.BranchId = Branch.BranchId)
