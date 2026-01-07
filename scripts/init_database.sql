/* 
============================================================================
Create Database and Schemas
============================================================================
Script Purpose
  This script creates a new database named 'DataWarehouse' after checking if it already esists. 
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'. 

WARNING
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All dara in the database will be permanently deleted. Proceed with caution
	and ensure you have proper backups before running this script. 

*/
use master;
GO

-- Drop and recreate the entire Datawarehouse database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
	DROP DATABASE DataWarehouse;
END
GO

-- Create the 'DataWarehouse' Database
Create database DataWarehouse;
GO 


-- Use DataWarehouse
use DataWarehouse
GO

-- SCHEMAS
CREATE SCHEMA bronze
GO
CREATE SCHEMA silver
GO
CREATE SCHEMA gold
GO
