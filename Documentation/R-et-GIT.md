Utiliser R et Git (github)
========================================================

Git est un systeme de version comme SVN. R sait utiliser Git et SVN.

GitHub est un service d´hébergement a distance qui utilise git. On peut tres bien créer son propre serveur d´hébergement localement ou a distance.

source du tutoriel http://rogerdudler.github.io/git-guide/

autres références: http://git-scm.com/book/fr/Les-bases-de-Git-D%C3%A9marrer-un-d%C3%A9p%C3%B4t-Git

créer un nouveau depot (repository)
------------------------------------
creer un nouveau dossier, l´ouvrir et faire un **git init** pour creer un nouveau depot git.
```
bart@bart-G73Jh ~/rdev $ cd test
bart@bart-G73Jh ~/rdev/test $ git init

Initialized empty Git repository in /home/bart/rdev/test/.git/
```

Pour l'instant le dossier .git est crée en local dans le dossier test de /home/bart/rdev/. Il contient les 5 dossiers et 3 fichiers:

- branches
- hooks
- info
- objects
- refs
- config
- description
- HEAD


checkout un depot (checkout = sortir de, checkin = entrer dans)
-----------------
creer une copie de travail du depot local avec la commande git **git clone /path/to/repository**.
Lorqu´on utilise un serveur distant, la commande devient **git clone username@host:/path/to/repository**.

Organisation du travail (workflow)
----------------------------------
Le depot local est constitue de trois *trees* mis a jour par git. Le premier est estle repertoire de travail (working directory) qui contient les fichiers courants. Le second est l´*index* qui fonctionne comme zone de stockage et enfin le *HEAD* qui pointe sur le dernier commit effectué.

![alt text](trees.png)

add et commit
-------------
On peut proposer des modifications (on les *add* a l´ *Index*) en utilisant **git add <filename>** ou **git add* **. C´est la premiere étape du flux de travail. Pour valider cette modification on utilise **git commit -m "Commit message"**. Maintenant le fichier est transféré dans le *HEAD* mais pas encore dans le dépot distant.

"Pousser" les modifications (pushing changes)
---------------------------------------------
Les modifications sont actuellement dans le HEAD de la copie de travail local. Pour envoyer les modifications au dépot distant faire un **git push origin master**. Remplacer master par le nom de la branche ou on veut pousser les modifications.
Si on a pas cloné un dépot existant et que l on veut connecter son dépot local a un serveur distant, on peut le faire avec **git remote add origin <server>**. Maintenant il est possible de pousser les modifications vers le serveur distant sélectionné.

Créer une branche
-----------------
Les branches sont utilisées pour développer des versions indépendantes des autres. La branche maitresse est la branche par défaut lorsque on crée un dépot. On crée des branches paralleles au cours du développement qui sont ensuite réunies a la branche principale au moment de l´achevement.

Un crée une nouvelle branche appelée "feature_x" et on switche vers elle avec **git checkout -b feature_x**.

Pour retourner a la branche principale **git checkout master**

et supprimer la branche **git branch -d feature_x**

Une branche n´est pas accessible aux autres tant qu´elle n´est pas poussée sur le dépot distant **git push origin <branch>**

Mise a jour et fusion update & merge
-------------------------------------
Pour mettre a jour le dépot local jusqu´au prochain commit, faire **git pull** dans le répertoire de travail pour enregistrer et fusionner  les modifications distantes.

Pour fusionner une branche dans la branche active (e.g. master), on utilise **git merge <branch>**
 Dans les deux cas git tente de fusionner les modifications. Malheureusment ce n´est pas toujours posible en raison de conflits. Il faut alors gérer ces conflits a la main en éditant les fichiers.
 
Apresmodification, on indique que les fichiers sont mergés par **git add <filename>**. Avant de fusionner les modifications on peut les visualiser avec **git diff <source_branch> <target_branch>**.

Marquage (tagging)
--------
Il est recommandé de créer des tags pour identifier les versions. On peut créer un nouveau tag appelé  1.0.0 en exécutant **git tag 1.0.0 1b2e1d63ff** ou *1b2e1d63ff* repésente les 10 premiers caracteres de l´ID du commit que l on veut référencer avec le tag. On peut récupérer l´identifiant (tag) du commit par **git log**. Il est possible d´utiliser des tag plus petits, ce qui est obligatoire, c´est qu´il soit unique.


Remplacer les modifications locales
------------------------------------
Au cas ou l´on fasse une erreur (ce qui bien sur n´arrive jamais) on peut remplacer les modifications locales avec la commande **git checkout -- <filename>**

Ceci remplace les modifications de votre arbre de travail avec le contenu de HEAD. Les modificaions déja ajoutée a l´index, comme les nouveaux fichiers, seront conservés.

Si vous souhaiteez plutot abandonner toutes vos modifications locales et commits, récupérer la derniere version a partir du serveur et pointer sur la branche locale principale: **git fetch origin** er **git reset --hard origin/master**

Trucs utiles
------------

- built-in git GUI **gitk**

- use colorful git output **git config color.ui true**

- show log on just one line per commit **git config format.pretty oneline**

- use interactive adding **git add -i**

20 Useful jQuery Chart and Graph Plugins
----------------------------------------
http://medleyweb.com/web-dev/jquery-chart-and-graph-plugins/

