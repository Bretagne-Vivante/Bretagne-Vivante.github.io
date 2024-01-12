---
title: memo geonature
layout: default
nav_order: 3
description: "index"
parent: memo
---

# memo geonature

## BACK

## LOGS
```
cd var/log/geonature
cd var/log/usershub
cd var/log/taxhub

cd var/log/apache2/
ls -lrt

tail -n 1000 geonature.log
```
## Activer Venv 
```
cd
source geonature/backend/venv/bin/activate

## Modifier la config
cd 
nano geonature/config/geonature_config.toml
geonature update_configuration
deactivate
```
### Apache
```
sudo apachectl -S
sudo service apache2 status
sudo service apache2 restart
```
## database cmd
```
geonature --help
geonature db status
geonature db autoupgrade
geonature db history
geonature db revision --rev-id e39d16e62810 

geonature db upgrade import@head
geonature db downgrade import@head

geonature db upgrade ref_sensitivity_inpn
```
## relance des différents services :
```
sudo service apache2 restart


sudo supervisorctl reload
sudo service postgresql restart

sudo systemctl restart geonature
sudo systemctl restart taxhub
sudo systemctl restart usershub
sudo systemctl restart geonature-worker

sudo /etc/init.d/postgresql restart
sudo supervisorctl restart all
```
## Version Modules
```
cd
nano geonature/VERSION
nano gn_module_dashboard/VERSION 
nano gn_module_export/VERSION 
nano gn_module_import/VERSION 
nano gn_module_monitoring/VERSION
nano taxhub/VERSION
nano usershub/VERSION
```
## FRONT
### NPM Run Build Front
```
cd
cd geonature/frontend

npm run build -- obsolete

geonature update-configuration

```
### Custom CSS
```
cd
cd geonature/frontend/src/custom/
```
## API

### Stopper les API
```
GeoNature :sudo systemctl stop geonature
TaxHub : sudo systemctl stop taxhub
UsersHub : sudo systemctl stop usershub
```
### start les API
```
GeoNature : sudo systemctl start geonature
TaxHub : sudo systemctl start taxhub
UsersHub : sudo systemctl start usershub
```
## Gérer les référentiels
```
geonature sensitivity refresh-rules-cache
geonature sensitivity update-synthese
```


## admin BDD -> voir l'ensemble des vues et 
### Functions
SELECT proname, prosrc
FROM pg_proc
WHERE pronamespace = 'public'::regnamespace; -- Remplacez 'public' par le schéma où se trouvent vos fonctions

### Vues
SELECT viewname, definition
FROM pg_views
WHERE schemaname = 'public'; -- Remplacez 'public' par le schéma où se trouvent vos vues

### Vues Matérialisées
SELECT matviewname, definition
FROM pg_matviews
WHERE schemaname = 'public';

