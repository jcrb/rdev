RPU 2012 - Read me first
========================================================

Le type de document utilisé est *Rapport*. Il comporte:
- un corps de texte
- des annexes
- une table des figures
- une table des tableaux
- un glossaire
- un index
- une table des matières

Spécificités de Latex
---------------------
**package{numprint}**: imprime les nombres avec un séparateur de milliers. Nécessite d'installer latex supplementary packages de Texlive (librairie ubuntu). Doc http://mirrors.ctan.org/macros/latex/contrib/numprint/numprint.pdf

**Erreur dans match.arg(options$results, c("verbatim", "tex", "hide"))** : 'arg' should be one of “verbatim”, “tex”, “hide”

Cette erreur est apparue à Momtreal ligne 119 avec le chunk tab1. Il semble que results = 'asis' ne soit pas supporté pat toutes les versions. Remplacé par results = tex fonctionne (noter l'absence de guillemets, sinon erreur)

Spécificité de RStudio
----------------------
**Shiny** pour faire des pages html interactives àpartir de R. Voir doc dans *www.rstudio.com/shiny*.

Pour installer shiny sur ubuntu: https://github.com/rstudio/shiny-server/wiki/Ubuntu-step-by-step-install-instructions

Site de shiny: https://github.com/rstudio/shiny-server

Tutorial officiel: http://www.rstudio.com/shiny/ et http://rstudio.github.io/shiny/tutorial/

Détails de la structure
=======================
le corps de texte
-----------------
- taille 12

les annexes
-----------
pour créer une nouvelle annexe, ouvrir un *chapter* APRES la marque \appendix

Table des figures et des tableaux
---------------------------------
Pour qu'une figure apparaisse dans la liste des figures, elle doit comporter l'option *\caption{légende de la figure}*.
Por qu'une figure puisse être référencée, elle doit comporter l'option *\label{mon_label}*. On peut alors insérer un renvoi vers la figure dans le corps de texte en utilisant *\Ref{mon_label}* et *\pageref{mon_label}*.
Attention: pour un référencement correct, il faut que loption *caption* précède l'option *label*.

\begin{table}
\begin{center}
\begin{tabular}{|l|c|c|c|c|}
  \hline
   \emph{Age} & Min & Max & Moyenne & Médiane \\
    \hline
    \hline
    Hommes & $\Sexpr{b[1]}$ & \Sexpr{b[6]} & $\Sexpr{b[4]}$ & \Sexpr{b[3]} \\
    \hline
    Femmes & \Sexpr{c[1]} & \Sexpr{c[6]} & \Sexpr{c[4]} & \Sexpr{c[3]} \\
    \hline
    \emph{total} & \Sexpr{a[1]} & \Sexpr{a[6]} & \Sexpr{a[4]} & \Sexpr{a[3]} \\
  \hline
\end{tabular}
\caption{Age de l'ensemble des patients}
\label{summary}
\end{center}
\end{table}

Les caractéristiques de la population sont résumées dans la table \Ref{summary}, page \pageref{summary}.

Utilisation de **xtable**
-------------------------
ex. gravité (CCMU)

<<echo=F, results='asis',fig.width=4,fig.height=5,fig.cap='Gravite (CCMU)',fig.show='asis'>>=

xtable(freq(d1$GRAVITE),caption="Répartition de la gravité (CCMU)",label="ccmu")

plot(d1$GRAVITE,xlab="CCMU",main="Gravité")

@

- fig.caption permet de faire apparaitre la ligne dans la liste des figures
- caption = "" permet de donner une légennde au tableau
- label = "" permet de faire référence au tableau avec \ref et \pageref

Glossaire
---------
Pour créer une nouvelle entrée faire *\glossary{mon_terme}*. Assez compliqué: voir la manière de procéder pp 226 dans Lozano.

Index
-----
Pour figurer dans l'index un mot doit être suivi par *index{mot}*
