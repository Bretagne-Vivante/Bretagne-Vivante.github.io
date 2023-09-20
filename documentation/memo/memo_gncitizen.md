---
title: memo geonature citizen
layout: default
nav_order: 3
description: "index"
parent: memo
---

# memo geonature citizen

# URL

## ADMIN
```
192.168.30.21/api/admin/
/api/admin/
```
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
source gncitizen/backend/.venv/bin/activate

cd gncitizen/backend
python3 -m pip install -r requirements.txt
```

## node 
```
node -v
```
### Apache
```
sudo apachectl -S
sudo service apache2 status
sudo service apache2 restart
```
## relance des différents services :
```
lsof -i tcp:4000
kill -9 112382
kill -15 PROCESS_ID

kill -9 $(lsof -t -i:3000);

npm run build:i18n-ssr && npm run serve:ssr
---
sudo service apache2 restart
sudo supervisorctl reload
sudo service postgresql restart


sudo supervisorctl start gncitizen_front
sudo supervisorctl stop gncitizen_front
sudo supervisorctl restart gncitizen_front

sudo supervisorctl stop gncitizen_api
sudo supervisorctl start gncitizen_api
sudo supervisorctl restart gncitizen_api
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
npm run build:i18n-ssr && npm run serve:ssr
```
### Custom CSS
```
cd
cd geonature/frontend/src/custom/
```
## API

### Stopper les API



# Construction du frontend
```
$ cd gn_citizen/frontend/
$ npm install
$ npm run build
$ cd ..


. ~/.nvm/nvm.sh
nvm use
npm run serve:ssr
```

# Installation des dépendances du backend
```
$ cd backend/
$ poetry install

$ sudo supervisorctl restart citizen_api
```