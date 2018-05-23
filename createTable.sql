CREATE TABLE salles (
id_salle NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
type VARCHAR);

CREATE TABLE activites (
id_activite NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
type VARCHAR, 
date DATE, 
duree FLOAT,
id_salle NUMBER FOREIGN KEY REFERENCES salles(id_salle),
id_professeur NUMBER FOREIGN KEY REFERENCES professeurs(id_professeur),
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere);

CREATE TABLE professeurs (
id_professeur NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT,
mail VARCHAR,
telephone VARCHAR,
adresse VARCHAR);

CREATE TABLE enseigne (
id_professeur NUMBER FOREIGN KEY REFERENCES professeurs(id_professeur)  PRIMARY KEY NOT NULL,
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere)  PRIMARY KEY NOT NULL);

CREATE TABLE matieres (
id_matiere  NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT,
matiere VARCHAR);

CREATE TABLE appreciations (
id_appreciation  NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT,
appreciation VARCHAR,
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere)  PRIMARY KEY NOT NULL,
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiants(id_etudiant)  PRIMARY KEY NOT NULL);

CREATE TABLE etudiants (
id_etudiant NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT,
mail VARCHAR,
telephone VARCHAR,
adresse VARCHAR,
moyenne FLOAT);

CREATE TABLE participe (
id_activite NUMBER FOREIGN KEY REFERENCES activites(id_activite)  PRIMARY KEY NOT NULL,
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiants(id_etudiant)  PRIMARY KEY NOT NULL,
absence BOOLEAN,
note FLOAT);

CREATE TABLE appartient (
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiant(id_etudiant)  PRIMARY KEY NOT NULL,
id_groupe NUMBER FOREIGN KEY REFERENCES groupes(id_groupe)  PRIMARY KEY NOT NULL);

CREATE TABLE groupes (
id_groupe NUMBER PRIMARY KEY NOT NULL AUTO_INCREMENT);
