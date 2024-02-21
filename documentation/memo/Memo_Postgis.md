---
title: memo_postgis
layout: default
nav_order: 3
description: ""
parent: memo
---

/***************************************************
##   MEMO Functions Postgis  *
***************************************************/
```
-- Générer automatiquement la surface d'un geom + geom 4326
-- min v13 postgres

CREATE table SCHEMA.TABLE (
 id serial PRIMARY KEY,
 geom geometry(Point, 2154) NULL,
 geom geometry(polygon, 2154) NULL,  
 geom_4326 geometry(polygon, 4326) GENERATED ALWAYS AS (
        ST_Transform(geom, 4326)
    ) STORED,
 surface FLOAT GENERATED ALWAYS AS (
        ST_Area(geom)
    ) STORED
);
-- Analyse complète d'un champs

SELECT 
geom,
ST_SRID(geom),
ST_GeometryType(geom),
ST_IsValid(geom),
ST_IsValidReason(geom),
```

/***************************************************
##  Functions Postgis infos geom   *
***************************************************/
```
----------
-- Détection du SRID
integer ST_SRID(geometry g1);

> returns the spatial reference identifier for the ST_Geometry as defined in spatial_ref_sys table


----------
-- Détection de type de geom
ST_GeometryType(geometry g1);

--Compter le nombre d'observations par type de géometrie
SELECT count(*), st_geometrytype(the_geom_4326)
FROM gn_synthese.synthese s 
GROUP BY st_geometrytype(the_geom_4326);

```

/***************************************************
##   Correction du geom  *
***************************************************/
```
ST_IsValid
ST_IsValidReason
ST_IsValidDetail

----------
-- ST_IsValidReason du geom
SELECT ST_IsValidReason(geom)
FROM tmp.ens35 ens 

----------
-- ST_IsValidDetail du SRID
SELECT ST_IsValidDetail(geom)
FROM tmp.ens35 ens 

----------
-- Transformation du SRID

ST_MakeValid

----------
-- Exemple
SELECT   id ,ST_IsValid(geom), ST_IsValidReason(geom), ST_IsValidDetail(geom)
FROM ora_oncb.oncb_territoire
where ST_IsValid (geom) is false

SELECT   id	 , ST_MakeValid(geom), ST_IsValidReason(ST_MakeValid(geom))
FROM ora_oncb.oncb_territoire
where ST_IsValid (geom) is false

update ora_oncb.oncb_territoire
set geom = ST_MakeValid(geom)
where ST_IsValid (geom) is false

-- Astuce -> ST_Buffer
SELECT   id_pk	 ,geom, ST_MakeValid(st_buffer(geom,20)), ST_IsValidReason(ST_MakeValid(st_buffer(geom,0)))
FROM ora_oncb.corr_territoire_oncb_V1_save
where ST_IsValid (geom) is false
```

/***************************************************
##   Functions Postgis transformation geom  *
***************************************************/
```
----------
-- Transformation du SRID
geometry ST_Transform(geometry g1, integer srid);


ST_IsValidReason

----------
-- Transformation d'un geom polygon en multi_polygon
geometry ST_MakePolygon(geometry linestring);
Creates a Polygon formed by the given shell and optional array of holes. Input geometries must be closed LineStrings (rings).

---
geometry ST_Polygon(geometry lineString, integer srid);
Returns a polygon built from the given LineString and sets the spatial reference system from the srid.
(multi(the_geom) WHERE issimple(the_geom)=false)

----------
-- Transformation d'un geom polygon en point via centroid
st_makepoint
ST_Point 
ST_Centroid

ST_SetSRID( ST_MakePoint(3,4), 4326 ) -- explicit cast and srid
```
/***************************************************
##   Croisement GEO  *
***************************************************/
```
boolean ST_Contains(geometry geomA, geometry geomB);
ST_Contains(geometry Grand, geometry Petit);

Returns TRUE if geometry B is completely inside geometry A

--
st_Within
--

st_Intersects
--

ST_Covers
--

ST_Touches

```
/***************************************************
##   Croisement GEO  *
***************************************************/
```

-- La surface d'un polygone
round((ST_area(st_union(edi.geom))/1000)::numeric , 2) as superficie_km 
--voir si round(sum(st_area(a.geom))) n'est pas plus rapide

-- Le périmètre d'un polygone
round((ST_Perimeter(st_union(edi.geom))/1000)::numeric , 2) as perimetre_km 



```

