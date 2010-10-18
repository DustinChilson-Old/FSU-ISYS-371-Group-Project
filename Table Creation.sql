/* SQLEditor (Generic SQL)*/
DROP TABLE Prescriptions;
DROP TABLE Pharmacist;
DROP TABLE Drugs;
DROP TABLE Bills;
DROP TABLE Services_Rendered;
DROP TABLE Appointments;
DROP TABLE Services_Offered;
DROP TABLE Doctors_List;
DROP TABLE Doctors;
DROP TABLE Patients;
DROP TABLE Insurance;
DROP TABLE Insurance_Companies;
DROP TABLE Services;

CREATE TABLE Pharmacist
(
Pharm_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Pharm_First_Name CHAR(10) NOT NULL,
Pharm_Last_Name CHAR(15) NOT NULL,
Pharm_Address_1 CHAR(40) NOT NULL,
Pharm_Address_2 CHAR(40),
Pharm_City CHAR(20) NOT NULL,
Pharm_State CHAR(15) NOT NULL,
Pharm_Zip CHAR(10) NOT NULL,
Pharm_Phone CHAR(10) NOT NULL,
PRIMARY KEY (Pharm_ID)
);

CREATE TABLE Drugs
(
Drug_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Drug_Name CHAR(25) NOT NULL,
Drug_Maker CHAR(25) NOT NULL,
Drug_Description CHAR(255),
PRIMARY KEY (Drug_ID)
);

CREATE TABLE Doctors
(
Doctor_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Doctor_First_Name CHAR(10) NOT NULL,
Doctor_Last_Name CHAR(15) NOT NULL,
Doctor_Address_1 CHAR(40) NOT NULL,
Doctor_Address_2 CHAR(40),
Doctor_City CHAR(20) NOT NULL,
Doctor_State CHAR(15) NOT NULL,
Doctor_Zip CHAR(10) NOT NULL,
Doctor_Phone CHAR(25) NOT NULL,
PRIMARY KEY (Doctor_ID)
);

CREATE TABLE Insurance_Companies
(
Company_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Company_Address_1 CHAR(40) NOT NULL,
Company_Address_2 CHAR(40),
Company_City CHAR(20) NOT NULL,
Company_State CHAR(15) NOT NULL,
Company_Contact_First_Name CHAR(10) NOT NULL,
Company_Contact_Last_Name CHAR(15) NOT NULL,
Company_Phone CHAR(25) NOT NULL,
PRIMARY KEY (Company_ID)
);

CREATE TABLE Insurance
(
Ins_Policy_Number CHAR(15),
Ins_Company_ID INTEGER NOT NULL,
Ins_Copay NUM NOT NULL,
Ins_Coverage NUM NOT NULL,
PRIMARY KEY (Ins_Policy_Number)
);

CREATE TABLE Patients
(
Patient_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Patient_First_Name CHAR(10) NOT NULL,
Patient_Last_Name CHAR(15) NOT NULL,
Patient_Ins_Number CHAR(15) NOT NULL,
Patient_Address_1 CHAR(40) NOT NULL,
Patient_Address_2 CHAR(40),
Patient_City CHAR(20) NOT NULL,
Patient_State CHAR(15) NOT NULL,
Patient_Zip CHAR(10) NOT NULL,
Patient_Phone CHAR(25) NOT NULL,
PRIMARY KEY (Patient_ID)
);

CREATE TABLE Appointments
(
Appt_Service CHAR(8) NOT NULL,
Appt_Patient_ID INTEGER NOT NULL,
Appt_Date DATE NOT NULL,
Appt_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Appt_Doctor_ID INTEGER NOT NULL,
PRIMARY KEY (Appt_ID)
);

CREATE TABLE Bills
(
Bill_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Bill_Appt_ID INTEGER NOT NULL,
Bill_Bill_Sent CHAR(1) NOT NULL,
PRIMARY KEY (Bill_ID)
);

CREATE TABLE Prescriptions
(
Pres_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Pres_Patient_ID INTEGER NOT NULL,
Pres_Drug_ID INTEGER NOT NULL,
Pres_Refills CHAR(6) NOT NULL,
Pres_Filled CHAR(1) NOT NULL,
Pres_Pharmacist INTEGER NOT NULL,
Pres_Doctor_ID CHAR(8) NOT NULL,
PRIMARY KEY (Pres_ID)
);

CREATE TABLE Services
(
Services_ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 10000000, INCREMENT BY 1),
Services_Name CHAR(10) NOT NULL,
Services_Description CHAR(255),
Services_Cost NUM NOT NULL,
PRIMARY KEY (Services_ID)
);

CREATE TABLE Services_Offered
(
Offered_Service_ID INTEGER NOT NULL,
Offered_Doctor_ID INTEGER
);

CREATE TABLE Services_Rendered
(
Rendered_Appt_ID INTEGER NOT NULL,
Rendered_Service_ID INTEGER NOT NULL
);

CREATE TABLE Doctors_List
(
List_Patient_ID INTEGER NOT NULL,
List_Doctor_ID INTEGER
);

ALTER TABLE Insurance ADD FOREIGN KEY (Ins_Company_ID) REFERENCES Insurance_Companies (Company_ID);

ALTER TABLE Patients ADD FOREIGN KEY (Patient_Ins_Number) REFERENCES Insurance (Ins_Policy_Number);

ALTER TABLE Appointments ADD FOREIGN KEY (Appt_Patient_ID) REFERENCES Patients (Patient_ID);

ALTER TABLE Appointments ADD FOREIGN KEY (Appt_Doctor_ID) REFERENCES Doctors (Doctor_ID);

ALTER TABLE Bills ADD FOREIGN KEY (Bill_Appt_ID) REFERENCES Appointments (Appt_ID);

ALTER TABLE Prescriptions ADD FOREIGN KEY (Pres_Patient_ID) REFERENCES Patients (Patient_ID);

ALTER TABLE Prescriptions ADD FOREIGN KEY (Pres_Drug_ID) REFERENCES Drugs (Drug_ID);

ALTER TABLE Prescriptions ADD FOREIGN KEY (Pres_Pharmacist) REFERENCES Pharmacist (Pharm_ID);

ALTER TABLE Services_Offered ADD FOREIGN KEY (Offered_Service_ID) REFERENCES Services (Services_ID);

ALTER TABLE Services_Offered ADD FOREIGN KEY (Offered_Doctor_ID) REFERENCES Doctors (Doctor_ID);

ALTER TABLE Services_Rendered ADD FOREIGN KEY (Rendered_Appt_ID) REFERENCES Appointments (Appt_ID);

ALTER TABLE Services_Rendered ADD FOREIGN KEY (Rendered_Service_ID) REFERENCES Services (Services_ID);

ALTER TABLE Doctors_List ADD FOREIGN KEY (List_Patient_ID) REFERENCES Patients (Patient_ID);

ALTER TABLE Doctors_List ADD FOREIGN KEY (List_Doctor_ID) REFERENCES Doctors (Doctor_ID);
