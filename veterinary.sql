SQL fle for veterinary system
CREATE DATABASE veterinary
CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
);
CREATE TABLE animals(
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIN KEY (ownerid)
    REFERENCES owners(ownerid)
);
CREATE TABLE appointments(
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIN KEY (animalid) REFERENCES animals(animalid)
);
CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    invoicedate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);
CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    doctorid INT,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    visitdate DATE,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);
INSERT INTO owners (ownerid, firstname, lastname, address, phone, email)
VALUES 
(1, 'John', 'Doe', '123 Main St, Quezon City', '09171234567', 'john.doe@example.com'),
(2, 'Maria', 'Santos', '45 Mabini St, Manila', '09281239876', 'maria.santos@example.com'),
(3, 'Carlos', 'Reyes', '89 Rizal Ave, Caloocan', '09183456721', 'carlos.reyes@example.com'),
(4, 'Anna', 'Lopez', '56 Bonifacio St, Pasig', '09391237654', 'anna.lopez@example.com'),
(5, 'David', 'Cruz', '78 Katipunan Ave, Quezon City', '09452318907', 'david.cruz@example.com'),
(6, 'Sophia', 'Garcia', '12 P. Burgos St, Makati', '09164578932', 'sophia.garcia@example.com'),
(7, 'Miguel', 'Torres', '67 Aurora Blvd, San Juan', '09223456789', 'miguel.torres@example.com'),
(8, 'Isabella', 'Ramos', '34 EDSA, Mandaluyong', '09561234567', 'isabella.ramos@example.com'),
(9, 'James', 'Del Rosario', '90 Taft Ave, Manila', '09184562371', 'james.delrosario@example.com'),
(10, 'Patricia', 'Mendoza', '21 Lapu-Lapu St, Cebu City', '09273458901', 'patricia.mendoza@example.com');
INSERT INTO animals (animalid, name, species, breed, birthdate, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Labrador Retriever', '2020-05-12', 'Male', 'Brown', 1),
(2, 'Mittens', 'Cat', 'Persian', '2021-03-08', 'Female', 'White', 2),
(3, 'Rocky', 'Dog', 'Bulldog', '2019-11-25', 'Male', 'Brindle', 3),
(4, 'Chloe', 'Cat', 'Siamese', '2022-07-02', 'Female', 'Cream', 4),
(5, 'Max', 'Dog', 'German Shepherd', '2020-09-15', 'Male', 'Black and Tan', 5),
(6, 'Coco', 'Bird', 'Parrot', '2021-12-10', 'Female', 'Green', 6),
(7, 'Shadow', 'Dog', 'Siberian Husky', '2018-04-20', 'Male', 'Gray and White', 7),
(8, 'Luna', 'Cat', 'Maine Coon', '2022-01-05', 'Female', 'Gray', 8),
(9, 'Charlie', 'Dog', 'Beagle', '2021-06-18', 'Male', 'Tri-color', 9),
(10, 'Bella', 'Rabbit', 'Holland Lop', '2023-02-11', 'Female', 'White and Brown', 10);
INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES 
(1, 1, '2024-03-01', 'Vaccination'),
(2, 2, '2024-03-05', 'Check-up'),
(3, 3, '2024-03-10', 'Deworming'),
(4, 4, '2024-03-15', 'Dental Cleaning'),
(5, 5, '2024-03-20', 'Surgery'),
(6, 6, '2024-03-25', 'Vaccination'),
(7, 7, '2024-03-28', 'Grooming'),
(8, 8, '2024-04-02', 'Check-up'),
(9, 9, '2024-04-05', 'Follow-up'),
(10, 10, '2024-04-10', 'Health Certificate');
INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com'),
(7, 'Dr.Rafael', 'Dizon', 'Cardiology Specialist', '444-666-8888', 'rafael@example.com'),
(8, 'Dr.Elena', 'Del Rosario', 'Dental Specialist', '222-333-4444', 'elena@example.com'),
(9, 'Dr.Miguel', 'Cortez', 'Radiology Specialist', '777-999-0000', 'miguel@example.com'),
(10, 'Dr.Isabella', 'Navarro', 'Emergency Care Specialist', '666-111-2222', 'isabella@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;