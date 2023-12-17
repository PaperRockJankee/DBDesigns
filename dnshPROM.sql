-- Drop tables if they exist
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Contest;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Offer;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Material;
DROP TABLE IF EXISTS OfferMaterial;

-- Create tables
CREATE TABLE Address (
    ID_head INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Contest (
    code INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    address INT NOT NULL,
    responsibleDepartment INT NOT NULL
);

CREATE TABLE Department (
    Department_Code INT PRIMARY KEY NOT NULL,
    Department_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Offer (
    Offer_Number INT PRIMARY KEY NOT NULL,
    Date VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    assessmentDepartment INT NOT NULL,
    supplier INT NOT NULL
);

CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY NOT NULL,
    CompanyName VARCHAR(255) NOT NULL
);

CREATE TABLE Material (
    Material_ID INT PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);

CREATE TABLE OfferMaterial (
    Offer_Code INT NOT NULL,
    Material_Code INT NOT NULL,
    PRIMARY KEY (Offer_Code, Material_Code)
);

-- Add foreign key constraints
ALTER TABLE Contest ADD CONSTRAINT FK_Contest_Address FOREIGN KEY (address) REFERENCES Address(ID_head);
ALTER TABLE Contest ADD CONSTRAINT FK_Contest_Department FOREIGN KEY (responsibleDepartment) REFERENCES Department (Department_Code);
ALTER TABLE Offer ADD CONSTRAINT FK_Offer_Department FOREIGN KEY (assessmentDepartment) REFERENCES Department (Department_Code);
ALTER TABLE Offer ADD CONSTRAINT FK_Offer_Supplier FOREIGN KEY (supplier) REFERENCES Supplier(Supplier_ID);
ALTER TABLE OfferMaterial ADD CONSTRAINT FK_OfferMaterial_Offer FOREIGN KEY (Offer_Code) REFERENCES Offer (Offer_Number);
ALTER TABLE OfferMaterial ADD CONSTRAINT FK_OfferMaterial_Material FOREIGN KEY (Material_Code) REFERENCES Material (Material_ID);

