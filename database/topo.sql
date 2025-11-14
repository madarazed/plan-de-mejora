-- SQL dump for aplasta-topos_final
CREATE DATABASE IF NOT EXISTS aplasta_topos DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE aplasta_topos;

DROP TABLE IF EXISTS preguntas_usadas;
DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS preguntas;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS solicitudes_acceso;
DROP TABLE IF EXISTS admin;

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(80) UNIQUE,
    password_hash VARCHAR(255) DEFAULT 'REPLACE_WITH_HASH',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE solicitudes_acceso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120),
    correo VARCHAR(150),
    autorizacion TINYINT(1),
    fecha_solicitud DATETIME,
    pin VARCHAR(6),
    fecha_expiracion DATETIME,
    usado TINYINT(1) DEFAULT 0,
    reintentos INT DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120),
    correo VARCHAR(150),
    fecha_registro DATETIME
) ENGINE=InnoDB;

CREATE TABLE preguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta TEXT,
    opcion_a VARCHAR(255),
    opcion_b VARCHAR(255),
    opcion_c VARCHAR(255),
    opcion_d VARCHAR(255),
    respuesta_correcta CHAR(1),
    etapa VARCHAR(50),
    creada_por INT NULL,
    UNIQUE (pregunta(255))
) ENGINE=InnoDB;

CREATE INDEX idx_etapa ON preguntas(etapa);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    etapa VARCHAR(50),
    preguntas_correctas INT,
    preguntas_totales INT,
    estado VARCHAR(20),
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    FOREIGN KEY (id_jugador) REFERENCES jugadores(id)
) ENGINE=InnoDB;

CREATE TABLE preguntas_usadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    id_pregunta INT,
    fecha_usada DATETIME
) ENGINE=InnoDB;


INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué describe un requisito funcional?', 'Comportamiento que debe tener el sistema', 'La interfaz del usuario', 'El hardware requerido', 'Los casos de prueba', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Cuál es la finalidad principal del análisis de requisitos?', 'Entender qué necesita el cliente', 'Diseñar la base de datos', 'Programar módulos', 'Realizar pruebas unitarias', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un requisito no funcional?', 'Restricción de rendimiento o seguridad', 'Una función específica', 'Un caso de uso', 'Un diagrama de clases', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Quién suele recopilar requisitos con el cliente?', 'Analista de requisitos', 'Probador', 'Operador de base de datos', 'Administrador de sistemas', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento recoge habitualmente los requisitos?', 'Documento de especificación de requisitos', 'Manual de usuario', 'Informe de pruebas', 'Código fuente', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué describe un requisito funcional? (variante 1)', 'Comportamiento que debe tener el sistema', 'La interfaz del usuario', 'El hardware requerido', 'Los casos de prueba', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Cuál es la finalidad principal del análisis de requisitos? (variante 1)', 'Entender qué necesita el cliente', 'Diseñar la base de datos', 'Programar módulos', 'Realizar pruebas unitarias', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un requisito no funcional? (variante 1)', 'Restricción de rendimiento o seguridad', 'Una función específica', 'Un caso de uso', 'Un diagrama de clases', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Quién suele recopilar requisitos con el cliente? (variante 1)', 'Analista de requisitos', 'Probador', 'Operador de base de datos', 'Administrador de sistemas', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento recoge habitualmente los requisitos? (variante 1)', 'Documento de especificación de requisitos', 'Manual de usuario', 'Informe de pruebas', 'Código fuente', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué describe un requisito funcional? (variante 2)', 'Comportamiento que debe tener el sistema', 'La interfaz del usuario', 'El hardware requerido', 'Los casos de prueba', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Cuál es la finalidad principal del análisis de requisitos? (variante 2)', 'Entender qué necesita el cliente', 'Diseñar la base de datos', 'Programar módulos', 'Realizar pruebas unitarias', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un requisito no funcional? (variante 2)', 'Restricción de rendimiento o seguridad', 'Una función específica', 'Un caso de uso', 'Un diagrama de clases', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Quién suele recopilar requisitos con el cliente? (variante 2)', 'Analista de requisitos', 'Probador', 'Operador de base de datos', 'Administrador de sistemas', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento recoge habitualmente los requisitos? (variante 2)', 'Documento de especificación de requisitos', 'Manual de usuario', 'Informe de pruebas', 'Código fuente', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué describe un requisito funcional? (variante 3)', 'Comportamiento que debe tener el sistema', 'La interfaz del usuario', 'El hardware requerido', 'Los casos de prueba', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Cuál es la finalidad principal del análisis de requisitos? (variante 3)', 'Entender qué necesita el cliente', 'Diseñar la base de datos', 'Programar módulos', 'Realizar pruebas unitarias', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un requisito no funcional? (variante 3)', 'Restricción de rendimiento o seguridad', 'Una función específica', 'Un caso de uso', 'Un diagrama de clases', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Quién suele recopilar requisitos con el cliente? (variante 3)', 'Analista de requisitos', 'Probador', 'Operador de base de datos', 'Administrador de sistemas', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento recoge habitualmente los requisitos? (variante 3)', 'Documento de especificación de requisitos', 'Manual de usuario', 'Informe de pruebas', 'Código fuente', 'A', 'REQUERIMIENTOS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué actividad corresponde al análisis de sistemas?', 'Modelar procesos y datos', 'Instalar servidores', 'Escribir código', 'Crear la base de datos', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta se usa para representar procesos?', 'Diagrama de flujo', 'Editor de texto', 'Compilador', 'Sistema operativo', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de uso?', 'Descripción de interacción usuario-sistema', 'Un método de programación', 'Una prueba automatizada', 'Un requisito no funcional', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Para qué sirve la matriz de trazabilidad?', 'Relacionar requisitos con pruebas', 'Diseñar la UI', 'Aumentar velocidad de compilación', 'Contabilizar horas', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es modelado de datos?', 'Representar entidades y relaciones', 'Escribir documentación', 'Realizar pruebas', 'Instalar software', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué actividad corresponde al análisis de sistemas? (variante 1)', 'Modelar procesos y datos', 'Instalar servidores', 'Escribir código', 'Crear la base de datos', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta se usa para representar procesos? (variante 1)', 'Diagrama de flujo', 'Editor de texto', 'Compilador', 'Sistema operativo', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de uso? (variante 1)', 'Descripción de interacción usuario-sistema', 'Un método de programación', 'Una prueba automatizada', 'Un requisito no funcional', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Para qué sirve la matriz de trazabilidad? (variante 1)', 'Relacionar requisitos con pruebas', 'Diseñar la UI', 'Aumentar velocidad de compilación', 'Contabilizar horas', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es modelado de datos? (variante 1)', 'Representar entidades y relaciones', 'Escribir documentación', 'Realizar pruebas', 'Instalar software', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué actividad corresponde al análisis de sistemas? (variante 2)', 'Modelar procesos y datos', 'Instalar servidores', 'Escribir código', 'Crear la base de datos', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta se usa para representar procesos? (variante 2)', 'Diagrama de flujo', 'Editor de texto', 'Compilador', 'Sistema operativo', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de uso? (variante 2)', 'Descripción de interacción usuario-sistema', 'Un método de programación', 'Una prueba automatizada', 'Un requisito no funcional', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Para qué sirve la matriz de trazabilidad? (variante 2)', 'Relacionar requisitos con pruebas', 'Diseñar la UI', 'Aumentar velocidad de compilación', 'Contabilizar horas', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es modelado de datos? (variante 2)', 'Representar entidades y relaciones', 'Escribir documentación', 'Realizar pruebas', 'Instalar software', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué actividad corresponde al análisis de sistemas? (variante 3)', 'Modelar procesos y datos', 'Instalar servidores', 'Escribir código', 'Crear la base de datos', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta se usa para representar procesos? (variante 3)', 'Diagrama de flujo', 'Editor de texto', 'Compilador', 'Sistema operativo', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de uso? (variante 3)', 'Descripción de interacción usuario-sistema', 'Un método de programación', 'Una prueba automatizada', 'Un requisito no funcional', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Para qué sirve la matriz de trazabilidad? (variante 3)', 'Relacionar requisitos con pruebas', 'Diseñar la UI', 'Aumentar velocidad de compilación', 'Contabilizar horas', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es modelado de datos? (variante 3)', 'Representar entidades y relaciones', 'Escribir documentación', 'Realizar pruebas', 'Instalar software', 'A', 'ANALISIS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué se define en el diseño de software?', 'Estructura del sistema y sus componentes', 'El presupuesto', 'La estrategia de marketing', 'La infraestructura de red', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un diagrama de clases?', 'Representación de clases y relaciones', 'Un test unitario', 'Una herramienta de despliegue', 'Un servidor', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la arquitectura en software?', 'Patrón organizativo de componentes', 'Una base de datos', 'Un lenguaje de programación', 'Un caso de uso', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué papel tiene la usabilidad en diseño?', 'Mejorar experiencia de usuario', 'Optimizar consultas SQL', 'Controlar versiones', 'Realizar pruebas unitarias', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento define interfaces entre módulos?', 'Especificación de interfaces', 'Manual de usuario', 'Reporte de bugs', 'Plan de pruebas', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué se define en el diseño de software? (variante 1)', 'Estructura del sistema y sus componentes', 'El presupuesto', 'La estrategia de marketing', 'La infraestructura de red', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un diagrama de clases? (variante 1)', 'Representación de clases y relaciones', 'Un test unitario', 'Una herramienta de despliegue', 'Un servidor', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la arquitectura en software? (variante 1)', 'Patrón organizativo de componentes', 'Una base de datos', 'Un lenguaje de programación', 'Un caso de uso', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué papel tiene la usabilidad en diseño? (variante 1)', 'Mejorar experiencia de usuario', 'Optimizar consultas SQL', 'Controlar versiones', 'Realizar pruebas unitarias', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento define interfaces entre módulos? (variante 1)', 'Especificación de interfaces', 'Manual de usuario', 'Reporte de bugs', 'Plan de pruebas', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué se define en el diseño de software? (variante 2)', 'Estructura del sistema y sus componentes', 'El presupuesto', 'La estrategia de marketing', 'La infraestructura de red', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un diagrama de clases? (variante 2)', 'Representación de clases y relaciones', 'Un test unitario', 'Una herramienta de despliegue', 'Un servidor', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la arquitectura en software? (variante 2)', 'Patrón organizativo de componentes', 'Una base de datos', 'Un lenguaje de programación', 'Un caso de uso', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué papel tiene la usabilidad en diseño? (variante 2)', 'Mejorar experiencia de usuario', 'Optimizar consultas SQL', 'Controlar versiones', 'Realizar pruebas unitarias', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento define interfaces entre módulos? (variante 2)', 'Especificación de interfaces', 'Manual de usuario', 'Reporte de bugs', 'Plan de pruebas', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué se define en el diseño de software? (variante 3)', 'Estructura del sistema y sus componentes', 'El presupuesto', 'La estrategia de marketing', 'La infraestructura de red', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un diagrama de clases? (variante 3)', 'Representación de clases y relaciones', 'Un test unitario', 'Una herramienta de despliegue', 'Un servidor', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la arquitectura en software? (variante 3)', 'Patrón organizativo de componentes', 'Una base de datos', 'Un lenguaje de programación', 'Un caso de uso', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué papel tiene la usabilidad en diseño? (variante 3)', 'Mejorar experiencia de usuario', 'Optimizar consultas SQL', 'Controlar versiones', 'Realizar pruebas unitarias', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué documento define interfaces entre módulos? (variante 3)', 'Especificación de interfaces', 'Manual de usuario', 'Reporte de bugs', 'Plan de pruebas', 'A', 'DISEÑO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la programación modular?', 'Dividir el sistema en módulos independientes', 'Una base de datos relacional', 'Un diagrama de procesos', 'Una prueba de integración', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué significa refactorizar código?', 'Mejorar estructura sin cambiar comportamiento', 'Borrar funciones', 'Añadir nuevos requerimientos', 'Cambiar la base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta ayuda al control de versiones?', 'Git', 'FTP', 'Excel', 'Notepad', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es TDD (Test Driven Development)?', 'Desarrollar escribiendo tests primero', 'Diseñar la UI primero', 'Implementar sin pruebas', 'Hacer pruebas manuales', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un build automatizado?', 'Proceso que compila y empaqueta el software automáticamente', 'Un documento de requisitos', 'Un diagrama de clases', 'Un esquema de base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la programación modular? (variante 1)', 'Dividir el sistema en módulos independientes', 'Una base de datos relacional', 'Un diagrama de procesos', 'Una prueba de integración', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué significa refactorizar código? (variante 1)', 'Mejorar estructura sin cambiar comportamiento', 'Borrar funciones', 'Añadir nuevos requerimientos', 'Cambiar la base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta ayuda al control de versiones? (variante 1)', 'Git', 'FTP', 'Excel', 'Notepad', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es TDD (Test Driven Development)? (variante 1)', 'Desarrollar escribiendo tests primero', 'Diseñar la UI primero', 'Implementar sin pruebas', 'Hacer pruebas manuales', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un build automatizado? (variante 1)', 'Proceso que compila y empaqueta el software automáticamente', 'Un documento de requisitos', 'Un diagrama de clases', 'Un esquema de base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la programación modular? (variante 2)', 'Dividir el sistema en módulos independientes', 'Una base de datos relacional', 'Un diagrama de procesos', 'Una prueba de integración', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué significa refactorizar código? (variante 2)', 'Mejorar estructura sin cambiar comportamiento', 'Borrar funciones', 'Añadir nuevos requerimientos', 'Cambiar la base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta ayuda al control de versiones? (variante 2)', 'Git', 'FTP', 'Excel', 'Notepad', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es TDD (Test Driven Development)? (variante 2)', 'Desarrollar escribiendo tests primero', 'Diseñar la UI primero', 'Implementar sin pruebas', 'Hacer pruebas manuales', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un build automatizado? (variante 2)', 'Proceso que compila y empaqueta el software automáticamente', 'Un documento de requisitos', 'Un diagrama de clases', 'Un esquema de base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es la programación modular? (variante 3)', 'Dividir el sistema en módulos independientes', 'Una base de datos relacional', 'Un diagrama de procesos', 'Una prueba de integración', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué significa refactorizar código? (variante 3)', 'Mejorar estructura sin cambiar comportamiento', 'Borrar funciones', 'Añadir nuevos requerimientos', 'Cambiar la base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta ayuda al control de versiones? (variante 3)', 'Git', 'FTP', 'Excel', 'Notepad', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es TDD (Test Driven Development)? (variante 3)', 'Desarrollar escribiendo tests primero', 'Diseñar la UI primero', 'Implementar sin pruebas', 'Hacer pruebas manuales', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un build automatizado? (variante 3)', 'Proceso que compila y empaqueta el software automáticamente', 'Un documento de requisitos', 'Un diagrama de clases', 'Un esquema de base de datos', 'A', 'DESARROLLO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué prueba verifica unidades individuales de código?', 'Prueba unitaria', 'Prueba de carga', 'Prueba de aceptación', 'Prueba de seguridad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es una prueba de integración?', 'Verificar interacciones entre componentes', 'Hacer un backup', 'Instalar dependencias', 'Diseñar interfaces', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de prueba?', 'Conjunto de pasos para verificar una funcionalidad', 'Un tipo de requisito', 'Una clase de diseño', 'Un servidor de pruebas', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta suele usarse para automatizar pruebas?', 'Selenium', 'Photoshop', 'Word', 'Notepad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué mide una prueba de rendimiento?', 'Velocidad y escalabilidad del sistema', 'La usabilidad', 'El costo', 'La arquitectura', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué prueba verifica unidades individuales de código? (variante 1)', 'Prueba unitaria', 'Prueba de carga', 'Prueba de aceptación', 'Prueba de seguridad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es una prueba de integración? (variante 1)', 'Verificar interacciones entre componentes', 'Hacer un backup', 'Instalar dependencias', 'Diseñar interfaces', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de prueba? (variante 1)', 'Conjunto de pasos para verificar una funcionalidad', 'Un tipo de requisito', 'Una clase de diseño', 'Un servidor de pruebas', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta suele usarse para automatizar pruebas? (variante 1)', 'Selenium', 'Photoshop', 'Word', 'Notepad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué mide una prueba de rendimiento? (variante 1)', 'Velocidad y escalabilidad del sistema', 'La usabilidad', 'El costo', 'La arquitectura', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué prueba verifica unidades individuales de código? (variante 2)', 'Prueba unitaria', 'Prueba de carga', 'Prueba de aceptación', 'Prueba de seguridad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es una prueba de integración? (variante 2)', 'Verificar interacciones entre componentes', 'Hacer un backup', 'Instalar dependencias', 'Diseñar interfaces', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de prueba? (variante 2)', 'Conjunto de pasos para verificar una funcionalidad', 'Un tipo de requisito', 'Una clase de diseño', 'Un servidor de pruebas', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta suele usarse para automatizar pruebas? (variante 2)', 'Selenium', 'Photoshop', 'Word', 'Notepad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué mide una prueba de rendimiento? (variante 2)', 'Velocidad y escalabilidad del sistema', 'La usabilidad', 'El costo', 'La arquitectura', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué prueba verifica unidades individuales de código? (variante 3)', 'Prueba unitaria', 'Prueba de carga', 'Prueba de aceptación', 'Prueba de seguridad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es una prueba de integración? (variante 3)', 'Verificar interacciones entre componentes', 'Hacer un backup', 'Instalar dependencias', 'Diseñar interfaces', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un caso de prueba? (variante 3)', 'Conjunto de pasos para verificar una funcionalidad', 'Un tipo de requisito', 'Una clase de diseño', 'Un servidor de pruebas', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué herramienta suele usarse para automatizar pruebas? (variante 3)', 'Selenium', 'Photoshop', 'Word', 'Notepad', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué mide una prueba de rendimiento? (variante 3)', 'Velocidad y escalabilidad del sistema', 'La usabilidad', 'El costo', 'La arquitectura', 'A', 'PRUEBAS');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué implica la implementación del software?', 'Desplegar el sistema en producción', 'Escribir requisitos', 'Hacer pruebas unitarias', 'Diseñar la base de datos', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es CI/CD?', 'Integración y entrega continua', 'Control interno', 'Informe de calidad', 'Plan de proyecto', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un rollback?', 'Revertir a una versión anterior en producción', 'Actualizar la documentación', 'Crear un backup', 'Hacer pruebas', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un script de despliegue?', 'Script que automatiza la publicación del sistema', 'Un documento legal', 'Un diagrama UML', 'Un test unitario', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es monitoreo en producción?', 'Vigilar el rendimiento y errores del sistema', 'Diseñar la UI', 'Programar funciones', 'Crear casos de prueba', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué implica la implementación del software? (variante 1)', 'Desplegar el sistema en producción', 'Escribir requisitos', 'Hacer pruebas unitarias', 'Diseñar la base de datos', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es CI/CD? (variante 1)', 'Integración y entrega continua', 'Control interno', 'Informe de calidad', 'Plan de proyecto', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un rollback? (variante 1)', 'Revertir a una versión anterior en producción', 'Actualizar la documentación', 'Crear un backup', 'Hacer pruebas', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un script de despliegue? (variante 1)', 'Script que automatiza la publicación del sistema', 'Un documento legal', 'Un diagrama UML', 'Un test unitario', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es monitoreo en producción? (variante 1)', 'Vigilar el rendimiento y errores del sistema', 'Diseñar la UI', 'Programar funciones', 'Crear casos de prueba', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué implica la implementación del software? (variante 2)', 'Desplegar el sistema en producción', 'Escribir requisitos', 'Hacer pruebas unitarias', 'Diseñar la base de datos', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es CI/CD? (variante 2)', 'Integración y entrega continua', 'Control interno', 'Informe de calidad', 'Plan de proyecto', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un rollback? (variante 2)', 'Revertir a una versión anterior en producción', 'Actualizar la documentación', 'Crear un backup', 'Hacer pruebas', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un script de despliegue? (variante 2)', 'Script que automatiza la publicación del sistema', 'Un documento legal', 'Un diagrama UML', 'Un test unitario', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es monitoreo en producción? (variante 2)', 'Vigilar el rendimiento y errores del sistema', 'Diseñar la UI', 'Programar funciones', 'Crear casos de prueba', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué implica la implementación del software? (variante 3)', 'Desplegar el sistema en producción', 'Escribir requisitos', 'Hacer pruebas unitarias', 'Diseñar la base de datos', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es CI/CD? (variante 3)', 'Integración y entrega continua', 'Control interno', 'Informe de calidad', 'Plan de proyecto', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un rollback? (variante 3)', 'Revertir a una versión anterior en producción', 'Actualizar la documentación', 'Crear un backup', 'Hacer pruebas', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es un script de despliegue? (variante 3)', 'Script que automatiza la publicación del sistema', 'Un documento legal', 'Un diagrama UML', 'Un test unitario', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es monitoreo en producción? (variante 3)', 'Vigilar el rendimiento y errores del sistema', 'Diseñar la UI', 'Programar funciones', 'Crear casos de prueba', 'A', 'IMPLEMENTACIÓN');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué incluye mantenimiento del software?', 'Corrección de errores y mejoras', 'Diseño inicial', 'Creación de requisitos', 'Instalación de servidores', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es refactoring en mantenimiento?', 'Mejorar código sin cambiar su funcionalidad', 'Eliminar pruebas', 'Crear nuevos requisitos', 'Hacer despliegues', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es gestión de incidencias?', 'Registro y seguimiento de fallos detectados', 'Crear la base de datos', 'Hacer pruebas unitarias', 'Diseñar la UI', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es soporte post-implementación?', 'Atender y solucionar problemas de usuarios en producción', 'Diseñar la arquitectura', 'Hacer testing', 'Programar', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Por qué es importante la documentación en mantenimiento?', 'Facilita futuros cambios y soporte', 'Aumenta el costo', 'Oculta bugs', 'Reduce rendimiento', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué incluye mantenimiento del software? (variante 1)', 'Corrección de errores y mejoras', 'Diseño inicial', 'Creación de requisitos', 'Instalación de servidores', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es refactoring en mantenimiento? (variante 1)', 'Mejorar código sin cambiar su funcionalidad', 'Eliminar pruebas', 'Crear nuevos requisitos', 'Hacer despliegues', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es gestión de incidencias? (variante 1)', 'Registro y seguimiento de fallos detectados', 'Crear la base de datos', 'Hacer pruebas unitarias', 'Diseñar la UI', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es soporte post-implementación? (variante 1)', 'Atender y solucionar problemas de usuarios en producción', 'Diseñar la arquitectura', 'Hacer testing', 'Programar', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Por qué es importante la documentación en mantenimiento? (variante 1)', 'Facilita futuros cambios y soporte', 'Aumenta el costo', 'Oculta bugs', 'Reduce rendimiento', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué incluye mantenimiento del software? (variante 2)', 'Corrección de errores y mejoras', 'Diseño inicial', 'Creación de requisitos', 'Instalación de servidores', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es refactoring en mantenimiento? (variante 2)', 'Mejorar código sin cambiar su funcionalidad', 'Eliminar pruebas', 'Crear nuevos requisitos', 'Hacer despliegues', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es gestión de incidencias? (variante 2)', 'Registro y seguimiento de fallos detectados', 'Crear la base de datos', 'Hacer pruebas unitarias', 'Diseñar la UI', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es soporte post-implementación? (variante 2)', 'Atender y solucionar problemas de usuarios en producción', 'Diseñar la arquitectura', 'Hacer testing', 'Programar', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Por qué es importante la documentación en mantenimiento? (variante 2)', 'Facilita futuros cambios y soporte', 'Aumenta el costo', 'Oculta bugs', 'Reduce rendimiento', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué incluye mantenimiento del software? (variante 3)', 'Corrección de errores y mejoras', 'Diseño inicial', 'Creación de requisitos', 'Instalación de servidores', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es refactoring en mantenimiento? (variante 3)', 'Mejorar código sin cambiar su funcionalidad', 'Eliminar pruebas', 'Crear nuevos requisitos', 'Hacer despliegues', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es gestión de incidencias? (variante 3)', 'Registro y seguimiento de fallos detectados', 'Crear la base de datos', 'Hacer pruebas unitarias', 'Diseñar la UI', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Qué es soporte post-implementación? (variante 3)', 'Atender y solucionar problemas de usuarios en producción', 'Diseñar la arquitectura', 'Hacer testing', 'Programar', 'A', 'MANTENIMIENTO');
INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES ('¿Por qué es importante la documentación en mantenimiento? (variante 3)', 'Facilita futuros cambios y soporte', 'Aumenta el costo', 'Oculta bugs', 'Reduce rendimiento', 'A', 'MANTENIMIENTO');
