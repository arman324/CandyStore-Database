USE CandyStore
Go

create view vManagerOfBranch AS
    select CONCAT(Manager.ManagerName, CONCAT (' ',ManagerLastName)) as ManagerName, BranchName, CityName
    from Branch
     inner join Manager
      ON(Branch.BranchId = Manager.BranchId)
     inner join City
      ON(Branch.CityId = City.CityId)

