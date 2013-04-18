# rpu_init.R

# répertoire de travail
setwd("~/Documents/Resural/Stat Resural/RPU_2012")
# source("rpu_init.R")

options(digits=3)

# chargement des librairies
library("RMySQL", lib.loc="/usr/lib/R/site-library")

# chargement des routines perso
source("mes_fonctions.R")

# test de la connexion avec mysql
con<-dbConnect(MySQL(),group = "pma") 
dbListTables(con)
# connexion à la table RPU__
dbListFields(con,"RPU__")

# lecture des données 2012
rs<-dbSendQuery(con,"SELECT * FROM RPU__ WHERE ENTREE BETWEEN '2012-01-01' AND '2013-01-01' ")
d1<-fetch(rs,n=-1,encoding = "UTF-8")

# suppression de la colonne RAW, n°16:
d1<-d1[,-16]
# d1 est le dataframe par dédaut
attach(d1)
##### transformation des données #####
# création de finess unique pour un établissement par transformation du finess juridique
# en finess geographique
a<-FINESS
a[a=="670780543"]<-"670000272" # Wissembourg
a[a=="680000973"]<-"680000684" # Colmar
b<-c(670000272,670000397,670016237,670780055,670780337,670780543,680000197,680000486,680000684,680000700,680000973)
c<-as.character(b)
# on supprime les finess juridiques
c<-c[c(-6,-11)]
d<-c("Wis","Sel","Odi","Hus","Hag","3Fr","Alk","Col","Geb")
b<-factor(a,levels=c,labels=d)
d1$FINESS<-b
rm(b)
rm(a)
# suite
d1$CODE_POSTAL<-as.factor(CODE_POSTAL)
d1$COMMUNE<-as.factor(COMMUNE)
d1$SEXE<-as.factor(SEXE)
d1$NAISSANCE<-as.Date(NAISSANCE)
d1$ENTREE<-as.Date(ENTREE)
d1$SORTIE<-as.Date(SORTIE)
d1$MODE_ENTREE<-factor(MODE_ENTREE,levels=c(0,6,7,8),labels=c('NA','Mutation','Transfert','Domicile'))
d1$PROVENANCE<-factor(PROVENANCE,levels=c(0,1,2,3,4,5,8),labels=c('NA','MCO','SSR','SLD','PSY','PEA','PEO'))
d1$TRANSPORT<-as.factor(TRANSPORT)
d1$TRANSPORT_PEC<-as.factor(TRANSPORT_PEC)
d1$GRAVITE<-as.factor(GRAVITE)
d1$MODE_SORTIE<-factor(MODE_SORTIE,levels=c(0,6,7,8,4),labels=c('NA','Mutation','Transfert','Domicile','Décès'))
d1$DESTINATION<-factor(DESTINATION,levels=c(0,1,2,3,4,6,7),labels=c('NA','MCO','SSR','SLD','PSY','HAD','HMS'))
d1$ORIENTATION<-as.factor(ORIENTATION)
d1$AGE<-floor(as.numeric(d1$ENTREE-d1$NAISSANCE)/365)

# sauvegarde des données
write.table(d1,"rpu2012_2.txt",sep=',',quote=TRUE,na="NA")
# d1<-read.table("rpu2012_2.txt",sep=",")

#Analyse
detach(d1)
attach(d1)

# nb de lignes:
N<-nrow(d1)
paste("nb. de colonnes:",N)
# nom des colonnes:
print(names(d1))
# structure des données
str(d1)

# FIN



