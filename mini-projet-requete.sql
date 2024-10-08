-- On cherche à afficher tous les types de comptes enregistrés
/* SELECT Libellé_type FROM compte
JOIN client ON client.Id_client = compte.Id_client
GROUP BY Libellé_type;
*/

-- On souhaiterait obtenir les comptes possedant un solde supérieur à 20000 avec le nom et le prénom des clients associés
/* SELECT Nom, Prénom, Solde FROM client
INNER JOIN compte ON client.Id_client = compte.Id_client
WHERE (Solde >= '20000');
*/

-- On a besoin d'afficher les informations des virements effectués entre le 01/01/2021 et le 30/02/2021
/* SELECT Iban, Devise, Date_Heure, Pays, Motif, Montant, Numero_compte FROM virement
WHERE (Date_Heure >= STR_TO_DATE("2023-01-01 00:00:00", "%Y-%m-%d %H:%i:%s") AND Date_Heure <= STR_TO_DATE("2024-02-30 23:59:59", "%Y-%m-%d %H:%i:%s"))
ORDER BY Date_Heure DESC;
*/

-- on cherche à trouver le dernier virement réalisé en France
/* SELECT * FROM virement
WHERE Pays = 'France' AND Date_Heure = (SELECT MAX(Date_Heure));
*/

-- On voudrait afficher tout les employées qui ont des rendez-vous avec des clients le 31/12/2023
/* SELECT employé.Nom_employé, employé.Prénom, client.Nom, client.Prénom FROM employé
JOIN rendez_vous ON employé.Id_employé = rendez_vous.Id_employé
JOIN client ON rendez_vous.Id_client = client.Id_client
WHERE (Date_rdv >= STR_TO_DATE("2023-12-31 00:00:00", "%Y-%m-%d %H:%i:%s")) AND (Date_rdv <= STR_TO_DATE("2023-12-31 23:59:59", "%Y-%m-%d %H:%i:%s"));
*/