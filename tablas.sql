IF OBJECT_ID('dbo.STG_Dengue', 'U') IS NOT NULL DROP TABLE dbo.STG_Dengue;
CREATE TABLE dbo.STG_Dengue (
    ano INT,
    semana INT,
    ubigeo VARCHAR(10),
    departamento VARCHAR(100),
    provincia VARCHAR(100),
    distrito VARCHAR(100),
    enfermedad VARCHAR(100),
    tipo_dx VARCHAR(10),
    edad VARCHAR(10),
    tipo_edad VARCHAR(10),
    sexo VARCHAR(5),
    localcod VARCHAR(50) NULL,
    localidad VARCHAR(150) NULL
);
GO

IF OBJECT_ID('dbo.TB_Vigilancia_Dengue', 'U') IS NOT NULL DROP TABLE dbo.TB_Vigilancia_Dengue;
CREATE TABLE dbo.TB_Vigilancia_Dengue (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ano INT,
    semana INT,
    ubigeo VARCHAR(10),
    departamento VARCHAR(100),
    provincia VARCHAR(100),
    distrito VARCHAR(100),
    enfermedad VARCHAR(100),
    tipo_dx VARCHAR(10),
    edad VARCHAR(10),
    tipo_edad VARCHAR(10),
    sexo VARCHAR(5),
    localcod VARCHAR(50) DEFAULT 'DESCONOCIDO',
    localidad VARCHAR(150) DEFAULT 'DESCONOCIDO'
);
GO

IF OBJECT_ID('dbo.TB_Log_Procesamiento', 'U') IS NOT NULL DROP TABLE dbo.TB_Log_Procesamiento;
CREATE TABLE dbo.TB_Log_Procesamiento (
    LogID INT IDENTITY(1043,1) PRIMARY KEY,
    Proceso VARCHAR(100),
    RegProcesados INT,
    RegInsertados INT,
    RegDuplicados INT,
    Estado VARCHAR(50),
    FechaHora DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('dbo.TB_Log_Errores', 'U') IS NOT NULL DROP TABLE dbo.TB_Log_Errores;
CREATE TABLE dbo.TB_Log_Errores (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Modulo VARCHAR(100),
    CodigoError INT,
    MensajeError VARCHAR(MAX),
    FechaHora DATETIME DEFAULT GETDATE()
);
GO