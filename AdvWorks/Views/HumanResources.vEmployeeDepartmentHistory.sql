SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [HumanResources].[vEmployeeDepartmentHistory] 
AS 
SELECT 
    e.[EmployeeID] 
    ,c.[Title] 
    ,c.[FirstName] 
    ,c.[MiddleName] 
    ,c.[LastName] 
    ,c.[Suffix] 
    ,s.[Name] AS [Shift]
    ,d.[Name] AS [Department] 
    ,d.[GroupName] 
    ,edh.[StartDate] 
    ,edh.[EndDate]
FROM [HumanResources].[Employee] e
    INNER JOIN [Person].[Contact] c 
    ON c.[ContactID] = e.[ContactID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[EmployeeID] = edh.[EmployeeID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 
    INNER JOIN [HumanResources].[Shift] s
    ON s.[ShiftID] = edh.[ShiftID];
GO
EXEC sp_addextendedproperty N'MS_Description', N'Returns employee name and current and previous departments.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployeeDepartmentHistory', NULL, NULL
GO
