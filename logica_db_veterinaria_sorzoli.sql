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

-- SELECT * FROM vista_turnos_detalle;

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

-- SELECT * FROM vista_pagos_clientes;

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
    FROM
        historial_medico AS h
            JOIN
        mascotas AS m ON h.id_mascota = m.id_mascota
            JOIN
        consultas AS co ON h.id_consulta = co.id_consulta
            JOIN
        turnos AS t ON co.id_turno = t.id_turno
            JOIN
        veterinarios AS v ON t.id_veterinario = v.id_veterinario
            JOIN
        clientes AS c ON m.id_cliente = c.id_cliente
    ORDER BY m.nombre , co.fecha_consulta DESC;

-- SELECT * FROM vista_historial_mascota;

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

/*
-- EJEMPLO DE LA FUNCION
SELECT 
	m.nombre,
    m.especie,
    m.raza,
    m.fecha_nacimiento,
    veterinaria_sorzoli.fn_calculo_edad_mascota(m.fecha_nacimiento) AS años
FROM mascotas AS m;
*/

-- Declaro una funcion que calcule el total de pagos de un cliente

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

/*
-- EJEMPLO DE LA FUNCION
SELECT DISTINCT
	cl.nombre AS Nombre,
    cl.apellido AS Apellido,
	veterinaria_sorzoli.fn_total_pagos_cliente(cl.id_cliente) AS Total_De_Pagos
FROM veterinaria_sorzoli.clientes AS Cl;
*/

-- Funcion que devuelve la cantidad de consultas de una mascota
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

/*
SELECT DISTINCT
    m.nombre,
    m.especie,
    m.raza,
    veterinaria_sorzoli.fn_cantidad_consultas_mascota(hm.id_mascota) AS CantidadDeConsultas
FROM veterinaria_sorzoli.historial_medico AS hm
JOIN veterinaria_sorzoli.mascotas AS m ON (hm.id_mascota = m.id_mascota);
*/

-- ///////////// CREACION DE STORED PROCEDURES /////////////

-- Declaro un procedimiento para ver las mascotas de un cliente en orden alfabetico
DROP PROCEDURE IF EXISTS sp_mascotas_de_cliente //
 
CREATE PROCEDURE sp_mascotas_de_cliente(IN _cliente INT)
BEGIN
	-- Verifico que el Cliente existe
	IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = _cliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el cliente no existe';
    END IF;
SELECT
	m.nombre,
    m.especie,
    m.raza,
    m.sexo
FROM mascotas AS m WHERE m.id_cliente = _cliente ORDER BY m.nombre;
END//

/*
CALL sp_mascotas_de_cliente(1);
*/

-- Declaro un procedimiento para registrar un pago
DROP PROCEDURE IF EXISTS sp_registrar_pago //

CREATE PROCEDURE sp_registrar_pago (
	IN _fecha DATE,
	IN _monto DECIMAL (10,2),
	IN _medio VARCHAR(30),
	IN _estado VARCHAR(30),
	IN _id_consulta INT,
	IN _id_cliente INT
	)
	BEGIN
		-- Valido monto mayor que 0
		IF _monto <= 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: el monto debe ser mayor a 0';
		END IF;
    -- Validar cliente
		IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = _id_cliente) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: el cliente no existe';
		END IF;
    -- Validar consulta
		IF NOT EXISTS (SELECT 1 FROM consultas WHERE id_consulta = _id_consulta) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: la consulta no existe';
		END IF;
	-- Inserto datos si todo esta correcto
		START TRANSACTION;
        -- Si ya existe un pago para esa consulta, se actualiza
		IF EXISTS (SELECT 1 FROM pagos WHERE id_consulta = _id_consulta) THEN
			  UPDATE pagos
				SET 
					fecha_pago = _fecha,
					monto = _monto,
					medio_pago = _medio,
					estado_pago = _estado,
					id_cliente = _id_cliente
				WHERE id_consulta = _id_consulta;
		ELSE
			INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente)
			VALUES (_fecha, _monto, _medio, _estado, _id_consulta, _id_cliente);
		END IF;
        
		COMMIT;
	END//

/*
CALL sp_registrar_pago(CURDATE(),5000,'Efectivo','pagado',9,3);
SELECT * FROM pagos ORDER BY fecha_pago DESC;
*/

-- Procedimiento para registrar un nuevo turno
DROP PROCEDURE IF EXISTS sp_registrar_turno //

CREATE PROCEDURE sp_registrar_turno (
    IN _fecha DATE,
    IN _hora TIME,
    IN _estado VARCHAR(20),
    IN _nombre_mascota VARCHAR(100),
    IN _nombre_veterinario VARCHAR(100),
    IN _apellido_veterinario VARCHAR(100)
)
BEGIN
	-- Declaro variables para luego en base a los parámetros encontrar esos datos e insertar el nuevo turno
    -- Me resulta mas comodo ingresar nombres antes que IDs
    DECLARE _id_mascota INT;
    DECLARE _id_veterinario INT;
    
    -- Si ocurre cualquier error → rollback automático
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
		-- Obtener ID de la mascota a partir del nombre
		SELECT id_mascota 
		INTO _id_mascota
		FROM mascotas
		WHERE nombre = _nombre_mascota
		LIMIT 1;
        -- Valido si se encontro mascota
          IF _id_mascota IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: mascota no encontrada';
		END IF;
		-- Obtener ID del veterinario a partir de nombre y apellido
		SELECT id_veterinario
		INTO _id_veterinario
		FROM veterinarios
		WHERE nombre = _nombre_veterinario
		  AND apellido = _apellido_veterinario
		LIMIT 1;
        -- Valido si se encontro veterinario
        IF _id_veterinario IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: veterinario no encontrado';
		END IF;
		-- Insertar el turno usando los IDs encontrados
		INSERT INTO turnos (fecha, hora, estado, id_mascota, id_veterinario)
		VALUES (_fecha, _hora, _estado, _id_mascota, _id_veterinario);
		
	COMMIT;
END //

/*
CALL sp_registrar_turno(CURDATE(),CURTIME(),'pendiente','Bruno', 'Julieta', 'Sosa');
-- Julieta Sosa: ID=8, Bruno ID= 10
SELECT * FROM turnos ORDER BY fecha DESC;
*/

-- Procedimiento para registrar una consulta, verificar si el turno existe y segun el caso, insertar la informacion pertinente
DROP PROCEDURE IF EXISTS sp_registrar_consulta //

CREATE PROCEDURE sp_registrar_consulta (
IN _id_turno INT,
IN _diagnostico VARCHAR(100),
IN _observaciones VARCHAR(200)
)

BEGIN
    DECLARE _estado_turno VARCHAR(20);
    -- Si no hay resultado, descarto la opcion de ingresar consulta
    IF NOT EXISTS (SELECT 1 FROM turnos WHERE id_turno = _id_turno) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el turno no existe';
    END IF;
    -- Obtener estado del turno
    -- Filtro datos de los turnos previamente ingresados, comparando el numero de turno reservado
    SELECT estado
    INTO _estado_turno
    FROM turnos
    WHERE id_turno = _id_turno;
    -- Validar estado
    IF _estado_turno <> 'pendiente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el turno ya fue realizado o cancelado';
    END IF;
    
    START TRANSACTION;   
    
    -- Insertar consulta
    INSERT INTO consultas (fecha_consulta, diagnostico, observaciones, id_turno)
    VALUES (CURDATE(), _diagnostico, _observaciones, _id_turno);
    -- Actualizar estado del turno
    UPDATE turnos
    SET estado = 'completado'
    WHERE id_turno = _id_turno;

    COMMIT;
END //


/*
-- id_turno: 13
SELECT * FROM turnos ORDER BY fecha DESC;
SELECT * FROM consultas ORDER BY fecha_consulta DESC;

CALL sp_registrar_consulta(13, 'Checkeo general', 'Mascota en estado óptimo');

SELECT * FROM turnos ORDER BY fecha DESC;
SELECT * FROM consultas ORDER BY fecha_consulta DESC;
SELECT * FROM historial_medico ORDER BY id_historial DESC;
*/

-- ///////////// CREACION DE TRIGGERS /////////////

-- Creo un trigger para pasar nombre y apellido de cliente a Mayúsculas iniciales
DROP TRIGGER IF EXISTS tr_revision_nombre_apellido_cliente //

CREATE TRIGGER tr_revision_nombre_apellido_cliente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
	SET NEW.nombre = CONCAT(UPPER(LEFT (NEW.nombre,1)), LOWER(SUBSTRING(NEW.nombre,2)));
    
    SET NEW.apellido = CONCAT(UPPER(LEFT (NEW.apellido,1)), LOWER(SUBSTRING(NEW.apellido,2)));
END //

/*
INSERT INTO clientes (nombre, apellido, telefono, email, direccion)
VALUES ('juan', 'perez', '123456', NULL, 'Calle prueba');

SELECT * FROM clientes ORDER BY id_cliente DESC;
*/

-- Creo un trigger para asingar mail por defecto en caso de no tener
DROP TRIGGER IF EXISTS tr_revision_mail //

CREATE TRIGGER tr_revision_mail
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
	IF NEW.email IS NULL THEN
		SET NEW.email = CONCAT(lower(NEW.nombre),lower(NEW.apellido),'@default.com');
	END IF;
END //

/*
INSERT INTO clientes (nombre, apellido, telefono, email, direccion)
VALUES ('maria', 'lopez', '111111', NULL, 'Av prueba');

SELECT * FROM clientes ORDER BY id_cliente DESC;
*/

-- Trigger para validar pago mayor a cero
DROP TRIGGER IF EXISTS tr_validar_pago //

CREATE TRIGGER tr_validar_pago
BEFORE INSERT ON pagos
FOR EACH ROW
BEGIN
	IF NEW.monto < 0 THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Error: el monto del pago debe ser mayor a 0';
	END IF;
END //

/*
INSERT INTO pagos (fecha_pago, monto, medio_pago, estado_pago, id_consulta, id_cliente)
VALUES ('2026-04-14', -500, 'Efectivo', 'Pagado', 1, 1);
-- Error: el monto del pago debe ser mayor a 0
*/

-- Creo Trigger para registrar los datos de una consulta en el historial medico automaticamente
DROP TRIGGER IF EXISTS tr_registro_historial_medico //

CREATE TRIGGER tr_registro_historial_medico
AFTER INSERT ON consultas
FOR EACH ROW
BEGIN
    DECLARE _id_mascota INT;
    -- Obtener id de mascota
    SELECT id_mascota
    INTO _id_mascota
    FROM turnos t
    WHERE t.id_turno = NEW.id_turno;
	-- Solo insertar si se encontró la mascota
    IF _id_mascota IS NOT NULL THEN
		-- Evitar duplicados
		IF NOT EXISTS (SELECT 1 FROM historial_medico WHERE id_consulta = NEW.id_consulta)
			THEN
			INSERT INTO historial_medico (fecha_registro, descripcion,id_mascota,id_consulta) VALUES
			(NEW.fecha_consulta,NEW.diagnostico,_id_mascota,NEW.id_consulta);
		END IF;
	END IF;
END //

/*
-- Este ejemplo dispara el trigger automáticamente

CALL sp_registrar_consulta(
    2,
    'Chequeo general',
    'Todo en orden'
);

SELECT * FROM historial_medico ORDER BY id_historial DESC;
*/

DELIMITER ;