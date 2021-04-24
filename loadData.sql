
--departments
INSERT INTO FN45421.DEPARTMENT
VALUES ('Endokrinologiq','1000');

INSERT INTO FN45421.DEPARTMENT
VALUES ('Onkologiq', '2000');

--nurses
INSERT INTO NURSE
VALUES(4234,'Ganka Dimitrova','regular nurse',1500,'gr. Sofiq...','D');
INSERT INTO NURSE
VALUES(4235,'Ganka Todorova','regular nurse',1500,'gr. Sofiq...','N');
INSERT INTO NURSE
VALUES(4111,'Yordanka Markova','head nurse',2000,'gr. Sofiq...','M');
INSERT INTO NURSE
VALUES(5111,'Kapka Stoqnova','intern',800,'gr. Sofiq...','M');
INSERT INTO NURSE
VALUES (4442,'Aneliq Petkova','intern',800,NULL,'M');

--physicians
INSERT INTO FN45421.PHYSICIAN
VALUES (1000,'Bobi',99999,22,'gr. Sofia, kv. Hadji Dimitar 110, vh. G, ap. 124','endokrinolog','0876111986','Endokrinologiq',NULL,NULL,NULL);

INSERT INTO FN45421.PHYSICIAN
VALUES (2000,'Reni',99999,22,'gr. Sofia, Studentski Grad','onkolog','0876111111','Onkologiq',NULL,NULL,NULL);

INSERT INTO FN45421.PHYSICIAN
VALUES (3200,'Gabi',99999,22,'gr. Sofia, Studentski Grad','onkolog','0012555678','Onkologiq',NULL,NULL,NULL);
--receiptionists
INSERT INTO RECEIPTIONIST
VALUES (7123,'Gergana Georgieva',1300,'gr.Pernik,...',0871113248);

--patients
INSERT INTO PATIENT
VALUES ('B1234567','9804301234','Borislav Todorov',22,'gr. Sofiq','M','0876111986',NULL,NULL,'14:30:00','8.6.2020',NULL,NULL,NULL,NULL,NULL);

INSERT INTO PATIENT
VALUES ('B1234568','9804301234','Borislav Genadiev',22,'gr. Sofiq','M','0876112222',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7123);

--appointments
INSERT INTO APPOINTMENT
VALUES ('AA0001','14:20:00','14.2.2020',1,7123,'1000',7123);

--medication
INSERT INTO MEDICATION
VALUES('POOPPW123790','ANTISTEPSICIL', 35, 'Sofarma','med for sore throat' ,'7890002909', '12.05.2020', 'A1234568', 'Gabi');

INSERT INTO MEDICATION
VALUES('POOPPW123792','Kolagen', 20, 'Sofarma','med for put strength' ,'7890002902', '13.05.2020', 'A1234568', 'Gabi');

INSERT INTO MEDICATION
VALUES('POOPPW123742','Kolagen', 20, 'Sofarma','med for put strength' ,'7890002902', '13.05.2020', 'A1234568', 'Gabi');


--tests
INSERT INTO TEST
VALUES (184675, 'Test za covid-19', 100, '13.6.2020', '12:47:00', '17.06.2020', '16:00:00', 'B1234567', 1000);

INSERT INTO TEST
VALUES (645812, 'Test za bremennost', 30, '5.6.2020', '14:21:00', '16.06.2020', '13:30:00', 'B1234567', 2000);

INSERT INTO TEST
VALUES (184675, 'Test za antitela', 120, '11.6.2020', '16:18:00', '17.06.2020', '12:00:00', 'B1234568', 3200);

INSERT INTO TEST
VALUES (184675, 'Test za narkotici', 50, '13.6.2020', '18:14:00', '14.06.2020', '10:00:00', 'B1234567', 1000);


--trigger test
INSERT INTO NURSE
VALUES (8888,'asd','asd',1,'a','D');

UPDATE PHYSICIAN
SET PHYS_ID = 5200
WHERE PHYS_ID = 1000;

UPDATE FN45421.DEPARTMENT
SET DEP_HEAD_ID = 5100
WHERE DEP_HEAD_ID = 2000;

UPDATE PATIENT
SET PAT_ID = 'A123R568'
WHERE PAT_ID = 'A1234568';

--view test
SELECT * FROM NURSES_SHIFTS;