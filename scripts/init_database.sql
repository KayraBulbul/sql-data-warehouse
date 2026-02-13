/*
============================================================================
Create Database and Schemas
============================================================================
Script:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas, alligning with the medallion architecture ('bronze', 'silver', 'gold').

WARNING:
Running this script will DROP the entire 'DataWarehouse' database if it exists.
ALL data in the database will be permanently DELETED.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO;
