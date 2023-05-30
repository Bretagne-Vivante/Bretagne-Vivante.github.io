---
title: attribution_droits
layout: default
nav_order: 3
description: ""
parent: memo
---


/***************************************************
*   Droits   *
***************************************************/

SELECT donner_droits_user( _schema_name text, _user_name text) ;
SELECT donner_droits_lecteur() ;
SELECT donner_droits_contributeur() ; 

--------------------
-----
CREATE ROLE lecteur PASSWORD 'mdp_lecteur' WITH CONNECT LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOCREATEUSER INHERIT ;

CREATE ROLE contributeur PASSWORD 'mdp_contributeur' WITH CONNECT LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOCREATEUSER ;

CREATE ROLE stagiaire  WITH CONNECT LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE NOCREATEUSER ;

create user prenom_nom PASSWORD 'prenom_nom' IN ROLE lecteur, contributeur LOGIN INHERIT ;
-----

CREATE ROLE stagiaire 
LOGIN
NOSUPERUSER
NOCREATEDB
NOCREATEROLE
INHERIT
NOREPLICATION
NOBYPASSRLS
CONNECTION LIMIT -1
VALID UNTIL '2023-10-01 02:00:00+01';

create user prenom_nom PASSWORD 'prenom_nom' IN ROLE stagiaire LOGIN INHERIT ;

--------------------
-----
-- donner_droits_user

CREATE OR REPLACE FUNCTION donner_droits_user( _schema_name text, _user_name text) 
RETURNS void 
AS 
$BODY$ 
DECLARE
    sch text;
BEGIN
    EXECUTE format($$ GRANT CREATE, USAGE ON SCHEMA %I TO %I $$, _schema_name, _user_name);
    EXECUTE format($$ GRANT all privileges ON ALL SEQUENCES IN SCHEMA %I TO %I $$, _schema_name, _user_name);
    EXECUTE format($$ GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA %I TO %I $$, _schema_name, _user_name);

    EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT, INSERT, UPDATE  ON TABLES TO %I $$, _schema_name, _user_name);
    EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON SEQUENCES TO %I $$, _schema_name, _user_name);

END;

$BODY$ 
 LANGUAGE PLPGSQL;

--------------------
-----
-- donner_droits_lecteur
CREATE OR REPLACE FUNCTION donner_droits_lecteur() 
RETURNS void 
AS 
$BODY$ 
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_toast' 
    and nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    and nspname != 'pg_statistic' and nspname != 'pg_catalog'
    and nspname != 'information_schema'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO lecteur $$, sch);
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I to lecteur $$, sch);
        EXECUTE format($$ GRANT SELECT ON ALL SEQUENCES IN SCHEMA %I TO lecteur $$, sch);
        EXECUTE format($$ GRANT SELECT ON ALL TABLES IN SCHEMA %I TO lecteur $$, sch);

        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON TABLES TO lecteur $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON SEQUENCES TO lecteur $$, sch);
    END LOOP;
END;

$BODY$ 
 LANGUAGE PLPGSQL;

--------------------
-----
-- donner_droits_contributeur
CREATE OR REPLACE FUNCTION donner_droits_lecteur() 
RETURNS void 
AS 
$BODY$ 
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_toast' 
    and nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    and nspname != 'pg_statistic' and nspname != 'pg_catalog'
    and nspname != 'information_schema'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO contributeur $$, sch);
        EXECUTE format($$ GRANT all privileges ON ALL SEQUENCES IN SCHEMA %I TO contributeur $$, sch);
        EXECUTE format($$ GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA %I TO contributeur $$, sch);

        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT, INSERT, UPDATE  ON TABLES TO contributeur $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT SELECT ON SEQUENCES TO contributeur $$, sch);
    END LOOP;
END;

$BODY$ 
LANGUAGE PLPGSQL;

--------------------
-----
---
CREATE OR REPLACE FUNCTION donner_droits_admin() 
RETURNS void 
AS 
$BODY$ 
DECLARE
    sch text;
BEGIN
    FOR sch IN SELECT nspname FROM pg_namespace where nspname != 'pg_toast' 
    and nspname != 'pg_temp_1' and nspname != 'pg_toast_temp_1'
    and nspname != 'pg_statistic' and nspname != 'pg_catalog'
    and nspname != 'information_schema'
    LOOP
        EXECUTE format($$ GRANT USAGE ON SCHEMA %I TO contributeur $$, sch);
        EXECUTE format($$ GRANT all privileges ON ALL SEQUENCES IN SCHEMA %I TO admin $$, sch);
        EXECUTE format($$ GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %I TO admin $$, sch);

        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT ALL PRIVILEGES  ON TABLES TO admin $$, sch);
        EXECUTE format($$ ALTER DEFAULT PRIVILEGES IN SCHEMA %I GRANT ALL PRIVILEGES ON SEQUENCES TO admin $$, sch);
    END LOOP;
END;

$BODY$ 
LANGUAGE PLPGSQL;

--------------------
-----
-- Vérification des droits 

SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_name='table'

SELECT r.rolname, r.rolsuper, r.rolinherit,
r.rolcreaterole, r.rolcreatedb, r.rolcanlogin,
r.rolconnlimit, r.rolvaliduntil,
ARRAY(SELECT b.rolname
FROM pg_catalog.pg_auth_members m
JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
WHERE m.member = r.oid) as memberof
, r.rolreplication
, r.rolbypassrls
FROM pg_catalog.pg_roles r
WHERE r.rolname !~ '^pg_'
ORDER BY 1;

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'lecteur'

SELECT grantee AS user, CONCAT(table_schema, '.', table_name) AS table,
CASE
WHEN COUNT(privilege_type) = 7 THEN 'ALL'
ELSE ARRAY_TO_STRING(ARRAY_AGG(privilege_type), ', ')
END AS grants
FROM information_schema.role_table_grants
GROUP BY table_name, table_schema, grantee;

SELECT * FROM pg_roles;