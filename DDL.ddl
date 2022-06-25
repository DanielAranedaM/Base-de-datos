-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2022-06-24 22:23:29 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE banco (
    id_banco   NUMBER NOT NULL,
    nombre     VARCHAR2(250) NOT NULL
);

ALTER TABLE banco ADD CONSTRAINT banco_pk PRIMARY KEY ( id_banco );

CREATE TABLE beneficio (
    id_beneficio                       NUMBER NOT NULL,
    cantidad_usos                      NUMBER NOT NULL,
    sindicato_id_sindicato             NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tipo_beneficio_id_tipo_beneficio   NUMBER
);

ALTER TABLE beneficio ADD CONSTRAINT beneficio_pk PRIMARY KEY ( id_beneficio );

CREATE TABLE beneficio_descuento (
    beneficio_id_beneficio   NUMBER NOT NULL,
    descuento_id_descuento   NUMBER NOT NULL,
    id_beneficio_descuento   NUMBER NOT NULL
);

ALTER TABLE beneficio_descuento ADD CONSTRAINT beneficio_descuento_pk PRIMARY KEY ( beneficio_id_beneficio,
                                                                                    descuento_id_descuento );

CREATE TABLE carga (
    id_carga                   NUMBER NOT NULL,
    rut_carga                  NUMBER NOT NULL,
    dv                         VARCHAR2(20) NOT NULL,
    primer_nombre              VARCHAR2(250) NOT NULL,
    segundo_nombre             VARCHAR2(250),
    primer_apellido            VARCHAR2(250) NOT NULL,
    fecha_nacimiento           DATE NOT NULL,
    persona_id_persona         NUMBER NOT NULL,
    parentesco_id_parentesco   NUMBER NOT NULL,
    pais_id_pais               NUMBER NOT NULL
);

ALTER TABLE carga ADD CONSTRAINT carga_pk PRIMARY KEY ( id_carga );

CREATE TABLE cheque (
    id_cheque                NUMBER NOT NULL,
    numero_cheque            NUMBER NOT NULL,
    tipo_pago_id_tipo_pago   NUMBER NOT NULL,
    banco_id_banco           NUMBER NOT NULL
);

ALTER TABLE cheque ADD CONSTRAINT cheque_pk PRIMARY KEY ( id_cheque );

CREATE TABLE color (
    id_color                          NUMBER NOT NULL,
    color                             VARCHAR2(250) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tipo_vehhiculo_id_tipo_vehiculo   NUMBER NOT NULL
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( id_color );

CREATE TABLE comuna (
    id_comuna                NUMBER NOT NULL,
    nombre                   VARCHAR2(250) NOT NULL,
    provincia_id_provincia   NUMBER NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE descuento (
    id_descuento                       NUMBER NOT NULL,
    porcentaje                         VARCHAR2(20) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    seguro_vehiculo_patente_vehiculo   VARCHAR2(20) NOT NULL
);

ALTER TABLE descuento ADD CONSTRAINT descuento_pk PRIMARY KEY ( id_descuento );

CREATE TABLE discapacidad (
    id_discapacidad      NUMBER NOT NULL,
    nombre               VARCHAR2(250) NOT NULL,
    persona_id_persona   NUMBER NOT NULL
);

ALTER TABLE discapacidad ADD CONSTRAINT discapacidad_pk PRIMARY KEY ( id_discapacidad );

CREATE TABLE pago (
    id_pago              NUMBER NOT NULL,
    pago_inicial         NUMBER NOT NULL,
    pago_mensual         NUMBER NOT NULL,
    persona_id_persona   NUMBER NOT NULL,
    fecha                DATE NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE pais (
    id_pais   NUMBER NOT NULL,
    nombre    VARCHAR2(250) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE parentesco (
    id_parentesco   NUMBER NOT NULL,
    parentesco      VARCHAR2(250) NOT NULL
);

ALTER TABLE parentesco ADD CONSTRAINT parentesco_pk PRIMARY KEY ( id_parentesco );

CREATE TABLE persona (
    id_persona           NUMBER NOT NULL,
    rut_o__pasaporte     CHAR(1) NOT NULL,
    nacionalidad         VARCHAR2(250) NOT NULL,
    primer_nombre        VARCHAR2(250) NOT NULL,
    segundo_nombre       VARCHAR2(250),
    primer_apellido      VARCHAR2(250) NOT NULL,
    segundo_apellido     VARCHAR2(250),
    pretension_sueldo    NUMBER NOT NULL,
    direccion            VARCHAR2(250) NOT NULL,
    masculino_femenino   CHAR(1) NOT NULL,
    discapacidad_si_no   CHAR(1),
    correo               VARCHAR2(250) NOT NULL,
    curriculum           BLOB NOT NULL,
    carga_si_no          CHAR(1),
    id_solicitud         NUMBER NOT NULL,
    pais_id_pais         NUMBER NOT NULL,
    comuna_id_comuna     NUMBER NOT NULL
);

COMMENT ON COLUMN persona.rut_o__pasaporte IS
    '0 rut
1 pasaporte';

COMMENT ON COLUMN persona.masculino_femenino IS
    '0 masculino
1 femenino';

COMMENT ON COLUMN persona.discapacidad_si_no IS
    '0 si
1 no';

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE provincia (
    id_provincia       NUMBER NOT NULL,
    nombre             VARCHAR2(250) NOT NULL,
    region_id_region   NUMBER NOT NULL
);

ALTER TABLE provincia ADD CONSTRAINT provincia_pk PRIMARY KEY ( id_provincia );

CREATE TABLE region (
    id_region   NUMBER NOT NULL,
    nombre      VARCHAR2(250) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE seguro_vehiculo (
    patente_vehiculo         VARCHAR2(20) NOT NULL,
    marca                    VARCHAR2(20) NOT NULL,
    modelo                   VARCHAR2(250) NOT NULL,
    numero_chasis            VARCHAR2(250) NOT NULL,
    numero_motor             VARCHAR2(250) NOT NULL,
    sindicato_id_sindicato   NUMBER NOT NULL
);

CREATE UNIQUE INDEX seguro_vehiculo__idx ON
    seguro_vehiculo (
        sindicato_id_sindicato
    ASC );

ALTER TABLE seguro_vehiculo ADD CONSTRAINT seguro_vehiculo_pk PRIMARY KEY ( patente_vehiculo );

CREATE TABLE sindicato (
    id_sindicato   NUMBER NOT NULL,
    nombre         VARCHAR2(20) NOT NULL
);

ALTER TABLE sindicato ADD CONSTRAINT sindicato_pk PRIMARY KEY ( id_sindicato );

CREATE TABLE solicitud (
    id_solicitud             NUMBER NOT NULL,
    fecha_creacion           DATE NOT NULL,
    hr_creacion              DATE NOT NULL,
    sindicato_id_sindicato   NUMBER NOT NULL,
    id_solicitud1            NUMBER NOT NULL,
    persona_id_persona       NUMBER NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id_solicitud );

CREATE TABLE telefono (
    id_telefono          NUMBER NOT NULL,
    numero               NUMBER NOT NULL,
    persona_id_persona   NUMBER NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( id_telefono );

CREATE TABLE tipo_beneficio (
    id_tipo_beneficio   NUMBER NOT NULL,
    nombre              VARCHAR2(250) NOT NULL
);

ALTER TABLE tipo_beneficio ADD CONSTRAINT tipo_beneficio_pk PRIMARY KEY ( id_tipo_beneficio );

CREATE TABLE tipo_pago (
    id_tipo_pago   NUMBER NOT NULL,
    metodo_pago    VARCHAR2(250) NOT NULL,
    pago_id_pago   NUMBER NOT NULL
);

ALTER TABLE tipo_pago ADD CONSTRAINT tipo_pago_pk PRIMARY KEY ( id_tipo_pago );

CREATE TABLE tipo_telefono (
    id_tipo_telefono       NUMBER NOT NULL,
    nombre                 VARCHAR2(250) NOT NULL,
    telefono_id_telefono   NUMBER NOT NULL
);

ALTER TABLE tipo_telefono ADD CONSTRAINT tipo_telefono_pk PRIMARY KEY ( id_tipo_telefono );

CREATE TABLE tipo_vehhiculo (
    id_tipo_vehiculo                   NUMBER NOT NULL,
    tipo                               VARCHAR2(250) NOT NULL,
    persona_id_persona                 NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    seguro_vehiculo_patente_vehiculo   VARCHAR2(20)
);

ALTER TABLE tipo_vehhiculo ADD CONSTRAINT tipo_vehhiculo_pk PRIMARY KEY ( id_tipo_vehiculo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE beneficio_descuento
    ADD CONSTRAINT beneficio_descuento_beneficio_fk FOREIGN KEY ( beneficio_id_beneficio )
        REFERENCES beneficio ( id_beneficio );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE beneficio_descuento
    ADD CONSTRAINT beneficio_descuento_descuento_fk FOREIGN KEY ( descuento_id_descuento )
        REFERENCES descuento ( id_descuento );

ALTER TABLE beneficio
    ADD CONSTRAINT beneficio_sindicato_fk FOREIGN KEY ( sindicato_id_sindicato )
        REFERENCES sindicato ( id_sindicato );

ALTER TABLE beneficio
    ADD CONSTRAINT beneficio_tipo_beneficio_fk FOREIGN KEY ( tipo_beneficio_id_tipo_beneficio )
        REFERENCES tipo_beneficio ( id_tipo_beneficio );

ALTER TABLE carga
    ADD CONSTRAINT carga_pais_fk FOREIGN KEY ( pais_id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE carga
    ADD CONSTRAINT carga_parentesco_fk FOREIGN KEY ( parentesco_id_parentesco )
        REFERENCES parentesco ( id_parentesco );

ALTER TABLE carga
    ADD CONSTRAINT carga_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE cheque
    ADD CONSTRAINT cheque_banco_fk FOREIGN KEY ( banco_id_banco )
        REFERENCES banco ( id_banco );

ALTER TABLE cheque
    ADD CONSTRAINT cheque_tipo_pago_fk FOREIGN KEY ( tipo_pago_id_tipo_pago )
        REFERENCES tipo_pago ( id_tipo_pago );

ALTER TABLE color
    ADD CONSTRAINT color_tipo_vehhiculo_fk FOREIGN KEY ( tipo_vehhiculo_id_tipo_vehiculo )
        REFERENCES tipo_vehhiculo ( id_tipo_vehiculo );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_provincia_fk FOREIGN KEY ( provincia_id_provincia )
        REFERENCES provincia ( id_provincia );

ALTER TABLE descuento
    ADD CONSTRAINT descuento_seguro_vehiculo_fk FOREIGN KEY ( seguro_vehiculo_patente_vehiculo )
        REFERENCES seguro_vehiculo ( patente_vehiculo );

ALTER TABLE discapacidad
    ADD CONSTRAINT discapacidad_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE pago
    ADD CONSTRAINT pago_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE persona
    ADD CONSTRAINT persona_comuna_fk FOREIGN KEY ( comuna_id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE persona
    ADD CONSTRAINT persona_pais_fk FOREIGN KEY ( pais_id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE provincia
    ADD CONSTRAINT provincia_region_fk FOREIGN KEY ( region_id_region )
        REFERENCES region ( id_region );

ALTER TABLE seguro_vehiculo
    ADD CONSTRAINT seguro_vehiculo_sindicato_fk FOREIGN KEY ( sindicato_id_sindicato )
        REFERENCES sindicato ( id_sindicato );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_sindicato_fk FOREIGN KEY ( sindicato_id_sindicato )
        REFERENCES sindicato ( id_sindicato );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE tipo_pago
    ADD CONSTRAINT tipo_pago_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

ALTER TABLE tipo_telefono
    ADD CONSTRAINT tipo_telefono_telefono_fk FOREIGN KEY ( telefono_id_telefono )
        REFERENCES telefono ( id_telefono );

ALTER TABLE tipo_vehhiculo
    ADD CONSTRAINT tipo_vehhiculo_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE tipo_vehhiculo
    ADD CONSTRAINT tipo_vehhiculo_seguro_vehiculo_fk FOREIGN KEY ( seguro_vehiculo_patente_vehiculo )
        REFERENCES seguro_vehiculo ( patente_vehiculo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            23
-- CREATE INDEX                             1
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   7
-- WARNINGS                                 0
