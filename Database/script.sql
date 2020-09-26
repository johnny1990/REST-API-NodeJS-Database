CREATE TABLE [dbo].[Tbl_Department] (
[Id] INT IDENTITY (1, 1) NOT NULL,
[Name] VARCHAR (50) NOT NULL,
PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO;

CREATE TABLE [dbo].[Tbl_Employee] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50) NOT NULL,
    [MiddleName]  VARCHAR (50) NULL,
    [LastName]    VARCHAR (50) NOT NULL,
    [DOB]         DATETIME     NULL,
    [Designation] VARCHAR (50) NOT NULL,
    [ReportingTo] VARCHAR (50) NULL,
    [Salary]      INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);GO;

CREATE PROCEDURE [dbo].GetEmployees 
 
AS
 SELECT * from Tbl_Employee
 
GO;

CREATE PROCEDURE [dbo].InsertOrUpdateEmployee
 @FirstName varchar(50),
 @MiddleName varchar(50),
 @LastName varchar(50),
 @DOB datetime,
 @Designation varchar(50),
 @ReportingTo varchar(50),
 @Salary int,
 @Id int = 0
as
BEGIN
 if (@Id = 0) 
  INSERT INTO [dbo].[Tbl_Employee] ([FirstName], [MiddleName], [LastName], [DOB], [Designation], [ReportingTo], [Salary]) 
  VALUES (@FirstName,@MiddleName, @LastName, @DOB, @Designation, @ReportingTo, @Salary)
 else
  update [Tbl_Employee] set [FirstName] = @FirstName, [MiddleName] = @MiddleName, [LastName]=@LastName, [DOB]=@DOB, [Designation]=@Designation, [ReportingTo] = @ReportingTo, [Salary]=@Salary
  where Id = @Id
 end
--END
GO;

CREATE PROCEDURE [dbo].GetEmployeeWithDepartment
 
AS
 SELECT * from Tbl_Employee
  
 SELECT * from Tbl_Department