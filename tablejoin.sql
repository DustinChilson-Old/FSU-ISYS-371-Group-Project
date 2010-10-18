select Patients.Patient_First_Name,
Patients.Patient_Last_Name,
Prescriptions.Pres_Drug_ID
From Patients
Join
Prescriptions
ON Patients.Patient_ID = Prescriptions.Pres_Patient_ID