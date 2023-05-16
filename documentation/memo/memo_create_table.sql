---
title: create_table
layout: default
nav_order: 3
description: ""
parent: sql
---

------
-- Create

CREATE TABLE reseau2reserves.reserves (
-- Créer un id unique
id_reserve serial PRIMARY KEY,
id int GENERATED ALWAYS AS IDENTITY,
id UUID DEFAULT postgis.uuid_generate_v4() PRIMARY KEY
-- Créer une clé étrangère
id_reserve uuid  references sites(uuid),

code_reserve text,
nom_reserve text,
description_reserve text,
date_creation_reserve text,
geom geometry(Point, 2154) NULL,

created_by text NOT NULL DEFAULT current_user,
created_at timestamp DEFAULT current_timestamp

maj_by text NOT NULL DEFAULT current_user,
maj_at timestamp DEFAULT current_timestamp

);

------
-- Alter

alter table rnms_suivi_oiseaux_nicheurs.releves_hebdo_nid drop column uuid_rlv ;
alter table rnms_suivi_oiseaux_nicheurs.releves_hebdo_nid add column uuid_rlv UUID DEFAULT postgis.uuid_generate_v4() unique PRIMARY key 

------
-- Trigger

 CREATE  FUNCTION update_maj()
RETURNS TRIGGER AS $$
BEGIN
    NEW.maj_at = now();
    NEW.maj_by = current_user;

    RETURN NEW;
END;
$$ language 'plpgsql';
-----

CREATE TRIGGER trig_maj_reserves
    BEFORE UPDATE
    ON
        reseau2reserves.reserves
    FOR EACH ROW
EXECUTE PROCEDURE update_maj();
