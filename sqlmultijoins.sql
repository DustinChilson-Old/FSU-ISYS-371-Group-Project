select Patients.Patient_Last_Name,
Prescriptions.Pres_Filled,
Drugs.Drug_Name
From Patients
Join
Prescriptions
ON Patients.Patient_ID = Prescriptions.Pres_Patient_ID
Join
Drugs
ON Prescriptions.Pres_Drug_ID = Drugs.Drug_ID