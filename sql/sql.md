---
title: sql
layout: default
description: ""
has_children: true
has_toc: true
---
# SQL

Convention de nommage a respecter pour les noms des tables et des champs :

(il n'y a pas de limite de taille pour le nom du champs donc faites en sorte qu'il soit compréhensible par tous)

    sans accent
    sans espace
    en minuscule

exemple : rnr_venec_gestion

Préfixes a utiliser dans les cas spéciaux
(tout en respectant les règles ci-dessus):

Pour une vue (couche virtuelle) merci de mettre v_nom_du_machin


Type de Champs a utiliser:

    UUID pour l'identifiant unique (mettre format text sur qgis)
    Numeric pour des chiffres a virgules
    Entier (64 bits) /Integer pour des chiffres ronds
    Text pour du texte
    DATE pour la date
    TIME pour l'heure
    TIMESTAMP pour la date + l'heure
    JSONB pour le json


Type de Géométrie :
( a choisir en fonction du besoin)

    Point
    MultiPoint
    Line
    MultiLine
    Polygon
    MultiPolygon
## Formation


{:toc}
