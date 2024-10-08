-- Ajout des contraintes
ALTER TABLE virement ADD CONSTRAINT chck_prix CHECK (Montant > 0);
ALTER TABLE virement ADD CONSTRAINT chk_devise CHECK (Devise = 'EUR' OR Devise = 'USD' OR Devise = 'JPY' OR Devise = 'CAD' OR Devise = 'AUD' OR Devise = 'INR' OR Devise = 'BRL');
ALTER TABLE retrait ADD CONSTRAINT chck_prix1 CHECK (Montant_ret > 0);
ALTER TABLE paiement ADD CONSTRAINT chck_prix2 CHECK (Montant_paie > 0);
-- ALTER TABLE client ADD CONSTRAINT chk_date CHECK (DATEDIFF(YEAR, Date_naissance, '2023-10-29') >= 18);

-- Ajout des données
INSERT INTO Agence (Id_agence, Nom_agence, Code_postal, Numéro_rue, Nom_rue)
VALUES
('1', "Agence A", '12345', '100', "Main Street"),
('2', "Agence B", '54321', '200', "Maple Avenue"),
('3', "Agence C", '67890', '300', "Oak Street"),
('4', "Agence D", '98765', '400', "Cedar Avenue"),
('5', "Agence E", '54321', '500', "Pine Street"),
('6', "Agence F", '98765', '600', "Cypress Avenue"),
('7', "Agence G", '23456', '700', "Chestnut Street"),
('8', "Agence H", '87654', '800', "Birch Avenue"),
('9', "Agence I", '34567', '900', "Willow Street"),
('10', "Agence J", '78901', '1000', "Elm Avenue");

INSERT INTO Type_compte (Libellé_type, Plafond_retrait)
VALUES
("Compte Courant", '1000'),
("Compte Épargne", '5000'),
("Compte Étudiant", '800');

INSERT INTO Employé (Id_employé, Nom_employé, Prénom, Id_employé_dirigé, Id_agence)
VALUES
('1', "Doe", "John", NULL, '1'),
('2', "Smith", "Jane", '1', '2'),
('3', "Anderson", "Michael", '1', '3'),
('4', "Brown", "Emma", '2', '4'),
('5', "Clark", "Olivia", '3', '5'),
('6', "Baker", "William", '4', '6'),
('7', "Turner", "Sophie", '5', '7'),
('8', "Gray", "Henry", '6', '8'), 
('9', "Bennett", "Daniel", '7', '9'),
('10', "Cooper", "Ella", '8', '10');

INSERT INTO Client (Id_client, Nom, Prénom, Date_naissance, Id_agence)
VALUES
('1', "Johnson", "Robert", '1990-05-15', '1'),
('2', "Williams", "Emily", '1985-08-22', '2'),
('3', "Miller", "David", '1988-07-12', '3'),
('4', "Taylor", "Sophia", '1995-04-28', '4'),
('5', "Moore", "Ethan", '1992-09-03', '5'),
('6', "Allen", "Ava", '1983-12-15', '6'),
('7', "Fisher", "Liam", '1980-11-20', '7'),
('8', "Reed", "Olivia", '1998-03-05', '8'),
('9', "Watson", "Mia", '1991-06-18', '9'),
('10', "Perry", "Jackson", '1982-02-09', '10');

INSERT INTO Compte (Numero_compte, Solde, Libellé_type, Id_client)
VALUES
("123456789", "5000", "Compte Courant", 1),
("987654321", "10000", "Compte Épargne", 2),
("1111222233334444", "8000", "Compte Courant", 3),
("4444333322221111", "12000", "Compte Courant", 4),
("5555666677778888", "500", "Compte Étudiant", 5),
("8888777766665555", "15000", "Compte Courant", 6),
("1234432112344321", "100000", "Compte Courant", 7),
("4321123443211234", "25000", "Compte Courant", 8),
("9876543210987654", "30000", "Compte Courant", 9),
("8765432109876543", "800", "Compte Courant", 10);

INSERT INTO Virement (Id_vir, Iban, Devise, Date_Heure, Pays, Motif, Montant, Numero_compte)
VALUES
('1', "GB29RIBR12345678901234", "USD", '2023-01-05 10:30:00', "United States", "Salary", 2000, "123456789"),
('2', "FR7630006000011234567890189", "EUR", '2023-02-15 15:45:00', "France", "Rent", 1500, "987654321"),
('3', "DE89370400440532013000", "EUR", '2023-07-18 08:15:00', "Germany", "Investment", 3000, "1111222233334444"),
('4', "ES9121000418450200051332", "EUR", '2023-08-30 13:00:00', "Spain", "Education", 2000, "4444333322221111"),
('5', "IT60X0542811101000000123456", "EUR", '2024-01-15 09:30:00', "Italy", "Vacation", 800, "5555666677778888"),
('6', "CA2712345678901234567", "CAD", '2024-02-28 12:45:00', "Canada", "Home Improvement", 3000, "8888777766665555"),
('7', "JP9012345678901234567", "JPY", '2024-07-18 15:45:00', "Japan", "Business Expansion", 50000, "1234432112344321"),
('8', "AU1212345678901234567", "AUD", '2024-08-30 11:30:00', "Australia", "Investment", 15000, "4321123443211234"),
('9', "IN2312345678901234567", "INR", '2025-01-15 14:30:00', "India", "Family Support", 10000, "9876543210987654"),
('10', "BR7512345678912345678", "BRL", '2025-02-28 10:15:00', "Brazil", "Medical Expenses", 500, "8765432109876543");

INSERT INTO Retrait (Id_retrait, Date_heure_ret, Montant_ret, Numero_compte, Id_agence)
VALUES
(1, '2023-03-10 12:00:00', 100, "123456789", 1),
(2, '2023-04-20 14:30:00', 50, "987654321", 2),
(3, '2023-09-12 10:45:00', 200, "1111222233334444", 3),
(4, '2023-10-25 16:30:00', 100, "4444333322221111", 4),
(5, '2024-03-10 11:15:00', 50, "5555666677778888", 5),
(6, '2024-04-22 14:30:00', 200, "8888777766665555", 6),
(7, '2024-09-12 09:00:00', 1000, "1234432112344321", 7),
(8, '2024-10-25 13:15:00', 500, "4321123443211234", 8),
(9, '2025-03-10 12:45:00', 2000, "9876543210987654", 9),
(10, '2025-04-22 08:30:00', 100, "8765432109876543", 10);

INSERT INTO rendez_vous (Id_employé, Id_client, Date_rdv)
VALUES 
('1', '5', '2023-10-29 10:00:00'),
('1', '7', '2023-10-15 09:30:00'),
('2', '3', '2023-12-31 08:00:00'),
('3', '9', '2023-12-31 15:15:00'),
('3', '8', '2023-12-31 16:00:00'),
('3', '4', '2023-11-11 09:00:00'),
('5', '1', '2023-10-01 11:05:00'),
('8', '2', '2023-11-10 14:30:00'),
('8', '6', '2023-11-15 08:15:00'),
('8', '10', '2023-11-16 10:00:00');