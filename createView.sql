
CREATE VIEW NURSES_SHIFTS
AS SELECT NURSE_ID,NURSE_NAME,SHIFT FROM NURSE;

CREATE VIEW PHYSICIAN_NUMBERS
AS SELECT PHYS_NAME,PHONE_NUM FROM PHYSICIAN;

CREATE VIEW ALL_PHYS_FROM_ONTOLOGY_DEP
AS SELECT *
   FROM PHYSICIAN
   WHERE DEP_NAME = 'Onkologiq';

CREATE VIEW MOST_FREQUENT_MEDICATION
AS  SELECT DISTINCT NAME, COUNT(NAME) AS MOST_FREQUENT
    FROM MEDICATION
    GROUP BY NAME
    HAVING COUNT(NAME) >= ALL(SELECT COUNT(NAME) AS NUM_FREQUENCY
                              FROM MEDICATION
                              GROUP BY NAME
                              ORDER BY NUM_FREQUENCY DESC);


CREATE VIEW TESTS_ABOVE_AVG_FEE(NAME, FEE)
AS SELECT TEST_NAME, FEE
    FROM FN45421.TEST
    WHERE FEE > (SELECT AVG(FEE)
                    FROM FN45421.TEST);

CREATE VIEW UNDERAGE_PATIENTS(NAME, EGN, PHONE)
AS SELECT PAT_NAME, EGN, PHONE_NUM
    FROM PATIENT
    WHERE AGE<18
    ORDER BY AGE;

CREATE VIEW LARGE_CAPACITY_AMB(REGISTRATION_NUMBER)
AS SELECT REG_NUMBER
    FROM AMBULANCE
    WHERE CAPACITY > 2
    ORDER BY CAPACITY;


CREATE VIEW APPOINTMENTS_THIS_MONTH(PATIENT_ID, DATE, TIME)
AS SELECT DISTINCT PAT_ID, APP_TIME, APP_DATE
    FROM APPOINTMENT
    WHERE APP_DATE <= CURRENT_DATE + 1 MONTH
    AND APP_DATE > CURRENT_DATE + 1 MONTH ;


CREATE VIEW TESTS_FOR_TODAY(NAME, PATIENT, TIME)
AS SELECT TEST_NAME, PAT_ID, TIME
    FROM FN45421.TEST
    WHERE DATE = CURRENT_DATE;


CREATE VIEW FEMALE_PATIENTS_UNDER_30(NAME, NUMBER)
AS SELECT PAT_NAME, PHONE_NUM
    FROM FN45421.PATIENT
    WHERE AGE<30
    AND SEX = 'F';





