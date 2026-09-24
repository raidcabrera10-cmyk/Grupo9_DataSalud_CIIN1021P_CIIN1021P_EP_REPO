INSERT INTO dbo.TB_Log_Procesamiento (Proceso, RegProcesados, RegInsertados, RegDuplicados, Estado, FechaHora)
VALUES 
('usp_CargarVigilanciaDengue', 102942, 84852, 18090, 'COMPLETADO', '2026-09-19 18:22:10.120'),
('usp_ValidarNulosLocalidad', 84852, 2561, 0, 'COMPLETADO', '2026-09-19 18:22:14.300');
GO

INSERT INTO dbo.TB_Log_Errores (Modulo, CodigoError, MensajeError, FechaHora)
VALUES 
('Ingesta_Dengue', 2627, 'Infracción de la restricción PRIMARY KEY o UNIQUE KEY. No se puede insertar una clave duplicada en el objeto TB_Vigilancia_Dengue.', '2026-09-19 18:22:15.450'),
('Ingesta_Dengue', 35100, 'El número de error 2627 en la instrucción THROW está fuera del intervalo válido. Especifique un número de error comprendido en el intervalo válido de 50000 a 2147483647.', '2026-09-20 00:46:51.800');
GO