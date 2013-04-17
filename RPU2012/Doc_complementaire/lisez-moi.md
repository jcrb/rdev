RPU 2012 Doc complémentaire
========================================================

Docmentation complémentaire pour enrichir le rapport annuel:

- *SAU_finess_20130409.csv* extrait du fichier Finess pour l'Alsace, listant l'ensemble des services labellisé médecine d'urgence. Outre les renseignements administratifs (adresse, tel, fax) contient également un descriptif des équipeùents lourds et des différentes spécialités. (accédé le 2013-04-09)

- *SAU_finess_simple_20130409.csv*  extrait du fichier Finess pour l'Alsace, listant l'ensemble des services labellisé médecine d'urgence. L'extraction se limite aux données administratives simplifiées

```r
file <- "~/Documents/Resural/Stat Resural/RPU_2012/Doc complémentaire"
setwd(file)
data <- read.csv("SAU_finess_simple_20130409.csv", header = TRUE, sep = ";", 
    encoding = "UTF8")
names(data)
```

```
##  [1] "Numero.FINESS"           "SIRET"                  
##  [3] "APE"                     "Raison.sociale"         
##  [5] "Complement.distribution" "Adresse"                
##  [7] "Lieudit.BP"              "Code.postal"            
##  [9] "Libelle.routage"         "Tel"                    
## [11] "Fax"
```

