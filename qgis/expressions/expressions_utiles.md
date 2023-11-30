---
title: expressions_utiles
layout: default
nav_order: 3
description: ""
has_children: true
has_toc: true
parent: qgis
---

TODO :

 - [x] Ajouter fichier a mettre dans 

## Documentation
https://docs.3liz.org/formation-qgis-expressions/


## Variables

$geometry
@geometry
geometry()


## Expressions

### Filter parent relation


### aggregate
aggregate(layer:='v_entites_ora_externe', aggregate:='max', expression:="nom", filter:=intersects( $geometry, geometry(@parent) ) )


aggregate(layer:='v_entites_ora_externe', aggregate:='concatenate', expression:="nom", filter:=intersects( $geometry, geometry(@current_parent_geometry ) ) )
 

aggregate( 
    layer:='v_entites_ora_externe',
    aggregate:='concatenate',
    expression:="nom",
    filter:=intersects( $geometry, geometry( @feature ) )
)

aggregate( 
    layer:='v_entites_ora_externe',
    aggregate:='concatenate',
    expression:="nom",
    filter:=intersects( $geometry, geometry( @parent ) )
)

aggregate(
    layer:='plaques_pop_reptile',
    aggregate:='count',
    expression:="num_plaque",
    filter:= "site" = attribute(@parent,'site')  
) 