/****** Object:  Database BrazilianEcommerceDW    Script Date: 5/28/2025 6:42:18 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE BrazilianEcommerceDW
GO
CREATE DATABASE BrazilianEcommerceDW
GO
ALTER DATABASE BrazilianEcommerceDW
SET RECOVERY SIMPLE
GO
*/
USE BrazilianEcommerceDW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimAudit */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimAudit') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimAudit 
;

/* Create table dbo.DimAudit */
CREATE TABLE dbo.DimAudit (
   [AuditKey]  int IDENTITY  NOT NULL
,  [ParentAuditKey]  int   NOT NULL
,  [TableName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgGUID]  uniqueidentifier   NULL
,  [PkgVersionGUID]  uniqueidentifier   NULL
,  [PkgVersionMajor]  smallint   NULL
,  [PkgVersionMinor]  smallint   NULL
,  [ExecStartDT]  datetime  DEFAULT getdate() NOT NULL
,  [ExecStopDT]  datetime   NULL
,  [ExecutionInstanceGUID]  uniqueidentifier   NULL
,  [ExtractRowCnt]  bigint   NULL
,  [InsertRowCnt]  bigint   NULL
,  [UpdateRowCnt]  bigint   NULL
,  [ErrorRowCnt]  bigint   NULL
,  [TableInitialRowCnt]  bigint   NULL
,  [TableFinalRowCnt]  bigint   NULL
,  [TableMaxSurrogateKey]  bigint   NULL
,  [SuccessfulProcessingInd]  nchar(1)  DEFAULT 'N' NOT NULL
, CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
( [AuditKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Audit', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Audit', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Audit dimension tags each data row with the the process that added or updated it.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
;

SET IDENTITY_INSERT dbo.DimAudit ON
;
INSERT INTO dbo.DimAudit (AuditKey, ParentAuditKey, TableName, PkgName, PkgGUID, PkgVersionGUID, PkgVersionMajor, PkgVersionMinor, ExecStartDT, ExecStopDT, ExecutionInstanceGUID, ExtractRowCnt, InsertRowCnt, UpdateRowCnt, ErrorRowCnt, TableInitialRowCnt, TableFinalRowCnt, TableMaxSurrogateKey, SuccessfulProcessingInd)
VALUES (-1, -1, 'Audit', 'None: Dummy row', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y')
;
SET IDENTITY_INSERT dbo.DimAudit OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ParentAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMajor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMinor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStartDT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStopDT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecutionInstanceGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExtractRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ErrorRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableInitialRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableFinalRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableMaxSurrogateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SuccessfulProcessingInd', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Foreign key to self, to identify calling package execution', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the main table loaded by this package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the SSIS package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package version', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Major version number for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Minor version number for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package started executing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package finished executing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the execution of the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows extracted from the source(s)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows inserted in the destination table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows updated in the destination table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of error rows', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table before we begin', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table after package ends', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum surrogate key value in table (if we''re maintaining ourselves)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Did the package finish executing successfully?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
;





/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct 
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [product_key]  int IDENTITY  NOT NULL
,  [product_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [price]  float  DEFAULT 0 NULL
,  [product_category_name]  nvarchar(50)  DEFAULT 'Unknown' NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'Unknown' NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [product_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Product Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
;

SET IDENTITY_INSERT dbo.DimProduct ON
;
INSERT INTO dbo.DimProduct (product_key, product_id, price, product_category_name, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, 'Unknown', 0, 'Unknown', 1, '1/1/1901', '1/1/1901', 'Unknown', -1, -1)
;
SET IDENTITY_INSERT dbo.DimProduct OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_category_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'unitprice of product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of product''s category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'p1123h213h123k', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'111111', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'laptop MSI', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/1901', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/1901', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
;





/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [customer_key]  int IDENTITY  NOT NULL
,  [customer_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [customer_unique_id]  nvarchar(50)  DEFAULT 'Unknown' NULL
,  [customer_city]  nvarchar(50)  DEFAULT 'Unknown' NULL
,  [customer_state]  nvarchar(50)  DEFAULT 'Unknown' NULL
,  [customer_zip_code_prefix]  int  DEFAULT 1 NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'Unknown' NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [customer_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCustomer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Customer Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

SET IDENTITY_INSERT dbo.DimCustomer ON
;
INSERT INTO dbo.DimCustomer (customer_key, customer_id, customer_unique_id, customer_city, customer_state, customer_zip_code_prefix, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, 'Unknown', 'Unknown', 'Unknown', 'Unknown', -1, 1, '1/1/1901', '1/1/1901', 'Unknown', -1, -1)
;
SET IDENTITY_INSERT dbo.DimCustomer OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_unique_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_unique_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_state', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_zip_code_prefix', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_zip_code_prefix'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_unique_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State''s code of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_zip_code_prefix'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'21jjhkj123kjh', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2h3jhkhjk123hk', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_unique_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Cuiaba', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'MT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'83750', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_zip_code_prefix'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/1901', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/1901', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_unique_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_zip_code_prefix'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_unique_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_city'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_state'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'customer_zip_code_prefix'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
;





/* Drop table dbo.DimOrder */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimOrder') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimOrder 
;

/* Create table dbo.DimOrder */
CREATE TABLE dbo.DimOrder (
   [order_key]  int IDENTITY  NOT NULL
,  [order_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [customer_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [order_status]  nvarchar(50)  DEFAULT 'Unknown' NULL
,  [order_purchase_timestamp]  datetime  DEFAULT '1/1/1901' NULL
,  [order_approved_at]  datetime  DEFAULT '1/1/1901' NULL
,  [order_delivered_carrier_date]  datetime  DEFAULT '1/1/1901' NULL
,  [order_delivered_customer_date]  datetime  DEFAULT '1/1/1901' NULL
,  [order_estimated_delivery_date]  datetime  DEFAULT '1/1/1901' NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'Unknown' NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimOrder] PRIMARY KEY CLUSTERED 
( [order_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimOrder', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Order Dimesion', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrder
;

SET IDENTITY_INSERT dbo.DimOrder ON
;
INSERT INTO dbo.DimOrder (order_key, order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, 'Unknown', 'Unknown', 'Unknown', '1/1/1901', '1/1/1901', '1/1/1901', '1/1/1901', '1/1/1901', 1, '1/1/1901', '1/1/1901', 'Unknown', -1, -1)
;
SET IDENTITY_INSERT dbo.DimOrder OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_status'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_purchase_timestamp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_approved_at', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_delivered_carrier_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_delivered_customer_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_estimated_delivery_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'status of order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_status'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The time when the customer places the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The time when the order is approved', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The time when the order is handed over to the carrier', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The time when the order is delivered to the customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The estimated delivery date for the customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'213asda1es', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'21hksajd234', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Delivered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_status'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/2/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/3/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/4/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/5/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_status'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_status'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimCustomer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_purchase_timestamp'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_approved_at'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_carrier_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_delivered_customer_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrder', @level2type=N'COLUMN', @level2name=N'order_estimated_delivery_date'; 
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [date_key]  int   NOT NULL
,  [full_date]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [year]  smallint  DEFAULT 0 NULL
,  [month]  tinyint  DEFAULT 0 NULL
,  [quarter]  tinyint  DEFAULT 0 NULL
,  [day_of_week]  tinyint  DEFAULT 0 NULL
,  [month_name]  nvarchar(20)  DEFAULT 'Unknown' NULL
,  [day_of_month]  tinyint  DEFAULT 0 NULL
,  [is_weekend]  char(10)  DEFAULT '0' NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '1/1/1901' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'Unknown' NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [date_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date Dimesion', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

INSERT INTO dbo.DimDate (date_key, full_date, year, month, quarter, day_of_week, month_name, day_of_month, is_weekend, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, '1/1/1901', 0, 0, 0, 0, 'Unknown', 0, '0', 1, '1/1/1901', '1/1/1901', 'Unknown', -1, -1)
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'full_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'full_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'day_of_week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_week'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'month_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'day_of_month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'is_weekend', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'is_weekend'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'full of date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'full_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'year name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'month in year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'quarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'day of week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_week'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'month name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'day of month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'flag identify weekend', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'is_weekend'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'full_date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'5', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'quarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_week'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'May', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'13', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_month'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'is_weekend'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2025', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'full_date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_week'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'is_weekend'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'full_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_week'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'month_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'day_of_month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'is_weekend'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
;





/* Drop table dbo.FactSales */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactSales') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactSales 
;

/* Create table dbo.FactSales */
CREATE TABLE dbo.FactSales (
   [order_key]  int  DEFAULT -1 NOT NULL
,  [customer_key]  int  DEFAULT -1 NOT NULL
,  [order_date_key]  int  DEFAULT -1 NOT NULL
,  [order_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [total_price]  float  DEFAULT 0 NULL
,  [total_freight_value]  float  DEFAULT 0 NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.FactSales] PRIMARY KEY NONCLUSTERED 
( [order_key], [order_id] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSales
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactSales', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSales
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Sale fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSales
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'total_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'total_freight_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimCustomer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'price per product unit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Shipping cost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'811$', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'811$', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'order_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'freight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_price'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSales', @level2type=N'COLUMN', @level2name=N'total_freight_value'; 
;





/* Drop table dbo.FactOrderDelivery */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactOrderDelivery') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactOrderDelivery 
;

/* Create table dbo.FactOrderDelivery */
CREATE TABLE dbo.FactOrderDelivery (
   [order_key]  int  DEFAULT -1 NOT NULL
,  [order_date_key]  int  DEFAULT -1 NOT NULL
,  [delivered_date_key]  int  DEFAULT -1 NOT NULL
,  [order_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [delivery_time]  int  DEFAULT 0 NULL
,  [estimate_delivery_time]  int  DEFAULT 0 NULL
,  [is_delay]  bit  DEFAULT 0 NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.FactOrderDelivery] PRIMARY KEY NONCLUSTERED 
( [order_key], [order_id] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderDelivery
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactOrderDelivery', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderDelivery
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Order delivery fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrderDelivery
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'delivery_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'order_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'delivery_time', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'estimate_delivery_time', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'estimate_delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'is_delay', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'is_delay'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery time actual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery time estimate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'estimate_delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery is delay or not', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'is_delay'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivered_date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'estimate_delivery_time'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'is_delay'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimOrder', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'order_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrderDelivery', @level2type=N'COLUMN', @level2name=N'order_id'; 
;





/* Drop table dbo.FactProductPrice */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactProductPrice') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactProductPrice 
;

/* Create table dbo.FactProductPrice */
CREATE TABLE dbo.FactProductPrice (
   [product_key]  int  DEFAULT -1 NOT NULL
,  [date_key]  int  DEFAULT -1 NOT NULL
,  [product_id]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [price]  float  DEFAULT -1 NOT NULL
,  [product_category_name]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.FactProductPrice] PRIMARY KEY NONCLUSTERED 
( [product_key], [date_key], [product_id], [price] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactProductPrice
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactProductPrice', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactProductPrice
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Product price fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactProductPrice
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'product_category_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'FK to DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'37653', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Surrogate key peipeline lookup for dimension key lookup using business key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_category_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'price'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactProductPrice', @level2type=N'COLUMN', @level2name=N'product_category_name'; 
;
ALTER TABLE dbo.DimAudit ADD CONSTRAINT
   FK_dbo_DimAudit_ParentAuditKey FOREIGN KEY
   (
   ParentAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimProduct ADD CONSTRAINT
   FK_dbo_DimProduct_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimProduct ADD CONSTRAINT
   FK_dbo_DimProduct_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimCustomer ADD CONSTRAINT
   FK_dbo_DimCustomer_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimCustomer ADD CONSTRAINT
   FK_dbo_DimCustomer_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimOrder ADD CONSTRAINT
   FK_dbo_DimOrder_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimOrder ADD CONSTRAINT
   FK_dbo_DimOrder_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimDate ADD CONSTRAINT
   FK_dbo_DimDate_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimDate ADD CONSTRAINT
   FK_dbo_DimDate_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSales ADD CONSTRAINT
   FK_dbo_FactSales_order_key FOREIGN KEY
   (
   order_key
   ) REFERENCES DimOrder
   ( order_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSales ADD CONSTRAINT
   FK_dbo_FactSales_customer_key FOREIGN KEY
   (
   customer_key
   ) REFERENCES DimCustomer
   ( customer_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSales ADD CONSTRAINT
   FK_dbo_FactSales_order_date_key FOREIGN KEY
   (
   order_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSales ADD CONSTRAINT
   FK_dbo_FactSales_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSales ADD CONSTRAINT
   FK_dbo_FactSales_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderDelivery ADD CONSTRAINT
   FK_dbo_FactOrderDelivery_order_key FOREIGN KEY
   (
   order_key
   ) REFERENCES DimOrder
   ( order_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderDelivery ADD CONSTRAINT
   FK_dbo_FactOrderDelivery_order_date_key FOREIGN KEY
   (
   order_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderDelivery ADD CONSTRAINT
   FK_dbo_FactOrderDelivery_delivered_date_key FOREIGN KEY
   (
   delivered_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderDelivery ADD CONSTRAINT
   FK_dbo_FactOrderDelivery_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrderDelivery ADD CONSTRAINT
   FK_dbo_FactOrderDelivery_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactProductPrice ADD CONSTRAINT
   FK_dbo_FactProductPrice_product_key FOREIGN KEY
   (
   product_key
   ) REFERENCES DimProduct
   ( product_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactProductPrice ADD CONSTRAINT
   FK_dbo_FactProductPrice_date_key FOREIGN KEY
   (
   date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactProductPrice ADD CONSTRAINT
   FK_dbo_FactProductPrice_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactProductPrice ADD CONSTRAINT
   FK_dbo_FactProductPrice_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
