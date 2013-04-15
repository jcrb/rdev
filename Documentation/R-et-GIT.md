Utiliser R et Git (github)
========================================================

Git est un systeme de version comme SVN. R sait utiliser Git et SVN.

GitHub est un service d´hébergement a distance qui utilise git. On peut tres bien créer son propre serveur d´hébergement localement ou a distance.

source du tutoriel http://rogerdudler.github.io/git-guide/

créer un nouveau depot (repository)
------------------------------------
creer un nouveau dossier, l´ouvrir et faire un **git init** pour creer un nouveau depot git.

checkout un depot (checkout = sortir de, checkin = entrer dans)
-----------------
creer une copie de travail du depot local avec la commande git **git clone /path/to/repository**.
Lorqu´on utilise un serveur distant, la commande devient **git clone username@host:/path/to/repository**.

Organisation du travail (workflow)
----------------------------------
Le depot local est constitue de trois *trees* mis a jour par git. Le premier est estle repertoire de travail (working directory) qui contient les fichiers courants. Le second est l´*index* qui fonctionne comme zone de stockage et enfin le *HEAD* qui pointe sur le dernier commit effectué.


```r
plot(cars)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

add & commit
------------
On peut proposer des modifications (on les *add* a l´ *Index*) en utilisant **git add <filename>** ou **git add**. C´est la premiere étape du flux de travail. Pour valider cette modification on utilise **git commit -m "Commit message"**. Maintenant le fichier est transféré dans le *HEAD* mais pas encore dans le dépot distant.

"Pousser" les modifications (pushing changes)
---------------------------------------------
Les modifications sont actuellement dans le HEAD de la copie de travail local. Pour envoyer les modifications au dépot distant faire un **git push origin master**. Remplacer master par le nom de la branche ou on veut pousser les modifications.
Si on apas cloné un dépot existant et que l on veut connecter son dépot local a un serveur distant, on peut le faire avec **git remote add origin <server>**. Maintenant il est possible de pousser les modifications vers le serveur distant sélectionné.


20 Useful jQuery Chart and Graph Plugins
----------------------------------------
http://medleyweb.com/web-dev/jquery-chart-and-graph-plugins/

