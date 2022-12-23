CREATE DATABASE Proyecto;
USE Proyecto;

-- Tablas 
CREATE TABLE EMPLOYEE_TYPE(
	id_type int primary key auto_increment,
    employee_type varchar(30)
);

CREATE TABLE DOSE(
	id_dose int primary key auto_increment,
    dose varchar(30)
);

CREATE TABLE RESERVATION_PLATFORM(
	id_platform int primary key auto_increment,
    platform varchar(50)
);

CREATE TABLE VACCINATION_PLACE(
	id_place int primary key auto_increment,
    place_name varchar(200)
);

CREATE TABLE INSTITUTION(
	id_institution int primary key auto_increment,
    institution_name varchar(40)
);

CREATE TABLE MANAGER(
	id_manager int primary key auto_increment,
    username varchar(50),
    manager_password varchar(100),
    manager_name varchar(70),
    institutional_email varchar(150)
);

CREATE TABLE CITIZEN(
	DUI int primary key,
    citizen_name varchar(50),
    address varchar(200),
    birthdate date,
    email varchar(200),
    phone int,
    identifier_number int,
    id_institution int
);

CREATE TABLE APPOINTMENT(
	id_appointment int primary key auto_increment,
    appointment_date date,
    appointment_hour time,
    id_dose int,
    id_platform int,
    id_place int,
    id_manager int,
    id_citizen int
);

CREATE TABLE EMPLOYEE(
	id_employee int primary key auto_increment,
    employee_name varchar(60),
    institutional_email varchar(200),
    address varchar(200),
    id_type int
);

CREATE TABLE SIDE_EFFECTS(
	id_effect int primary key auto_increment,
    side_effect varchar(60)
);

CREATE TABLE DISEASE(
	id_disease int primary key auto_increment,
    chronic_disease varchar(70)
);

CREATE TABLE BOOTH(
	id_booth int primary key auto_increment,
    address varchar(200),
    phone_number int,
    email varchar(150),
    id_manager int
);

CREATE TABLE RECORD(
	id_record int primary key auto_increment,
    record_date date,
    record_hour time,
    id_manager int,
    id_booth int
);

CREATE TABLE APPOINTMENTXEMPLOYEE(
	id_appointment int,
    id_employee int,
    constraint PK_appointmentxemployee primary key (id_appointment, id_employee)
);

CREATE TABLE EFFECTSXCITIZEN(
	id_effect int,
    id_citizen int,
    constraint PK_effectsxcitizen primary key (id_effect, id_citizen)
);

CREATE TABLE DISEASEXCITIZEN(
	id_disease int,
    id_citizen int,
    constraint PK_diseasexcitizen primary key (id_disease, id_citizen)
);

-- Llaves foráneas
ALTER TABLE APPOINTMENT ADD FOREIGN KEY (id_dose) REFERENCES DOSE(id_dose);
ALTER TABLE APPOINTMENT ADD FOREIGN KEY (id_platform) REFERENCES RESERVATION_PLATFORM(id_platform);
ALTER TABLE APPOINTMENT ADD FOREIGN KEY (id_manager) REFERENCES MANAGER(id_manager);
ALTER TABLE APPOINTMENT ADD FOREIGN KEY (id_place) REFERENCES VACCINATION_PLACE(id_place);
ALTER TABLE APPOINTMENT ADD FOREIGN KEY (id_citizen) REFERENCES  CITIZEN(DUI);

ALTER TABLE EMPLOYEE ADD FOREIGN KEY (id_type) REFERENCES EMPLOYEE_TYPE(id_type);

ALTER TABLE CITIZEN ADD FOREIGN KEY (id_institution) REFERENCES INSTITUTION (id_institution);

ALTER TABLE BOOTH ADD FOREIGN KEY (id_manager) REFERENCES MANAGER (id_manager);

ALTER TABLE RECORD ADD FOREIGN KEY (id_manager) REFERENCES MANAGER (id_manager);
ALTER TABLE RECORD ADD FOREIGN KEY (id_booth) REFERENCES BOOTH (id_booth);

ALTER TABLE APPOINTMENTXEMPLOYEE ADD FOREIGN KEY (id_appointment) REFERENCES APPOINTMENT (id_appointment);
ALTER TABLE APPOINTMENTXEMPLOYEE ADD FOREIGN KEY (id_employee) REFERENCES EMPLOYEE (id_employee);

ALTER TABLE EFFECTSXCITIZEN ADD FOREIGN KEY (id_effect) REFERENCES SIDE_EFFECTS(id_effect);
ALTER TABLE EFFECTSXCITIZEN ADD FOREIGN KEY (id_citizen) REFERENCES CITIZEN(DUI);

ALTER TABLE DISEASEXCITIZEN ADD FOREIGN KEY (id_disease) REFERENCES DISEASE(id_disease) ON DELETE CASCADE;
ALTER TABLE DISEASEXCITIZEN ADD FOREIGN KEY (id_citizen) REFERENCES CITIZEN(DUI) ON DELETE CASCADE;

-- Inserts
INSERT INTO DOSE (dose) VALUES ('Previo a 1° dosis');
INSERT INTO DOSE (dose) VALUES ('Primera dosis');
INSERT INTO DOSE (dose) VALUES ('Previo a 2° dosis');
INSERT INTO DOSE (dose) VALUES ('Segunda dosis');

INSERT INTO INSTITUTION (institution_name) VALUES ('Personal de educacion');
INSERT INTO INSTITUTION (institution_name) VALUES ('Personal de salud');
INSERT INTO INSTITUTION (institution_name) VALUES ('Policía nacional civil');
INSERT INTO INSTITUTION (institution_name) VALUES ('Gobierno');
INSERT INTO INSTITUTION (institution_name) VALUES ('Fuerza armada');
INSERT INTO INSTITUTION (institution_name) VALUES ('Periodismo');
INSERT INTO INSTITUTION (institution_name) VALUES ('Ciudadano/a');

INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Dolor/Sensibilidad');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Enrrojecimiento');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Fatiga');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Dolor de cabeza');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Fiebre');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Mialgia');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Artrargia');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Anafilaxia');
INSERT INTO SIDE_EFFECTS(side_effect) VALUES('Otros');

INSERT INTO RESERVATION_PLATFORM (platform)VALUES ('Cabina');
INSERT INTO RESERVATION_PLATFORM (platform)VALUES ('Sitio Web');

INSERT INTO DISEASE (chronic_disease) VALUES ('Diabetes');
INSERT INTO DISEASE (chronic_disease) VALUES ('Enfermedades cardiovasculares');
INSERT INTO DISEASE (chronic_disease) VALUES ('Enfermedad pulmonar obstructiva crónica');
INSERT INTO DISEASE (chronic_disease) VALUES ('Insuficiencia renal crónica');
INSERT INTO DISEASE (chronic_disease) VALUES ('Cáncer');
INSERT INTO DISEASE (chronic_disease) VALUES ('Receptor de organos');
INSERT INTO DISEASE (chronic_disease) VALUES ('Personas seropositivas');
INSERT INTO DISEASE (chronic_disease) VALUES ('En tratamiento inmunosupresor');

INSERT INTO EMPLOYEE_TYPE(employee_type) VALUES ('Doctor/a');
INSERT INTO EMPLOYEE_TYPE(employee_type) VALUES ('Vacunador');
INSERT INTO EMPLOYEE_TYPE(employee_type) VALUES ('Asistente de salud');

INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('José Guerrero', 'guerrero.jose@salud.gob.sv', 'Residencial Buena Vista 1, Santa Tecla', 1);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Ana Figueroa', 'figueroa.ana@salud.gob.sv', 'Residencial Primavera II, Santa Tecla', 1);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Rafael Rodríguez', 'rodriguez.rafael@salud.gob.sv', 'Urbanización La Cima II, San Salvador', 3);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Jesús Monterrosa', 'monterrosa.jesus@salud.gob.sv', 'Residencial Altavista, San Salvador', 2);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Valeria Pérez', 'perez.valeria@salud.gob.sv', 'Colonia San Franciso, San Salvador', 1);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Rosa Lozano', 'lozano.rosa@salud.gob.sv', 'Colonia Ciudad Satelite, San Salvador', 2);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Eduardo Salas', 'salas.eduardo@salud.gob.sv', 'Colonia La Rábida, San Salvador', 2);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Ester Menjivar', 'menjivar.ester@salud.gob.sv', 'Colonia Miramonte, San Salvador', 2);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Carlos Vides', 'vides.carlos@salud.gob.sv', 'Residencial Mónaco, San Salvador', 1);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Georgina Alfaro', 'alfaro.georgina@salud.gob.sv', 'Urbanización Jardines de La Libertad, Santa Tecla', 3);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Julio Cárcamo', 'carcamo.julio@salud.gob.sv', 'Residencial La Gloria, San Salvador', 3);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Gabriela Aguilar', 'aguilar.gabriela@salud.gob.sv', 'Residencial Bosques de Santa Teresa, Santa Tecla', 2);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Claudia Barahona', 'barahona.claudia@salud.gob.sv', 'Colonia Roma, San Salvador', 3);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Pedro Iraheta', 'iraheta.pedro@salud.gob.sv', 'Urbanización Bosques de Prusia, San Salvador', 3);
INSERT INTO EMPLOYEE (employee_name, institutional_email, address, id_type) VALUES ('Benjamín Guillen', 'guillen.benjamin@salud.gob.sv', 'Colonia Valle de San Marcos, San Salvador', 2);

INSERT INTO VACCINATION_PLACE (place_name) VALUES ('Megacentro Hospital El Salvador');
INSERT INTO VACCINATION_PLACE (place_name) VALUES ('Autoservicio La Gran Vía');

INSERT INTO MANAGER (username, manager_password, manager_name, institutional_email) VALUES ('admin', 'admin123', 'Administrador', 'admin@salud.gob.sv');
INSERT INTO MANAGER (username, manager_password, manager_name, institutional_email) VALUES ('gestor1', 'gestor1231', 'Gestor', 'gestor@salud.gob.sv');

INSERT INTO BOOTH (address, phone_number, email, id_manager) VALUES ('Carretera Panamericana, San Salvador', 22503429, 'megacentro@gmail.com', 1);
INSERT INTO BOOTH (address, phone_number, email, id_manager) VALUES ('Carretera Panamericana y Calle Chiltiupan Antiguo Cuscatlán, La Libertad', 22503430, 'autoservicio@gmail.com', 2);

-- Inserts demostración
INSERT INTO CITIZEN VALUES (222222223, 'Karina Leiva', 'Residencial Altavista', '1982-04-10', 'karina.leiva01@gmail.com', 76334020, 20912333, 2);
INSERT INTO CITIZEN VALUES (222222224, 'Marcos Rodríguez', 'Residencial Cumbres de Cuscatlán', '1987-09-02', 'rodriguez_marcos01@gmail.com', 76356784, 11233567, 5);
INSERT INTO CITIZEN VALUES (222222225, 'Rosa Pineda', 'Colonia Santísima Trinida', '1988-11-22', 'rosa_pineda22@hotmail.com', 71983343, 0, 7);

INSERT INTO APPOINTMENT (appointment_date, appointment_hour, id_dose, id_platform, id_place, id_manager, id_citizen) VALUES ('2021-07-01', '19:35:00', 1, 2, 1, 1, 222222223);
INSERT INTO APPOINTMENT (appointment_date, appointment_hour, id_dose, id_platform, id_place, id_manager, id_citizen) VALUES ('2021-07-01', '19:45:00', 2, 1, 1, 1, 222222224);
INSERT INTO APPOINTMENT (appointment_date, appointment_hour, id_dose, id_platform, id_place, id_manager, id_citizen) VALUES ('2021-07-02', '19:45:00', 1, 1, 1, 1, 222222225);

-- Update demostración
UPDATE APPOINTMENT SET appointment_date = '2021-07-01' WHERE id_appointment = ?  AND id_citizen = 222222226;
UPDATE APPOINTMENT SET appointment_date = '2021-07-02' WHERE id_appointment = 30  AND id_citizen = 234567891;

SELECT * FROM APPOINTMENT;
SELECT * FROM APPOINTMENTXEMPLOYEE;
SELECT * FROM BOOTH;
SELECT * FROM CITIZEN;
SELECT * FROM DISEASE;
SELECT * FROM DISEASEXCITIZEN;
SELECT * FROM DOSE;
SELECT * FROM EFFECTSXCITIZEN;
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE_TYPE;
SELECT * FROM INSTITUTION;
SELECT * FROM MANAGER;
SELECT * FROM RECORD;
SELECT * FROM RESERVATION_PLATFORM;
SELECT * FROM SIDE_EFFECTS;
SELECT * FROM VACCINATION_PLACE;