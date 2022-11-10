--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer
SELECT *
FROM [Sales].[Customer]
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
SELECT *
FROM [Sales].[Store] s
ORDER BY s.[Name] ASC
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
SELECT TOP 10 * 
FROM [HumanResources].[Employee] e
WHERE e.BirthDate > '1989-09-28'

-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
SELECT e.[NationalIDNumber], e.[LoginID], e.[JobTitle], e.[LoginID]
FROM [HumanResources].[Employee] e
WHERE e.[LoginID] LIKE '%0'
ORDER BY e.[JobTitle] DESC
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
SELECT *
FROM [Person].[Person] p
WHERE p.[ModifiedDate]
LIKE '%2008%'
AND p.[MiddleName] IS NOT NULL
AND p.[Title] IS NULL
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
SELECT DISTINCT d.[Name]
FROM [HumanResources].[Department] d
FULL OUTER JOIN  [HumanResources].[EmployeeDepartmentHistory] ed
ON d.DepartmentID = ed.DepartmentID
WHERE ed.EndDate IS NULL
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
SELECT COUNT(s.TerritoryID) as Territory, SUM(s.[CommissionPct]) as CommissionPct
FROM [Sales].[SalesPerson] s
GROUP BY s.[TerritoryID]
HAVING SUM(s.[CommissionPct]) > 0
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
SELECT *
FROM [HumanResources].[Employee] as employee
WHERE employee.VacationHours in
(
	SELECT MAX(employee.VacationHours)
	FROM [HumanResources].[Employee]
)
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
SELECT *
FROM [HumanResources].[Employee] as e
WHERE e.[JobTitle] in
(
	SELECT e.[JobTitle]
	FROM [HumanResources].[Employee]
	WHERE e.[JobTitle] = 'Sales Representative'
	OR e.[JobTitle] = 'Network Administrator'
	OR e.[JobTitle] = 'Network Manager'
)
-------------------------------------------------------------

GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
SELECT *
FROM [HumanResources].[Employee] e
LEFT JOIN [Purchasing].[PurchaseOrderHeader] he
ON e.BusinessEntityID = he.EmployeeID
-------------------------------------------------------------


GO

