CREATE INDEX AppIndex
ON Appointments (Appt_Date)


CREATE INDEX BiIndex
ON Bills (Bill_ID)


CREATE INDEX DoclstIndex
ON Doctors_List (List_Doctor_ID)


CREATE INDEX DocIndex
ON Doctors (Doctor_Last_Name)


CREATE INDEX drugIndex
ON Drugs (Drug_Name)


CREATE INDEX InsIndex
ON Insurance (Ins_Policy_Number)


CREATE INDEX inscoIndex
ON Insurance_Companies (Company_ID)


CREATE INDEX PatIndex
ON Patients (Patient_Last_Name)


CREATE INDEX phIndex
ON Pharmacist (Pharm_Last_Name, Pharm_First_Name)


CREATE INDEX PresIndex
ON Prescriptions (Pres_Patient_ID)


CREATE INDEX serofIndex
ON Services_Offered (Offered_Service_ID)


CREATE INDEX servIndex
ON Services (Services_Name, Services_Description)


CREATE INDEX serenIndex
ON Services_Rendered (Rendered_Appt_ID)