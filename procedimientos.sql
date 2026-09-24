CREATE OR ALTER PROCEDURE dbo.usp_CargarVigilanciaEpidemiologica
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    SAVE TRANSACTION PuntoLote;

    BEGIN TRY
        INSERT INTO dbo.TB_Vigilancia_Dengue (
            ano, semana, ubigeo, departamento, provincia, distrito, 
            enfermedad, tipo_dx, edad, tipo_edad, sexo
        )
        SELECT DISTINCT 
            ano, semana, ubigeo, departamento, provincia, distrito, 
            enfermedad, tipo_dx, edad, tipo_edad, sexo
        FROM dbo.STG_Dengue s
        WHERE NOT EXISTS (
            SELECT 1 FROM dbo.TB_Vigilancia_Dengue d
            WHERE d.ano = s.ano 
              AND d.semana = s.semana 
              AND d.ubigeo = s.ubigeo 
              AND d.edad = s.edad 
              AND d.sexo = s.sexo
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION PuntoLote;
        INSERT INTO dbo.TB_Log_Errores (Modulo, CodigoError, MensajeError, FechaHora)
        VALUES ('Ingesta_Dengue', ERROR_NUMBER(), ERROR_MESSAGE(), GETDATE());
        COMMIT TRANSACTION;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_ValidarNulosLocalidad
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.TB_Vigilancia_Dengue
    SET localcod = ISNULL(localcod, 'DESCONOCIDO'),
        localidad = ISNULL(localidad, 'DESCONOCIDO')
    WHERE localcod IS NULL OR localidad IS NULL;
END;
GO