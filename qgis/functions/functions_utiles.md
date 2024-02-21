---
title: functions_utiles
layout: default
nav_order: 3
description: ""
has_children: true
has_toc: true
parent: qgis
---


## Documentation

https://gist.github.com/mdouchin/cfa0e37058bcf102ed490bc59d762042


```
-- Allow to list all layers with no spatial index
-- To get the list
-- SELECT * FROM create_missing_spatial_indexes(True);
-- To create automatically the missing spatial indexes
-- SELECT * FROM create_missing_spatial_indexes(False);

DROP FUNCTION IF EXISTS create_missing_spatial_indexes();
DROP FUNCTION IF EXISTS create_missing_spatial_indexes(  BOOLEAN );
CREATE OR REPLACE FUNCTION create_missing_spatial_indexes(simulate BOOLEAN DEFAULT FALSE)
RETURNS TABLE (
    schemaname text, tablename text, fieldname text
) AS
$BODY$
DECLARE sql_text TEXT;
DECLARE sql_template TEXT;
DECLARE sch TEXT;
DECLARE tab TEXT;
DECLARE att TEXT;
DECLARE rec RECORD;
BEGIN

    FOR rec IN
        SELECT nspname, relname, attname
        FROM
        (
            SELECT
            n.nspname,
            c.relname,
            c.oid AS relid,
            a.attname,
            a.attnum
            FROM pg_attribute a
            INNER JOIN pg_class c ON (a.attrelid=c.oid)
            INNER JOIN pg_type t ON (a.atttypid=t.oid)
            INNER JOIN pg_namespace n ON (c.relnamespace=n.oid)
            WHERE t.typname='geometry'
            AND   c.relkind='r'
        ) g
        LEFT JOIN pg_index i ON (g.relid = i.indrelid AND g.attnum = ANY(i.indkey))
        WHERE i IS NULL
    LOOP
        schemaname := rec.nspname;
        tablename := rec.relname;
        fieldname := rec.attname;

        IF NOT simulate THEN
            sql_template := 'CREATE INDEX ON "%s"."%s" USING GIST ("%s")';
            sql_text := format(sql_template, schemaname, tablename, fieldname);
            RAISE NOTICE '%', sql_text;
            EXECUTE sql_text;
        END IF;

        RETURN NEXT;

    END LOOP;

END
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
```
