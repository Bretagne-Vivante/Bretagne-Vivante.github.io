---
title: convention_nommage
layout: default
nav_order: 2
description: "Convention Nommage Métadonnées Geonature"
# parent: geonature
---
# Convention Nommage Métadonnées 

## Exemples

Pour les CA :
Atlas de la biodiversité (ABC/ABI) de Nom-Commune (numéro dpt) + UUID
Exemple : Atlas de la biodiversité (ABC/ABI) de Arzal (56) | UUID : 1505febf-d35f-41d0-bde9-f894a3ec5d83 
-----
Pour les JDD :
il faut remplir le nom du JDD (version longue et claire )
+ le nom court du JDD (version courte sans espace et sans majuscule)
 
Attention, pour les JDD provenant de Faune et Serena, 
merci de ne pas changer le nom court déjà existant sous peine de casser l'intégration continue.


dep_site_annee_taxo → 56_ENS_Lorient_Agglo
dep_site_annee_taxo → 35_ENS_NomSite_reptile
dep_protocole_taxo → exemple : 44_pop_reptile
bzh_
bzh_histo_
dep_inventaire_
abc_nomcommune_ → exemple : 


## Conseil de mise en pratique

• Libellé (nom) du cadre d’acquisition.
La rédaction du libellé doit être claire et compréhensible par le plus grand nombre et porteur d’un maximum d’informations. Certains termes doivent êtres proscrits comme le terme « données ». Le terme « cadre » est à éviter pour des raisons tautologiques. On pourra être synthétique en donnant l’intitulé du programme ou du projet associé au cadre d’acquisition et en rappeler le maître d’ouvrage (exemple : « Inventaires des Odonates des propriétés du Conseil général [XX] »). Dans le cas d’un projet d’une personne bénévole réalisé avec des fonds propres, on pourra rédiger le nom du cadre d’acquisition ainsi : « Etudes naturalistes de [NOM Prénom] ».

• Libellé du jeu de données.
Le terme « données » est à éviter pour des raisons tautologiques. Le terme « occurrence » est aussi à éviter mais peut éventuellement être utilisé, associé à un nom vernaculaire du taxon cible de type « occurrence floristique » ou « occurrence de Lépidoptères ». Privilégier des titres informatifs : Suivi des XX, Cartographies des stations de xx, Observatoire des xx, Comptage des xx… Dans le cas d’un programme ou d’un projet ne produisant qu’un seul jeu de données, on pourra éventuellement intégrer dans le libellé long du jeu de données, le lien avec le producteur. Dans le cas où le regroupement des données est lié à un paramètre particulier, celui-ci peut aussi être intégré dans le libellé long du jeu de données, par exemple « Observations faunistiques de l’association [XX] réalisées par des bénévoles » ou « Suivi des populations de papillons par transects ».

### CONSEILS à appliquer autant que possible :
Il est conseillé de grouper en CA puis en JDD les données qui :
• ont été acquises dans le même objectif (même programme, projet ou étude). On associe le ou les JDD(s) à un même CA ;
• ont été financées/commandées par les mêmes structures (le cas échéant elles n’ont pas été financées) ;ou plusieurs structures se sont associées pour financer un même programme (ou ses déclinaisons). Onassocie le ou les JDD(s) à un même CA ;
• ont été collectées selon le même protocole (plan d’échantillonnage, méthodes et techniques). On associe les données à un même JDD ;
• possèdent le même profil de données. On associe les données à un même JDD

### ERREURS  éviter autant que possible :
• La séparation selon une année ou une période de collecte de données (ou de publication des donnéesdans le cadre de données bibliographiques), si cette distinction n’est pas liée à un changement deprotocole ou à un changement de maîtrise d’ouvrage/d’œuvre ou d’opérateur.
• La séparation des taxons qui sont observés selon un même protocole. Cette séparation (par exemple unJDD pour les Lycaenidae et un autre pour les Nymphalidae dans un suivi des papillons par unité detemps d’observation) fait perdre l’information de la présence d’une communauté d’espèce, et lapossibilité d’en déduire des absences.


## Ressources

### Tuto complet
Lien Tuto Canva
https://www.canva.com/design/DAFbYS1iFN8/L_jarzRlzMMkDOrC5b3onw/edit

### DOC INPN
https://inpn.mnhn.fr/docs-web/docs/download/244790

### ABC / ABI
Les ABC/ABI sont a récupérer depuis https://abc.naturefrance.fr/


