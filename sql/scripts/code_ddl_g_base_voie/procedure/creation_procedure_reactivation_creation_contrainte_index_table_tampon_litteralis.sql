/*
Réactivation des contraintes et recréation des index des tables tampon du projet LITTERALIS dans le cadre de leur remplissage
*/
CREATE OR REPLACE PROCEDURE REACTIVATION_CREATION_CONTRAINTE_INDEX_TABLE_TAMPON_LITTERALIS AS
BEGIN
    -- Objectif : réactiver toutes les contraintes et recréer tous les index des tables tampon du projet LITTERALIS.
    
-- Réactivation des contraintes
--EXECUTE IMMEDIATE 'ALTER TABLE G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE ENABLE CONSTRAINT TA_TAMPON_LITTERALIS_ADRESSE_FID_VOIE_FK';

-- Recréation des index
-- TA_TAMPON_LITTERALIS_ADRESSE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=POINT, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_CODE_POINT_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(CODE_POINT) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_CODE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(CODE_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_NATURE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(NATURE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_LIBELLE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(LIBELLE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_NUMERO_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(NUMERO) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ADRESSE_REPETITION_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ADRESSE(REPETITION) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_CORRESPONDANCE_DOMANIALITE_CLASSEMENT
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_CORRESPONDANCE_DOMANIALITE_CLASSEMENT_DOMANIALITE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_CORRESPONDANCE_DOMANIALITE_CLASSEMENT(DOMANIALITE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_CORRESPONDANCE_DOMANIALITE_CLASSEMENT_CLASSEMENT_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_CORRESPONDANCE_DOMANIALITE_CLASSEMENT(CLASSEMENT) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_SECTEUR
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_SECTEUR_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTIPOLYGON, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_SECTEUR_NOM_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_SECTEUR(NOM) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_TERRITOIRE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TERRITOIRE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TERRITOIRE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTIPOLYGON, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TERRITOIRE_NOM_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TERRITOIRE(NOM) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_TRONCON
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTILINE, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_CODE_TRONCON_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(CODE_TRONC) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_CLASSEMENT_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(CLASSEMENT) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_ID_VOIE_DROITE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(ID_VOIE_DROITE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_ID_VOIE_GAUCHE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(ID_VOIE_GAUCHE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_CODE_INSEE_VOIE_DROITE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(CODE_INSEE_VOIE_DROITE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_CODE_INSEE_VOIE_GAUCHE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(CODE_INSEE_VOIE_GAUCHE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_NOM_VOIE_DROITE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(NOM_VOIE_DROITE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_TRONCON_NOM_VOIE_GAUCHE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_TRONCON(NOM_VOIE_GAUCHE) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_UNITE_TERRITORIALE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_UNITE_TERRITORIALE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_UNITE_TERRITORIALE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTIPOLYGON, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_UNITE_TERRITORIALE_NOM_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_UNITE_TERRITORIALE(NOM) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_VOIE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTILINE, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_CODE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(CODE_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_NOM_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(NOM_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_CODE_INSEE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(CODE_INSEE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_ID_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(ID_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_COTE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE(COTE_VOIE) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTILINE, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE_CODE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE(CODE_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE_NOM_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE(NOM_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE_CODE_INSEE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_VOIE_ADMINISTRATIVE(CODE_INSEE) TABLESPACE G_ADT_INDX';

-- TA_TAMPON_LITTERALIS_ZONE_AGGLOMERATION
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_AGGLOMERATION_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_AGGLOMERATION(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTIPOLYGON, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';

-- TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_SIDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(GEOMETRY) INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2 PARAMETERS(''sdo_indx_dims=2, layer_gtype=MULTILINE, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP'')';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_CODE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(CODE_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_CATEGORIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(CATEGORIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_COTE_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(COTE_VOIE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_CODE_INSEE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(CODE_INSEE) TABLESPACE G_ADT_INDX';
EXECUTE IMMEDIATE 'CREATE INDEX TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE_ID_VOIE_IDX ON G_BASE_VOIE.TA_TAMPON_LITTERALIS_ZONE_PARTICULIERE(ID_VOIE) TABLESPACE G_ADT_INDX';

-- En cas d'erreur une exception est levée et un rollback effectué, empêchant ainsi toute modification.
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' L''erreur ' || SQLCODE || 'est survenue. ' || SQLERRM(SQLCODE));
END;