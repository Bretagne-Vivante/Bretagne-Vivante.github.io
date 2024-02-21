---
title: file info
layout: default
nav_order: 3
description: ""
has_children: true
has_toc: true
parent: R
---

# Avoir des informations sur un fichier stocké

## Doc
https://www.r-bloggers.com/2023/06/understanding-the-file-info-function-in-r-listing-files-by-date/

https://www.statology.org/r-difftime-function/



## Library conseillées
```

```

## Documentation


## Variables

## Chemin relatif
getwd()
setwd()

> normalizePath(c(R.home(), tempdir()))
[1] "C:\\Program Files\\R\\R-3.1.0"                    
[2] "C:\\Users\\john\\AppData\\Local\\Temp\\RtmpysKuFi"
> normalizePath(c(R.home(), tempdir()), winslash = '/')
[1] "C:/Program Files/R/R-3.1.0"                 
[2] "C:/Users/john/AppData/Local/Temp/RtmpysKuFi"
