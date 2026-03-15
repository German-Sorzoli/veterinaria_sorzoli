USE veterinaria_sorzoli;

-- ///////////// CREACION DE VISTAS /////////////

-- SELECT * FROM vista_clientes_mascotas;

-- Vista para el listado de mascotas y su respectivo dueño
CREATE OR REPLACE VIEW vista_clientes_mascotas AS
SELECT
    m.nombre AS Nombre_Mascota,
    m.especie AS Especie,
    m.raza AS Raza,
    m.sexo AS Sexo,
    c.apellido AS Apellido_Cliente,
    c.nombre AS Nombre_Cliente
FROM mascotas AS m
	JOIN clientes AS c ON c.id_cliente = m.id_cliente
ORDER BY m.nombre, c.apellido;

-- Vista para el listado de turnos y los detalles de mascotas y veterinarios
CREATE OR REPLACE VIEW vista_turnos_detalle AS
SELECT
    t.fecha AS Fecha,
    t.hora AS Hora,
    m.nombre AS Mascota,
    v.apellido AS Apellido_Veterinario,
    v.nombre AS Nombre_Veterinario,
    v.especialidad AS Especialidad
FROM turnos AS t
	JOIN mascotas AS m ON t.id_mascota = m.id_mascota
	JOIN veterinarios AS v ON t.id_veterinario = v.id_veterinario
ORDER BY t.fecha DESC, t.hora DESC;

-- Vista para el listado de pagos realizados por clientes
CREATE OR REPLACE VIEW vista_pagos_clientes AS
SELECT
    p.id_pago AS ID_Pago,
    p.fecha_pago AS Fecha_Pago,
    p.monto AS Monto,
    c.apellido AS Apellido_Cliente,
    c.nombre AS Nombre_Cliente,
    co.diagnostico AS Concepto,
    p.medio_pago AS Medio_Pago
FROM pagos AS p
	JOIN clientes AS c 	ON p.id_cliente = c.id_cliente
	JOIN consultas AS co 	ON p.id_consulta = co.id_consulta
	WHERE p.estado_pago = 'Pagado'
ORDER BY p.fecha_pago DESC;

-- Vista para el historial completo de cada mascota
CREATE OR REPLACE VIEW vista_historial_mascota AS
SELECT
    m.id_mascota AS ID_Mascota,
    m.nombre AS Nombre_Mascota,
    m.especie AS Especie,
    m.raza AS Raza,
    c.apellido AS Apellido_Dueno,
    c.nombre AS Nombre_Dueno,
    co.fecha_consulta AS Fecha_Consulta,
    co.diagnostico AS Diagnostico,
    co.observaciones AS Observaciones,
    v.apellido AS Apellido_Veterinario,
    v.nombre AS Nombre_Veterinario,
    v.especialidad AS Especialidad
FROM historial_medico AS h
	JOIN mascotas AS m ON h.id_mascota = m.id_mascota
	JOIN consultas AS co ON h.id_consulta = co.id_consulta
	JOIN turnos AS t ON co.id_turno = t.id_turno
	JOIN veterinarios AS v ON t.id_veterinario = v.id_veterinario
	JOIN clientes AS c ON m.id_cliente = c.id_cliente
ORDER BY m.nombre, co.fecha_consulta DESC;


-- ///////////// CREACION DE FUNCIONES /////////////

-- Declaro una funcion que me permita calcular la edad de la mascota en años

DELIMITER //

DROP FUNCTION IF EXISTS veterinaria_sorzoli.fn_calculo_edad_mascota //

CREATE FUNCTION veterinaria_sorzoli.fn_calculo_edad_mascota (_fecha_nac DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE _edad_mascota INT;
    -- TIMESTAMPDIFF es una funcion que me permite restar dos fechas y expresarlas en años (en este caso)
    -- Resto la fecha de nacimiento por la fecha actual y devuelvo ese resultado
	SET _edad_mascota = TIMESTAMPDIFF(YEAR, _fecha_nac, CURDATE());
	RETURN _edad_mascota;
END//

DELIMITER ;

/*
-- EJEMPLO DE LA FUNCION
SELECT 
	m.nombre,
    m.especie,
    m.raza,
    m.fecha_nacimiento,
    veterinaria_sorzoli.fn_calculo_edad_mascota(m.fecha_nacimiento) AS años
FROM mascotas AS m
*/

DELIMITER //

DROP FUNCTION IF EXISTS veterinaria_sorzoli.fn_total_pagos_cliente //

CREATE FUNCTION veterinaria_sorzoli.fn_total_pagos_cliente (_id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE _total_pagos DECIMAL(10,2);
    -- En este caso el resultado de la consulta sera una suma de montos, el resultado se muestra en un solo registro
    SELECT SUM(monto) INTO _total_pagos FROM veterinaria_sorzoli.pagos WHERE veterinaria_sorzoli.pagos.id_cliente = _id_cliente AND estado_pago='Pagado';
    -- La funcion interna IFNULL muestra el valor deseado, y si el valor devuelve NULL, lo reemplaza por un valor por defecto= 0
	RETURN IFNULL(_total_pagos,0);
END //

DELIMITER ;

/*
-- EJEMPLO DE LA FUNCION
SELECT DISTINCT
	cl.nombre AS Nombre,
    cl.apellido AS Apellido,
	veterinaria_sorzoli.fn_total_pagos_cliente(cl.id_cliente) AS Total_De_Pagos
FROM veterinaria_sorzoli.clientes AS cl
*/

-- Funcion que devuelve la cantidad de consultas de una mascota
-- Pendiente

DELIMITER //

DROP FUNCTION IF EXISTS veterinaria_sorzoli.fn_cantidad_consultas_mascota //

CREATE FUNCTION veterinaria_sorzoli.fn_cantidad_consultas_mascota (_id_mascota INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE _cantidad_consultas INT;
    -- Usando la funcion interna COUNT cuento la cantidad de filas que cumplen la condicion de ser el mismo ID, o sea, la cantidad de consultas en el historial
	SELECT COUNT(*) INTO _cantidad_consultas FROM veterinaria_sorzoli.historial_medico AS hm WHERE hm.id_mascota = _id_mascota;
	RETURN _cantidad_consultas;
END//

DELIMITER ;

/*
SELECT DISTINCT
    m.nombre,
    m.especie,
    m.raza,
    fn_cantidad_consultas_mascota(hm.id_mascota) AS CantidadDeConsultas
FROM veterinaria_sorzoli.historial_medico AS hm
JOIN veterinaria_sorzoli.mascotas AS m ON (hm.id_mascota = m.id_mascota)
*/

-- ///////////// CREACION DE STORED PROCEDURES /////////////

-- Declaro un procedimiento para ver las mascotas de un cliente en orden alfabetico

DELIMITER //
 
 DROP PROCEDURE sp_mascotas_de_cliente //
 
CREATE PROCEDURE sp_mascotas_de_cliente(IN _cliente INT)
BEGIN
SELECT
	m.nombre,
    m.especie,
    m.raza,
    m.sexo
FROM mascotas AS m WHERE m.id_cliente = _cliente ORDER BY m.nombre;
END//

DELIMITER ;
/*
CALL sp_mascotas_de_cliente(1);
*/

-- Declaro un procedimiento para registrar un pago

DELIMITER //

DROP PROCEDURE IF EXISTS sp_registrar_pago //

CREATE PROCEDURE sp_registrar_pago (
IN _fecha DATE,
IN _monto DECIMAL (10,2),
IN _medio VARCHAR(30) ,
IN _estado VARCHAR(30),
IN _id_consulta INT,
IN _id_cliente INT
)
BEGIN
	IF _monto> 0
    THEN
		INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente)
		VALUES (_fecha, _monto, _medio, _estado, _id_consulta, _id_cliente);
	ELSE 
		SELECT 'Error: el monto del pago debe ser mayor que 0' AS mensaje;
	END IF;
END//

DELIMITER ;

/*
CALL sp_registrar_pago(CURDATE(),8000,'Efectivo','Pagado',3,2);
Cambiar ejemplo
*/

-- Procedimiento para registrar un nuevo turno

DELIMITER //

DROP PROCEDURE IF EXISTS sp_registrar_turno //

CREATE PROCEDURE sp_registrar_turno (
IN _fecha DATE,
IN _hora TIME,
IN _estado VARCHAR(30),
IN _id_mascota INT,
IN _id_veterinario INT
)
BEGIN
	INSERT INTO turnos (fecha, hora, estado, id_mascota, id_veterinario)
    VALUES (_fecha, _hora, _estado, _id_mascota, _id_veterinario);
END//

DELIMITER ;

