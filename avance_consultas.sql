
-- PROYECTO: DataSalud Perú
-- Curso: Base de Datos Avanzadas y Big Data
-- Avance: Exploración de la base de datos

USE Base_De_Datos_BD;
GO

-- Consulta 1: Mostrar las tablas de la base de datos
SELECT
    TABLE_NAME AS NombreTabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- Consulta 2: Contar registros de cada tabla
SELECT
    t.name AS NombreTabla,
    SUM(p.rows) AS CantidadRegistros
FROM sys.tables t
INNER JOIN sys.partitions p
    ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)
GROUP BY t.name
ORDER BY CantidadRegistros DESC;
GO
