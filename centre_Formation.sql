DROP DATABASE IF EXISTS centreformation;

CREATE DATABASE IF NOT EXISTS centreformation;
USE centreformation;
# -----------------------------------------------------------------------------
#       TABLE : SPECIALITÉ
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SPECIALITÉ
 (
   CODESPEC CHAR(32) NOT NULL  ,
   NOMSPEC CHAR(32) NULL  ,
   DESCSPEC CHAR(32) NULL  
   , PRIMARY KEY (CODESPEC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETUDIANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETUDIANT
 (
   NUMCINETU CHAR(32) NOT NULL  ,
   NOMETU CHAR(32) NULL  ,
   PRENOMETU CHAR(32) NULL  ,
   DATENAISSANCE CHAR(32) NULL  ,
   ADRESSEETU CHAR(32) NULL  ,
   VILLEETU CHAR(32) NULL  ,
   NIVEAUETU CHAR(32) NULL  
   , PRIMARY KEY (NUMCINETU) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SESSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SESSION
 (
   CODESESS CHAR(32) NOT NULL  ,
   CODEFORM CHAR(32) NOT NULL  ,
   NOMSESS CHAR(32) NULL  ,
   DATEDEBUT CHAR(32) NULL  ,
   DATEFIN CHAR(32) NULL  
   , PRIMARY KEY (CODESESS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SESSION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SESSION_FORMATION
     ON SESSION (CODEFORM ASC);

# -----------------------------------------------------------------------------
#       TABLE : FORMATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATION
 (
   CODEFORM CHAR(32) NOT NULL  ,
   TITREFORM CHAR(32) NULL  ,
   DUREEFORM CHAR(32) NULL  ,
   PRIXFORM CHAR(32) NULL  
   , PRIMARY KEY (CODEFORM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EST_INSCRIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EST_INSCRIT
 (
   CODESESS CHAR(32) NOT NULL  ,
   NUMCINETU CHAR(32) NOT NULL  ,
   TYPECOURS CHAR(32) NULL  
   , PRIMARY KEY (CODESESS,NUMCINETU) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EST_INSCRIT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EST_INSCRIT_SESSION
     ON EST_INSCRIT (CODESESS ASC);

CREATE  INDEX I_FK_EST_INSCRIT_ETUDIANT
     ON EST_INSCRIT (NUMCINETU ASC);

# -----------------------------------------------------------------------------
#       TABLE : APPARTIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPARTIENT
 (
   CODEFORM CHAR(32) NOT NULL  ,
   CODESPEC CHAR(32) NOT NULL  
   , PRIMARY KEY (CODEFORM,CODESPEC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPARTIENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPARTIENT_FORMATION
     ON APPARTIENT (CODEFORM ASC);

CREATE  INDEX I_FK_APPARTIENT_SPECIALITÉ
     ON APPARTIENT (CODESPEC ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE SESSION 
  ADD FOREIGN KEY FK_SESSION_FORMATION (CODEFORM)
      REFERENCES FORMATION (CODEFORM) ;


ALTER TABLE EST_INSCRIT 
  ADD FOREIGN KEY FK_EST_INSCRIT_SESSION (CODESESS)
      REFERENCES SESSION (CODESESS) ;


ALTER TABLE EST_INSCRIT 
  ADD FOREIGN KEY FK_EST_INSCRIT_ETUDIANT (NUMCINETU)
      REFERENCES ETUDIANT (NUMCINETU) ;


ALTER TABLE APPARTIENT 
  ADD FOREIGN KEY FK_APPARTIENT_FORMATION (CODEFORM)
      REFERENCES FORMATION (CODEFORM) ;


ALTER TABLE APPARTIENT 
  ADD FOREIGN KEY FK_APPARTIENT_SPECIALITÉ (CODESPEC)
      REFERENCES SPECIALITÉ (CODESPEC) ;

