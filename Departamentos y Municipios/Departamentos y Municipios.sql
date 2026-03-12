-- ============================================================
-- CAT-012 / CAT-013  Departamentos y Municipios de El Salvador
-- Fuente: Ministerio de Hacienda - Catalogos DTE
-- Compatible: SQL Server (T-SQL)
-- ============================================================

-- ============================================================
-- CAT-012 - Departamentos
-- ============================================================

IF OBJECT_ID('tempdb..#Departments') IS NOT NULL DROP TABLE #Departments;

CREATE TABLE #Departments (
    Code        NVARCHAR(2)   NOT NULL,
    Name        NVARCHAR(100) NOT NULL,
    IsActive    BIT           NOT NULL DEFAULT 1,
    CreatedAt   DATETIME2     NOT NULL DEFAULT '2025-01-01T00:00:00Z',
    UpdatedAt   DATETIME2     NOT NULL DEFAULT '2025-01-01T00:00:00Z'
);

INSERT INTO #Departments (Code, Name) VALUES
('00', N'Otro (Para extranjeros)'),
('01', N'Ahuachapán'),
('02', N'Santa Ana'),
('03', N'Sonsonate'),
('04', N'Chalatenango'),
('05', N'La Libertad'),
('06', N'San Salvador'),
('07', N'Cuscatlán'),
('08', N'La Paz'),
('09', N'Cabañas'),
('10', N'San Vicente'),
('11', N'Usulután'),
('12', N'San Miguel'),
('13', N'Morazán'),
('14', N'La Unión');

-- Para insertar en la tabla real (ajusta el nombre del esquema/tabla):
-- INSERT INTO dbo.Departments (Code, Name, IsActive, CreatedAt, UpdatedAt)
-- SELECT Code, Name, IsActive, CreatedAt, UpdatedAt FROM #Departments;

SELECT * FROM #Departments ORDER BY Code;


-- ============================================================
-- CAT-013 - Municipios
-- Nota: El codigo de municipio es un codigo de distrito
--       dentro de la region; no es unico a nivel nacional.
-- ============================================================

IF OBJECT_ID('tempdb..#Municipalities') IS NOT NULL DROP TABLE #Municipalities;

CREATE TABLE #Municipalities (
    Code             NVARCHAR(2)   NOT NULL,
    Name             NVARCHAR(100) NOT NULL,
    DepartmentCode   NVARCHAR(2)   NOT NULL,
    IsActive         BIT           NOT NULL DEFAULT 1,
    CreatedAt        DATETIME2     NOT NULL DEFAULT '2025-01-01T00:00:00Z',
    UpdatedAt        DATETIME2     NOT NULL DEFAULT '2025-01-01T00:00:00Z'
);

INSERT INTO #Municipalities (Code, Name, DepartmentCode) VALUES
-- Extranjeros
('0',  N'Otro (Para extranjeros)',  '00'),

-- Ahuachapán (01)
('13', N'AHUACHAPAN NORTE',  '01'),
('14', N'AHUACHAPAN CENTRO', '01'),
('15', N'AHUACHAPAN SUR',    '01'),

-- Santa Ana (02)
('16', N'SANTA ANA NORTE',  '02'),
('17', N'SANTA ANA CENTRO', '02'),
('18', N'SANTA ANA SUR',    '02'),
('19', N'SANTA ANA OESTE',  '02'),

-- Sonsonate (03)
('20', N'SONSONATE NORTE',  '03'),
('21', N'SONSONATE CENTRO', '03'),
('22', N'SONSONATE SUR',    '03'),
('23', N'SONSONATE OESTE',  '03'),

-- Chalatenango (04)
('24', N'CHALATENANGO NORTE',  '04'),
('25', N'CHALATENANGO CENTRO', '04'),
('26', N'CHALATENANGO SUR',    '04'),

-- La Libertad (05)
('27', N'LA LIBERTAD NORTE',  '05'),
('28', N'LA LIBERTAD CENTRO', '05'),
('29', N'LA LIBERTAD SUR',    '05'),
('30', N'LA LIBERTAD OESTE',  '05'),

-- San Salvador (06)
('31', N'SAN SALVADOR NORTE',  '06'),
('32', N'SAN SALVADOR CENTRO', '06'),
('33', N'SAN SALVADOR SUR',    '06'),
('34', N'SAN SALVADOR OESTE',  '06'),

-- Cuscatlán (07)
('35', N'CUSCATLAN NORTE',  '07'),
('36', N'CUSCATLAN CENTRO', '07'),
('37', N'CUSCATLAN SUR',    '07'),

-- La Paz (08)
('38', N'LA PAZ NORTE',  '08'),
('39', N'LA PAZ CENTRO', '08'),
('40', N'LA PAZ ESTE',   '08'),

-- Cabañas (09)
('11', N'CABANAS ESTE', '09'),

-- San Vicente (10)
('41', N'SAN VICENTE NORTE', '10'),
('42', N'SAN VICENTE SUR',   '10'),

-- Usulután (11)
('43', N'USULUTAN NORTE', '11'),
('44', N'USULUTAN ESTE',  '11'),
('45', N'USULUTAN OESTE', '11'),

-- San Miguel (12)
('46', N'SAN MIGUEL NORTE',  '12'),
('47', N'SAN MIGUEL CENTRO', '12'),
('48', N'SAN MIGUEL OESTE',  '12'),

-- Morazán (13)
('49', N'MORAZAN NORTE', '13'),
('50', N'MORAZAN SUR',   '13'),

-- La Unión (14)
('51', N'LA UNION NORTE', '14'),
('52', N'LA UNION SUR',   '14');

-- Para insertar en la tabla real (ajusta el nombre del esquema/tabla):
-- INSERT INTO dbo.Municipalities (Code, Name, DepartmentCode, IsActive, CreatedAt, UpdatedAt)
-- SELECT Code, Name, DepartmentCode, IsActive, CreatedAt, UpdatedAt FROM #Municipalities;

SELECT
    m.Code             AS MunicipioCode,
    m.Name             AS MunicipioNombre,
    d.Code             AS DepartamentoCode,
    d.Name             AS DepartamentoNombre
FROM #Municipalities m
INNER JOIN #Departments d ON d.Code = m.DepartmentCode
ORDER BY d.Code, m.Code;
