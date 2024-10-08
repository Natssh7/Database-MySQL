CREATE TABLE Agence(
   Id_agence INT,
   Nom_agence VARCHAR(50),
   Code_postal INT NOT NULL,
   Numéro_rue INT NOT NULL,
   Nom_rue VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_agence)
);

CREATE TABLE Type_compte(
   Libellé_type VARCHAR(50),
   Plafond_retrait VARCHAR(50),
   PRIMARY KEY(Libellé_type)
);

CREATE TABLE Employé(
   Id_employé INT,
   Nom_employé VARCHAR(50) NOT NULL,
   Prénom VARCHAR(50) NOT NULL,
   Id_employé_dirigé INT NULL,
   Id_agence INT NOT NULL,
   PRIMARY KEY(Id_employé),
   FOREIGN KEY(Id_employé_dirigé) REFERENCES Employé(Id_employé),
   FOREIGN KEY(Id_agence) REFERENCES Agence(Id_agence)
);

CREATE TABLE Client(
   Id_client INT,
   Nom VARCHAR(50) NOT NULL,
   Prénom VARCHAR(50) NOT NULL,
   Date_naissance DATE NOT NULL,
   Id_agence INT NOT NULL,
   PRIMARY KEY(Id_client),
   FOREIGN KEY(Id_agence) REFERENCES Agence(Id_agence)
);

CREATE TABLE Compte(
   Numero_compte VARCHAR(50),
   Solde INT NOT NULL,
   Libellé_type VARCHAR(50) NOT NULL,
   Id_client INT NOT NULL,
   PRIMARY KEY(Numero_compte),
   FOREIGN KEY(Libellé_type) REFERENCES Type_compte(Libellé_type),
   FOREIGN KEY(Id_client) REFERENCES Client(Id_client)
);

CREATE TABLE Virement(
   Id_vir INT,
   Iban VARCHAR(50),
   Devise VARCHAR(50) NOT NULL,
   Date_Heure DATETIME NOT NULL,
   Pays VARCHAR(50) NOT NULL,
   Motif VARCHAR(50) NOT NULL,
   Montant INT NOT NULL,
   Numero_compte VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_vir),
   FOREIGN KEY(Numero_compte) REFERENCES Compte(Numero_compte)
);

CREATE TABLE Retrait(
   Id_retrait INT,
   Date_heure_ret DATETIME NOT NULL,
   Montant_ret INT NOT NULL,
   Numero_compte VARCHAR(50) NOT NULL,
   Id_agence INT NOT NULL,
   PRIMARY KEY(Id_retrait),
   FOREIGN KEY(Numero_compte) REFERENCES Compte(Numero_compte),
   FOREIGN KEY(Id_agence) REFERENCES Agence(Id_agence)
);

CREATE TABLE Paiement(
   ID_paiement INT,
   Nom_bénéficiaire VARCHAR(50) NOT NULL,
   Montant_paie VARCHAR(50),
   Numero_compte VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_paiement),
   FOREIGN KEY(Numero_compte) REFERENCES Compte(Numero_compte)
);

CREATE TABLE Rendez_vous(
   Id_employé INT,
   Id_client INT,
   Date_rdv DATETIME,
   PRIMARY KEY(Id_employé, Id_client),
   FOREIGN KEY(Id_employé) REFERENCES Employé(Id_employé),
   FOREIGN KEY(Id_client) REFERENCES Client(Id_client)
);
