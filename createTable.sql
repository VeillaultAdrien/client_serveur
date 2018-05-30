CREATE TABLE salles (
id_salle NUMBER GENERATED ALWAYS AS IDENTITY, 
type VARCHAR2(10));

ALTER TABLE salles
ADD PRIMARY KEY (id_salle); 

CREATE TABLE activites (
id_activite NUMBER GENERATED ALWAYS AS IDENTITY, 
type VARCHAR2(10), 
dateact DATE, 
duree FLOAT,
id_salle NUMBER,
id_professeur NUMBER,
id_matiere NUMBER);

ALTER TABLE activites
ADD PRIMARY KEY (id_activite); 

ALTER TABLE activites
ADD CONSTRAINT id_salle FOREIGN KEY (id_salle) REFERENCES salles(id_salle);

ALTER TABLE activites
ADD CONSTRAINT id_prof_act FOREIGN KEY (id_professeur) REFERENCES professeurs(id_professeur);

ALTER TABLE activites
ADD CONSTRAINT id_mat_act FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere);

CREATE TABLE professeurs (
id_professeur NUMBER GENERATED ALWAYS AS IDENTITY,
mail VARCHAR2(10),
telephone VARCHAR2(10),
adresse VARCHAR2(10));

ALTER TABLE professeurs
ADD PRIMARY KEY (id_professeur); 

CREATE TABLE enseigne (
id_professeur NUMBER,
id_matiere NUMBER);

ALTER TABLE enseigne
ADD CONSTRAINT id_professeur FOREIGN KEY (id_professeur) REFERENCES professeurs(id_professeur);

ALTER TABLE enseigne
ADD CONSTRAINT id_matiere FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere);

ALTER TABLE enseigne
ADD PRIMARY KEY (id_professeur,id_matiere);

CREATE TABLE matieres (
id_matiere  NUMBER GENERATED ALWAYS AS IDENTITY,
matiere VARCHAR2(10));

ALTER TABLE matieres
ADD PRIMARY KEY (id_matiere); 

CREATE TABLE appreciations (
id_appreciation  NUMBER GENERATED ALWAYS AS IDENTITY,
appreciation VARCHAR2(10),
id_matiere NUMBER,
id_etudiant NUMBER);

ALTER TABLE appreciations
ADD PRIMARY KEY (id_appreciation); 

ALTER TABLE appreciations
ADD CONSTRAINT id_mat_app FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere);

ALTER TABLE appreciations
ADD CONSTRAINT id_etudiant FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant);

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

ALTER TABLE participe
ADD CONSTRAINT id_activite FOREIGN KEY (id_activite) REFERENCES activites(id_activite);

ALTER TABLE participe
ADD CONSTRAINT id_participe_etud FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant);

ALTER TABLE participe
ADD PRIMARY KEY (id_activite,id_etudiant); 

CREATE TABLE appartient (
id_etudiant NUMBER,
id_groupe NUMBER);

ALTER TABLE appartient
ADD CONSTRAINT id_etudiant_appart FOREIGN KEY (id_etudiant) REFERENCES etudiants(id_etudiant);

ALTER TABLE appartient
ADD CONSTRAINT id_groupe FOREIGN KEY (id_groupe) REFERENCES groupes(id_groupe);

ALTER TABLE appartient
ADD PRIMARY KEY (id_etudiant,id_groupe); 

CREATE TABLE groupes (
id_groupe NUMBER GENERATED ALWAYS AS IDENTITY);

ALTER TABLE groupes
ADD PRIMARY KEY (id_groupe); 
