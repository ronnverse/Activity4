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