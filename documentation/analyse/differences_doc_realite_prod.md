# Différences entre la documentation et la réalité de la base


## 1. Comparaison entre le MCD du fichier ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf) et la structure en base


### 1.1. Les tables
On retrouve bien les 19 tables dans la base oracle et dans le MCD (p.8 - 9) du fichier ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf).

### 1.2. Les champs

#### Les différences

1. Table *REMARQUES_VOIES*
	Le champ *ID_CATEGORIE_REMARQUE* est présent en base, mais absent du MCD du pdf.

2. Table *VOIEVOI*
	Le champ *genre* est présent en base, mais absent du MCD du pdf.

3. Table *ILTALPU*
	Les champs *URL*, *HTML* sont présents en base, mais absents du MCD du pdf.

4. Table ADMIN_LISTE_FAMILLE_POI
	Le champ *lIB_COURT* est présent en base, mais absent du MCD du pdf.

5. Table *ADMIN_USERS_GESTION_VOIES*
	Le champ *DROIT_GESTION_RUES* est présent en base, mais absent du MCD du pdf.  

Comme on peut le voir ci-dessus il existe quelques différences entre le MCD du fichier ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf) et les tables en base, mais sans grande incidence, puisque ces différences ne portent pas sur des champs de PK ou FK et ne changent pas fondamentalement la structure des tables.
Tous les autres champs des tables en base sont également présents dans le MCD du fichier ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf).


### 1.3. Les contraintes

#### Les clés primaires
Sur les 19 tables, seules 8 disposent de clé primaire (cf. tableau ci-dessous).
|Nom_Table	|Nom_Colonne	|Nom_Contrainte	|Type_Contrainte	|Statut	|Validite	|Nom_Index|
|:----------|:--------------|:--------------|:------------------|:------|:----------|:--------|
|ILTALPU	|CNUMLPU	|PK_ILTALPU	|PRIMARY KEY	|ENABLED	|VALIDATED	|PK_ILTALPU|
|ILTAPTZ	|CNUMPTZ	|PK_ILTAPTZ	|PRIMARY KEY	|ENABLED	|VALIDATED	|PK_ILTAPTZ|
|ILTASEU	|IDSEUI	|PK_ILTASEU	|PRIMARY KEY	|ENABLED	|VALIDATED	|PK_ILTASEU|
|ILTASIT	|IDSEUI	|ILTASIT_PK	|PRIMARY KEY	|ENABLED	|VALIDATED	|ILTASIT_PK|
|ILTASIT	|CNUMTRC	|ILTASIT_PK	|PRIMARY KEY	|ENABLED	|VALIDATED	|ILTASIT_PK|
|ILTATRC	|CNUMTRC	|PK_ILTATRC	|PRIMARY KEY	|ENABLED	|VALIDATED	|PK_ILTATRC|
|REMARQUES_VOIES	|ID_REMARQUE	|PK_REMARQUES_VOIES	|PRIMARY KEY	|ENABLED	|VALIDATED	|PK_REMARQUES_VOIES|
|TYPEVOIE	|CCODTVO	|TYPEVOIE_PK	|PRIMARY KEY	|ENABLED	|VALIDATED	|TYPEVOIE_PK|
|VOIEVOI	|CCOMVOI	|VOIEVOI_PK	|PRIMARY KEY	|ENABLED	|VALIDATED	|VOIEVOI_PK|

Les tables suivantes n'ont donc pas de clé primaire :
|Nom_Table_Sans_PK|
|:----------------|
|ADMIN_LISTE_COTE|
|ILTAFILIA|
|ILTADTN|
|VOIECVT|
|ADMIN_LISTE_FAMILLE_POI|
|ADMIN_LISTE_ORIGINE_POI|
|ADMIN_LISTE_SYMBOLE|
|ADMIN_TABLES_VOIES|
|ADMIN_COL_TABLES_VOIES|
|ADMIN_CONFIG_GESTION_VOIES|
|ADMIN_USERS_GESTION_VOIES|

De plus, la nomenclature n'est pas homogène, puisque le préfixe PK_ devient parfois un suffixe. Cependant, que ce soit en suffixe ou en préfixe la chaîne de caractère "PK" indiquant qu'il s'agit d'une contrainte de clé primaire est toujours présente dans le nom de ces contraintes.  

En outre, toutes les clés primaires de la base voie sont valides et disposent d'un index.

#### Les clés étrangères
Selon la documentation ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf) il existe 12 clés étrangères dans les tables de la base voie :
|Nom_Table	|Nom_Colonne	|Type_Donnees	|Type_Contrainte|
|:----------|:--------------|:--------------|:--------------|
|ILTASEU	|CDCOTE	|varchar(5)	|FK|
|ILTASIT	|IDSEUI	|decimal(22,7)	|FK|
|ILTASIT	|CNUMTRC	|decimal(22,5)	|FK|
|ILTADTN	|CNUMPTZ	|decimal(22,8)	|FK|
|ILTADTN	|CNUMTRC	|decimal(22,5)	|FK|
|VOIECVT	|CCOMVOI	|decimal(22,7)	|FK|
|VOIECVT	|CNUMTRC	|decimal(22,5)	|FK|
|VOIEVOI	|CCODTVO	|char(4)	|FK|
|ILTALPU	|CDSFAMILLE	|varchar(5)	|FK|
|ILTALPU	|CLEF_ORIGINE	|varchar(5)	|FK|
|ILTALPU	|SYMBOLE_LIEU	|varchar(50)	|FK|
|ADMIN_COL_TABLES_VOIES	|TYPE_OBJET	|varchar(20)	|FK|

Or dans la base, il n'existe aucune clé étrangère dans ces tables (cf. ![contraintes_base_voie.tsv](/documentation/analyse/contraintes_base_voie.tsv)), il n'y a donc aucune contrainte d'intégrité, ce qui signifie qu'il peut potentiellement y avoir des doublons ou des valeurs manquantes. Le fait qu'il n'y ait aucune contrainte signifie que *TOUT* dépend de la saisie et de la mise à jour de la donnée par les utilisateurs/gestionnaires. Il n'y a aucune sécurité.

#### Les contraintes d'unicité
Hormis les clés primaires, il n'y a aucune contrainte d'unicité, ce qui est conforme au MCD du fichier ![doc_i2g_dev_application_2013.pdf](/documentation/dynmap/doc_i2g_dev_application_2013.pdf) (cf. ![contraintes_base_voie.tsv](/contraintes_base_voie.tsv)).

#### Les contraintes de Non-nullité
Il existe 70 contraintes de non-nullité c'est-à-dire 70 - 9 clés primaires, soit 61 contraintes en plus que dans le MCD du pdf.
*Il faut regarder si ces contraintes ont été placées à bon escient ou non, ou s'il en manque*.