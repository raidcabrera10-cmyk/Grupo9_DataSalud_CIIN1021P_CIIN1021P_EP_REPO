IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DataSalud')
BEGIN
    CREATE DATABASE DataSalud;
END;
GO

USE DataSalud;
GO