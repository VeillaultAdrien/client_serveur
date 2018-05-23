CREATE TABLE salles (
id_salle NUMBER GENERATED ALWAYS AS IDENTITY, 
type VARCHAR2(10));

ALTER TABLE salles
ADD PRIMARY KEY (id_salle); 

CREATE TABLE activites (
id_activite NUMBER GENERATED ALWAYS AS IDENTITY, 
type VARCHAR2(10), 
date DATE, 
duree FLOAT,
id_salle NUMBER FOREIGN KEY REFERENCES salles(id_salle),
id_professeur NUMBER FOREIGN KEY REFERENCES professeurs(id_professeur),
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere);

ALTER TABLE activites
ADD PRIMARY KEY (id_activite); 

CREATE TABLE professeurs (
id_professeur NUMBER GENERATED ALWAYS AS IDENTITY,
mail VARCHAR2(10),
telephone VARCHAR2(10),
adresse VARCHAR2(10));

ALTER TABLE professeurs
ADD PRIMARY KEY (id_professeur); 

CREATE TABLE enseigne (
id_professeur NUMBER FOREIGN KEY REFERENCES professeurs(id_professeur)  PRIMARY KEY NOT NULL,
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere)  PRIMARY KEY NOT NULL);

CREATE TABLE matieres (
id_matiere  NUMBER GENERATED ALWAYS AS IDENTITY,
matiere VARCHAR2(10));

ALTER TABLE matieres
ADD PRIMARY KEY (id_matieres); 

CREATE TABLE appreciations (
id_appreciation  NUMBER GENERATED ALWAYS AS IDENTITY,
appreciation VARCHAR2(10),
id_matiere NUMBER FOREIGN KEY REFERENCES matieres(id_matiere)  PRIMARY KEY NOT NULL,
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiants(id_etudiant)  PRIMARY KEY NOT NULL);

ALTER TABLE appreciations
ADD PRIMARY KEY (id_appreciations); 

CREATE TABLE etudiants (
id_etudiant NUMBER GENERATED ALWAYS AS IDENTITY,
mail VARCHAR2(10),
telephone VARCHAR2(10),
adresse VARCHAR2(10),
moyenne FLOAT);

ALTER TABLE etudiants
ADD PRIMARY KEY (id_etudiant); 

CREATE TABLE participe (
id_activite NUMBER FOREIGN KEY REFERENCES activites(id_activite)  PRIMARY KEY NOT NULL,
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiants(id_etudiant)  PRIMARY KEY NOT NULL,
absence BOOLEAN,
note FLOAT);

CREATE TABLE appartient (
id_etudiant NUMBER FOREIGN KEY REFERENCES etudiant(id_etudiant)  PRIMARY KEY NOT NULL,
id_groupe NUMBER FOREIGN KEY REFERENCES groupes(id_groupe)  PRIMARY KEY NOT NULL);

CREATE TABLE groupes (
id_groupe NUMBER GENERATED ALWAYS AS IDENTITY);

ALTER TABLE groupes
ADD PRIMARY KEY (id_groupe); 
