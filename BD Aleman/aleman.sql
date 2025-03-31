CREATE TABLE profesor (
    id INTEGER NOT NULL AUTO_INCREMENT,
    cedula VARCHAR(20),
    nombre VARCHAR(50) NOT NULL,        
    area VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    id_categoria INTEGER NOT NULL,
    CONSTRAINT pK_1 PRIMARY KEY (id)
);


CREATE TABLE categoria (
    id INTEGER NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT pK_2 PRIMARY KEY (id)
);



INSERT INTO CATEGORIA (DESCRIPCION) VALUES ('DOCTORADO'); 
INSERT INTO CATEGORIA (DESCRIPCION) VALUES ('MAESTRIA'); 
INSERT INTO CATEGORIA (DESCRIPCION) VALUES ('ESPECIALISTA'); 
INSERT INTO CATEGORIA (DESCRIPCION) VALUES ('PROFESIONAL'); 
INSERT INTO CATEGORIA (DESCRIPCION) VALUES ('OTROS'); 
COMMIT WORK; 
INSERT INTO profesor (cedula, nombre, area, telefono, id_categoria) 
VALUES ('101110111', 'Carlos Adolfo Beltrán Castro', 'Sistemas', '3152676091',3); 
INSERT INTO profesor (cedula, nombre, area, telefono, id_categoria) 
VALUES ('202220222', 'Luis Eduardo Torres', 'Economia', '6677-3456',2); 
INSERT INTO profesor (cedula, nombre, area, telefono, id_categoria) 
VALUES ('303330333', 'Juan Carlos Castro', 'Matematica', '67455-7788',4);