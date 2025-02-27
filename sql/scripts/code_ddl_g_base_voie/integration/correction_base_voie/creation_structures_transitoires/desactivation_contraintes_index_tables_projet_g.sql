-- Désactivation des contraintes et des index des tables de correction des tronçons disposant d'erreurs de topologie.
-- Désactivation des contraintes
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_PNOM_SAISIE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_PNOM_MODIFICATION_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_VOIE_PHYSIQUE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_VOIE_ADMINISTRATIVE DISABLE CONSTRAINT TEMP_G_VOIE_ADMINISTRATIVE_FID_TYPE_VOIE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_VOIE_ADMINISTRATIVE DISABLE CONSTRAINT TEMP_G_VOIE_ADMINISTRATIVE_FID_PNOM_SAISIE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_VOIE_ADMINISTRATIVE DISABLE CONSTRAINT TEMP_G_VOIE_ADMINISTRATIVE_FID_PNOM_MODIFICATION_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE DISABLE CONSTRAINT TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE_FID_VOIE_PHYSIQUE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE DISABLE CONSTRAINT TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE_FID_VOIE_ADMINISTRATIVE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_PNOM_SAISIE_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_PNOM_MODIFICATION_FK;
ALTER TABLE G_BASE_VOIE.TEMP_G_TRONCON DISABLE CONSTRAINT TEMP_G_TRONCON_FID_ETAT_FK;

-- Suppression des index
DROP INDEX TEMP_G_TRONCON_FID_PNOM_SAISIE_IDX;
DROP INDEX TEMP_G_TRONCON_FID_PNOM_MODIFICATION_IDX;
DROP INDEX TEMP_G_TRONCON_FID_VOIE_PHYSIQUE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_LIBELLE_VOIE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_COMPLEMENT_NOM_VOIE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_CODE_INSEE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_FID_LATERALITE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_FID_PNOM_SAISIE_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_FID_PNOM_MODIFICATION_IDX;
DROP INDEX TEMP_G_VOIE_ADMINISTRATIVE_FID_TYPE_VOIE_IDX;
DROP INDEX TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE_FID_VOIE_ADMINISTRATIVE_IDX;
DROP INDEX TEMP_G_RELATION_VOIE_PHYSIQUE_ADMINISTRATIVE_FID_VOIE_PHYSIQUE_IDX;
DROP INDEX TEMP_G_TRONCON_SIDX;

-- Désactivation des triggers
ALTER TRIGGER B_IUX_TEMP_G_TRONCON_DATE_PNOM DISABLE;

/

