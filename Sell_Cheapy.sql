/****** Query for Compiling Customer Details ******/
SELECT [Customer].[CustomerID]
      ,[Customer].[PersonID]
	  ,[Person].[PersonType]
      ,[Person].[FirstName]
      ,[Person].[MiddleName]
      ,[Person].[LastName]
      ,[Person].[EmailPromotion]
	  ,[Address].[AddressID]
      ,[Address].[AddressLine1]
      ,[Address].[City]
      ,[Address].[StateProvinceID]
      ,[Address].[PostalCode]
	  ,[StateProvince].[StateProvinceCode]
      ,[StateProvince].[CountryRegionCode]
      ,[StateProvince].[IsOnlyStateProvinceFlag]
      ,[StateProvince].[Name] AS StateName
      ,[Customer].[StoreID]
      ,[Customer].[TerritoryID]
      ,[Customer].[AccountNumber]
  FROM [AdventureWorks2019].[Sales].[Customer]
  INNER JOIN [AdventureWorks2019].[Person].[Person]
	ON [Customer].PersonID = [Person].BusinessEntityID
  LEFT JOIN [AdventureWorks2019].[Person].[Address]
	ON [Person].BusinessEntityID = [Address].AddressID
  LEFT JOIN [AdventureWorks2019].[Person].[StateProvince]
	ON [Address].StateProvinceID = [StateProvince].StateProvinceID;
  

/****** Query for compiling Sales Details ******/
SELECT [SalesOrderDetail].[SalesOrderID]
      ,[SalesOrderDetail].[SalesOrderDetailID]
      ,[SalesOrderDetail].[CarrierTrackingNumber]
      ,[SalesOrderDetail].[OrderQty]
      ,[SalesOrderDetail].[ProductID]
	  ,[ProductCategory].[Name] AS ProductCategory
	  ,[ProductSubcategory].[Name] AS ProductName
      ,[SpecialOffer].[Type] AS SpecialOfferType
      ,[SalesOrderDetail].[UnitPrice]
      ,[SalesOrderDetail].[UnitPriceDiscount]
      ,[SalesOrderDetail].[LineTotal]
FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]
INNER JOIN [AdventureWorks2019].[Production].[Product]
	ON [SalesOrderDetail].[ProductID] = [Product].[ProductID]
LEFT JOIN [AdventureWorks2019].[Production].[ProductSubcategory]
	ON [Product].[ProductSubcategoryID] = [ProductSubcategory].[ProductSubcategoryID]
LEFT JOIN [AdventureWorks2019].[Production].[ProductCategory]
	ON [ProductSubcategory].[ProductCategoryID] = [ProductCategory].[ProductCategoryID]
INNER JOIN [AdventureWorks2019].[Sales].[SpecialOffer]
	ON [SalesOrderDetail].[SpecialOfferID] = [SpecialOffer].[SpecialOfferID];


/****** Query for compiling Order & Shipping Details ******/
SELECT [SalesOrderHeader].[SalesOrderID]
      ,[SalesOrderHeader].[RevisionNumber]
      ,[SalesOrderHeader].[OrderDate]
      ,[SalesOrderHeader].[DueDate]
      ,[SalesOrderHeader].[ShipDate]
      ,[SalesOrderHeader].[Status]
      ,[SalesOrderHeader].[OnlineOrderFlag]
      ,[SalesOrderHeader].[SalesOrderNumber]
      ,[SalesOrderHeader].[PurchaseOrderNumber]
      ,[SalesOrderHeader].[AccountNumber]
      ,[SalesOrderHeader].[CustomerID]
      ,[SalesOrderHeader].[SalesPersonID]
      ,[SalesOrderHeader].[TerritoryID]
      ,[SalesOrderHeader].[BillToAddressID]
      ,[SalesOrderHeader].[ShipToAddressID]
      ,[ShipMethod].[Name] AS ShippingMethod
      ,[SalesOrderHeader].[CreditCardID]
      ,[SalesOrderHeader].[CreditCardApprovalCode]
      ,[SalesOrderHeader].[CurrencyRateID]
      ,[SalesOrderHeader].[SubTotal]
      ,[SalesOrderHeader].[TaxAmt]
      ,[SalesOrderHeader].[Freight]
      ,[SalesOrderHeader].[TotalDue]
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
INNER JOIN [AdventureWorks2019].[Purchasing].[ShipMethod]
	ON [SalesOrderHeader].[ShipMethodID] = [ShipMethod].[ShipMethodID]
