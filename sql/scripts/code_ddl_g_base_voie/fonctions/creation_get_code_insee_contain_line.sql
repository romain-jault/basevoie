
CREATE OR REPLACE FUNCTION GET_CODE_INSEE_CONTAIN_LINE(v_table_name VARCHAR2, v_geometry SDO_GEOMETRY) RETURN CHAR
/*
Cette fonction a pour objectif de récupérer le code INSEE de la commune dans laquelle se situe le point médian d'un objet linéaire.
La variable v_table_name doit contenir le nom de la table dont on veut connaître le code INSEE des objets.
La variable v_geometry doit contenir le nom du champ géométrique de la table interrogée.
*/
    DETERMINISTIC
    As
    v_code_insee CHAR(8);
    BEGIN
        SELECT 
            TRIM(b.code_insee)
            INTO v_code_insee 
        FROM 
            G_REFERENTIEL.MEL_COMMUNE b, 
            USER_SDO_GEOM_METADATA m
        WHERE
            m.table_name = v_table_name
            AND SDO_CONTAINS(
                    b.geom,
                    SDO_LRS.CONVERT_TO_STD_GEOM(
                        SDO_LRS.LOCATE_PT(
                                        SDO_LRS.CONVERT_TO_LRS_GEOM(v_geometry,m.diminfo),
                                        SDO_GEOM.SDO_LENGTH(v_geometry,m.diminfo)/2
                        )
                    )
                )='TRUE';
        RETURN v_code_insee;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'error';
    END GET_CODE_INSEE_CONTAIN_LINE;

/
