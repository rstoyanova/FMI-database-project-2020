CREATE TABLE NURSE (
    nurse_id CHAR(4) NOT NULL CONSTRAINT NURSE_ID PRIMARY KEY,
    nurse_name VARCHAR(128),
    position VARCHAR(64),
    salary DECIMAL CHECK ( salary>0 ),
    address VARCHAR(255),
    shift CHAR(1) CHECK (shift in ('M','D','N'))
);

CREATE TABLE ROOM (
    room_num INT CHECK ( room_num > 0 AND LENGTH(room_num) = 4 ) NOT NULL CONSTRAINT ROOM PRIMARY KEY,
    type CHAR(32) CHECK (type in ('ONEP', 'TWOP', 'THREEP')),
    cost DECIMAL
);

CREATE TABLE DRIVER (
    driver_id CHAR(4) NOT NULL CONSTRAINT DRIVER_ID PRIMARY KEY,
    driver_num VARCHAR(128),
    shift CHAR(1) CHECK (shift in ('M','D','N')),
    phone_num CHARACTER(10) NOT NULL,
    salary DECIMAL CHECK ( salary > 0 ),
    address VARCHAR(256),
    dr_license INT CHECK ( dr_license > 0 AND LENGTH(dr_license) = 9) NOT NULL
);

CREATE TABLE RECEIPTIONIST (
    rec_id INT CHECK ( rec_id > 0 AND LENGTH(rec_id) = 4) NOT NULL CONSTRAINT REC_ID PRIMARY KEY,
    rec_name VARCHAR(128),
    salary DECIMAL CHECK (salary > 0),
    address VARCHAR(255),
    phone_num CHARACTER(10)
);

CREATE TABLE AMBULANCE (
    reg_number CHAR(8) NOT NULL CONSTRAINT REG_NUM PRIMARY KEY,
    capacity INT CHECK (capacity > 0 AND capacity <10)
);

CREATE TABLE DEPARTMENT (
    dep_name VARCHAR(128) NOT NULL CONSTRAINT DEP_NAME PRIMARY KEY,
    dep_head_id CHAR(4) NOT NULL
);

CREATE TABLE OPERATINGROOM(
    op_room INT CHECK(op_room > 0 AND LENGTH(op_room) = 4) NOT NULL CONSTRAINT OP_NUM PRIMARY KEY,
    equipment_description VARCHAR(512) NOT NULL
);

CREATE TABLE PHYSICIAN(
    phys_id INT CHECK ( LENGTH(phys_id) = 4 ) NOT NULL CONSTRAINT PHYS_ID PRIMARY KEY,
    phys_name VARCHAR(128) NOT NULL,
    salary DECIMAL CHECK(salary > 0),
    age INT CHECK(age > 0),
    address VARCHAR(256),
    position VARCHAR(128),
    phone_num CHAR(10) NOT NULL,
    dep_name VARCHAR(50) NOT NULL CONSTRAINT DEP_NAME_FK REFERENCES Department(dep_name),
    oper_date DATE,
    оper_time TIME,
    op_room INT CHECK(op_room = NULL OR LENGTH(op_room) = 4) CONSTRAINT OP_ROOM_FK REFERENCES OPERATINGROOM(op_room)
);


CREATE TABLE PATIENT (
    pat_id CHAR(8) NOT NULL CONSTRAINT PAT_ID PRIMARY KEY ,
    EGN CHAR(10) NOT NULL ,
    pat_name VARCHAR(255),
    age INT CHECK ( age > 0),
    address VARCHAR(255),
    sex CHAR(1) CHECK (sex in ('M','F')),
    phone_num CHAR(10) NOT NULL,
    ambulance_time TIME,
    ambulance_date DATE,
    admission_time TIME,
    admission_date DATE,
    ad_id INT,
    driver_id CHAR(4) CONSTRAINT DRIVER_ID_FK REFERENCES DRIVER(driver_id),
    nurse_id CHAR(4) CONSTRAINT NURSE_ID_FK REFERENCES NURSE(nurse_id),
    room_num INT CHECK ( room_num > 0 AND LENGTH(room_num) = 4) CONSTRAINT ROOM_FK REFERENCES ROOM(room_num),
    rec_id INT CHECK ( rec_id > 0 AND LENGTH(rec_id) = 4) CONSTRAINT REC_ID_FK REFERENCES RECEIPTIONIST(rec_id)
);

CREATE TABLE NURSING_SERVICE (
    room_num INT CHECK ( room_num > 0) NOT NULL CONSTRAINT ROOM_NUM PRIMARY KEY ,
    nurse_id CHAR(4) NOT NULL CONSTRAINT NURSE_ID_FK REFERENCES NURSE(nurse_id),
    pat_id CHAR(8) NOT NULL CONSTRAINT PAT_ID_FK REFERENCES PATIENT(pat_id),
    service_date DATE
);

CREATE TABLE TEST (
    test_id INT CHECK (test_id > 0 AND LENGTH(test_id) = 6) NOT NULL CONSTRAINT TEST_ID PRIMARY KEY,
    test_name VARCHAR(64),
    fee DECIMAL,
    date DATE,
    time TIME,
    examine_date DATE,
    examine_time TIME,
    pat_id CHAR(8) NOT NULL CONSTRAINT PAT_ID_FK REFERENCES Patient(pat_id),
    phys_id CHAR(4) NOT NULL CONSTRAINT  PHYS_ID_FK REFERENCES PHYSICIAN(phys_id)
);

CREATE TABLE APPOINTMENT(
    app_id VARCHAR(6) NOT NULL CONSTRAINT APP_ID PRIMARY KEY,
    app_time TIME,
    app_date DATE,
    room_num INT CHECK (room_num > 0),
    pat_id CHAR(8) NOT NULL CONSTRAINT PAT_ID_FK REFERENCES PATIENT(pat_id),
    phys_id CHAR(4) NOT NULL CONSTRAINT  PHYS_ID_FK REFERENCES PHYSICIAN(phys_id),
    rec_id INT CHECK (rec_id > 0 AND LENGTH(rec_id) = 4) NOT NULL CONSTRAINT REC_ID_FK REFERENCES RECEIPTIONIST(rec_id)
);

CREATE TABLE MEDICATION(
    med_id CHAR(12) NOT NULL CONSTRAINT med_id PRIMARY KEY,
    name VARCHAR(64),
    price DECIMAL CHECK(price > 0),
    brand VARCHAR(32) NOT NULL,
    description VARCHAR(512),
    pres_id VARCHAR(12) NOT NULL,
    pres_date DATE NOT NULL,
    pat_id CHAR(8) NOT NULL CONSTRAINT PAT_ID_FK REFERENCES Patient(pat_id),
    phys_id CHAR(4) NOT NULL CONSTRAINT PHYS_ID_FK REFERENCES Physician(phys_id)
);

