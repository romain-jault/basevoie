/*
Table de sauvegarde du projet H, créée le 08/02/2023 à 10h00, de la table TEMP_H_SEUIL_VERIFICATION servant à vérifier/corriger les relations seuils/tronçons.
*/
/*
DROP TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE CASCADE CONSTRAINTS;
DELETE FROM USER_SDO_GEOM_METADATA WHERE TABLE_NAME = 'G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE';
COMMIT;
*/
-- 1. Création de la table
CREATE TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE AS(
	SELECT
		objectid,
	    geom,
	    code_insee,
	    fid_troncon,
        fid_etat_verification,
        fid_agent_verification,
        doute,
        commentaire
	FROM
		G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION
);

-- 2. Création des commentaires sur la table et les champs
COMMENT ON TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE IS 'Table de sauvegarde du projet H, créée le 08/02/2023 à 10h00, de la table TEMP_H_SEUIL_VERIFICATION servant à vérifier/corriger les relations seuils/tronçons.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.objectid IS 'Clé primaire de la table identifiant chaque seuil.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.geom IS 'Géométrie de type point de chaque seuil présent dans la table.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.code_insee IS 'Code INSEE de chaque seuil calculé à partir du référentiel des communes G_REFERENTIEL.MEL_COMMUNE_LLH.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.fid_troncon IS 'Clé étrangère vers la table TEMP_H_TRONCON permettant d''associer un troncon à un ou plusieurs seuils.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.fid_etat_verification IS 'Clé étrangère vers la table TEMP_H_LIBELLE permettant de savoir si le seuil a été vérifié ou non (vérification seuil/tronçon).';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.fid_agent_verification IS 'Clé étrangère vers la table TEMP_H_AGENT permettant de diviser les seuils à vérifier entre photo-interprètes.';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.doute IS 'Champ permettant d''indiquer au photo-interprète s''il y a une question, une doute sur un seuil (valeur 0 : aucun doute ; valeur 0 : doute).';
COMMENT ON COLUMN G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE.commentaire IS 'Champ permettant au photo-interprète d''indiquer son doute ou sa question sur le seuil, justifiant le changement de la valeur du champ doute.';

-- 3. Création de la clé primaire et des autres contraintes
ALTER TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE 
ADD CONSTRAINT TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_PK 
PRIMARY KEY("OBJECTID") 
USING INDEX TABLESPACE "G_ADT_INDX";

ALTER TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE
ADD CONSTRAINT TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_FID_ETAT_VERIFICATION_FK 
FOREIGN KEY (fid_etat_verification)
REFERENCES G_BASE_VOIE.TEMP_H_LIBELLE (objectid);

ALTER TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE
ADD CONSTRAINT TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_FID_AGENT_VERIFICATION_FK 
FOREIGN KEY (fid_agent_verification)
REFERENCES G_BASE_VOIE.TEMP_H_AGENT (numero_agent);

-- 4. Création des métadonnées spatiales
INSERT INTO USER_SDO_GEOM_METADATA(
    TABLE_NAME, 
    COLUMN_NAME, 
    DIMINFO, 
    SRID
)
VALUES(
    'TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE',
    'GEOM',
    SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X', 684540, 719822.2, 0.005),SDO_DIM_ELEMENT('Y', 7044212, 7078072, 0.005)), 
    2154
);

-- 5. Création de l'index spatial sur le champ geom
CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_SIDX
ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(GEOM)
INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2
PARAMETERS('sdo_indx_dims=2, layer_gtype=POINT, tablespace=G_ADT_INDX, work_tablespace=DATEMP_H_TEMP');

-- 6. Création des clés étrangères
ALTER TABLE G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE
ADD CONSTRAINT TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_FID_TRONCON_FK
FOREIGN KEY (fid_troncon)
REFERENCES G_BASE_VOIE.TEMP_H_TRONCON(objectid);

-- 7. Création des index sur les clés étrangères et autres
CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_FID_TRONCON_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(fid_troncon)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_CODE_INSEE_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(code_insee)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_DOUTE_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(doute)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_COMMENTAIRE_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(commentaire)
    TABLESPACE G_ADT_INDX;
    
CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_AVANCEE_VERIFICATION_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(fid_etat_verification, doute)
    TABLESPACE G_ADT_INDX;
    
CREATE INDEX TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE_AVANCEE_VERIFICATION_AGENT_IDX ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE(fid_etat_verification, doute, fid_agent_verification)
    TABLESPACE G_ADT_INDX;

-- 8. Affectation du droit de sélection sur les objets de la table aux administrateurs
GRANT SELECT ON G_BASE_VOIE.TEMP_H_SEUIL_VERIFICATION_SAUVEGARDE TO G_ADMIN_SIG;

/

