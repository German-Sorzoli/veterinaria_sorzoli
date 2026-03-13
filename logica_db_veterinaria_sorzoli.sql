USE veterinaria_sorzoli;

-- ///////////// CREACION DE VISTAS /////////////

SELECT * FROM vista_clientes_mascotas;

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

DELIMITER // 

CREATE FUNCTION 
BEGIN

	RETURN
END;

//
