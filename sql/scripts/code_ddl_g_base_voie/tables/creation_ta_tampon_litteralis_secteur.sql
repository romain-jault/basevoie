/*
Création de la table TA_TAMPON_LITTERALIS_SECTEUR - de la structure tampon du projet LITTERALIS - contenant les secteurs du service voirie qui ont été modifiés pour être topologiques entre eux et par rapport aux communes du référentiel communal de la MEL présent sur G_REFERENTIEL.
*/
/*
DROP TABLE G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR CASCADE CONSTRAINTS;
DELETE FROM USER_SDO_GEOM_METADATA WHERE TABLE_NAME = 'TA_TAMPON_LITTERALIS_SECTEUR';
COMMIT;
*/
-- 1. Création de la table dans laquelle insérer les seuils affecter à un tronçon disposant d'une seule domanialité et affecté à une seule voie
CREATE TABLE G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR(
    GEOMETRY SDO_GEOMETRY,
    OBJECTID NUMBER(38,0) GENERATED BY DEFAULT AS IDENTITY(START WITH 1 INCREMENT BY 1),
    NOM VARCHAR2(254 BYTE)
);

-- 2. Création des commentaires sur la table et les champs
COMMENT ON TABLE G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR IS 'Table tampon - de la structure tampon du projet LITTERALIS - contenant les secteurs du service voirie qui ont été modifiés pour être topologiques entre eux et par rapport aux communes du référentiel communal de la MEL présent sur G_REFERENTIEL.';
COMMENT ON COLUMN G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR.GEOMETRY IS 'Géométrie de type multipolygone.';
COMMENT ON COLUMN G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR.NOM IS 'Nom de chaque secteur.';

-- 3. Création de la clé primaire
ALTER TABLE G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR
ADD CONSTRAINTS TA_TAMPON_LITTERALIS_SECTEUR_PK
PRIMARY KEY(OBJECTID)
USING INDEX TABLESPACE "G_ADT_INDX";

-- 4. Création des métadonnées spatiales
INSERT INTO USER_SDO_GEOM_METADATA(
    TABLE_NAME, 
    COLUMN_NAME, 
    DIMINFO, 
    SRID
)
VALUES(
    'TA_TAMPON_LITTERALIS_SECTEUR',
    'GEOMETRY',
    SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X', 684540, 719822.2, 0.005),SDO_DIM_ELEMENT('Y', 7044212, 7078072, 0.005)), 
    2154
);
COMMIT;

-- 5. Création de l'index spatial sur le champ geom
CREATE INDEX TA_TAMPON_LITTERALIS_SECTEUR_SIDX
ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR(GEOMETRY)
INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2
PARAMETERS('sdo_indx_dims=2, layer_gtype=MULTIPOLYGON, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP');

CREATE INDEX TA_TAMPON_LITTERALIS_SECTEUR_NOM_IDX
ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR(NOM)
TABLESPACE G_ADT_INDX;

-- 6. Affection des droits
GRANT SELECT ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR TO G_ADMIN_SIG;

/

