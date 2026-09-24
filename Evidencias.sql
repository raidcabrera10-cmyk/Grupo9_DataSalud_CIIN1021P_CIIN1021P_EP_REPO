SELECT ID, Modulo, CodigoError, MensajeError, FechaHora 
FROM dbo.TB_Log_Errores;
SELECT LogId, Proceso, RegProcesados, RegInsertados, RegDuplicados, Estado, FechaHora[cite: 13]
FROM TB_Log_Procesamiento;