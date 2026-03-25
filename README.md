# Analyse exploratoire: English Premier League (EPL) Results
**Introduction**
#
**Contexte et objectifs**
#
Le présent projet s’inscrit dans le domaine de la data analyse appliquée au sport. Il repose sur l’exploitation d’un dataset contenant les résultats et statistiques des matchs de la Premier League sur plusieurs saisons. Ce championnat, reconnu pour sa compétitivité, offre un cadre pertinent pour étudier les facteurs influençant les performances des équipes et les résultats des rencontres.

L’objectif de cette étude est de réaliser une analyse exploratoire des données afin d’identifier les tendances, les relations entre variables et les facteurs susceptibles d’influencer l’issue d’un match. Cette analyse permettra notamment d’évaluer l’impact des statistiques de jeu (tirs, fautes, cartons) sur les résultats et de dégager des insights exploitables pour des analyses plus avancées ou des modèles prédictifs.

##
**Structure du dataset**
### Données

Le jeu de données étudié porte sur les matchs de Premier League anglaise et couvre plusieurs saisons. Il est fourni sous format CSV et contient **11 113 observations** (matchs) et **23 variables**.

Chaque observation correspond à un match et regroupe des informations sur le score, le déroulement du match, l’activité des équipes ainsi que certains éléments contextuels.

Ce dataset provient d’une source publique (Kaggle) et a été retenu pour sa richesse, sa lisibilité et sa pertinence dans le cadre d’une analyse exploratoire basée sur la visualisation.

---

#### Typologie des variables

Afin de mieux comprendre la structure du dataset, les variables peuvent être classées selon leur nature.

##### Variables temporelles
- `Season` : saison du championnat
- `DateTime` : date et heure du match

👉 Ces variables permettent d’analyser l’évolution du jeu dans le temps et d’identifier des tendances saisonnières.

---

##### Variables catégorielles nominales
- `HomeTeam` : équipe jouant à domicile
- `AwayTeam` : équipe jouant à l’extérieur
- `Referee` : arbitre du match

👉 Elles permettent de comparer les équipes entre elles et d’étudier d’éventuelles différences liées au contexte du match.

---

##### Variables catégorielles ordinales (résultats)
- `FTR` : résultat final (H = victoire domicile, A = victoire extérieur, D = match nul)
- `HTR` : résultat à la mi-temps

👉 Ces variables sont essentielles pour relier les performances des équipes à l’issue du match.

---

##### Variables numériques discrètes

###### Score
- `FTHG` : buts marqués à domicile (fin de match)
- `FTAG` : buts marqués à l’extérieur
- `HTHG` : buts à domicile à la mi-temps
- `HTAG` : buts à l’extérieur à la mi-temps

👉 Elles permettent d’analyser la performance offensive et la dynamique du match.

---

###### Activité offensive
- `HS` : tirs de l’équipe à domicile
- `AS` : tirs de l’équipe à l’extérieur
- `HST` : tirs cadrés à domicile
- `AST` : tirs cadrés à l’extérieur
- `HC` : corners à domicile
- `AC` : corners à l’extérieur

👉 Ces variables décrivent la pression offensive exercée par les équipes.

---

###### Discipline et engagement
- `HF` : fautes commises par l’équipe à domicile
- `AF` : fautes commises par l’équipe à l’extérieur
- `HY` : cartons jaunes à domicile
- `AY` : cartons jaunes à l’extérieur
- `HR` : cartons rouges à domicile
- `AR` : cartons rouges à l’extérieur

👉 Elles permettent d’étudier le comportement des équipes et son impact potentiel sur les résultats.

---

#### Lecture globale du dataset

Ce jeu de données est structuré autour d’un principe central : chaque match est décrit selon plusieurs dimensions complémentaires :

- le **résultat** (qui gagne)  
- la **production offensive** (tirs, corners…)  
- l’**efficacité** (buts vs tirs cadrés)  
- le **comportement disciplinaire** (fautes, cartons)  
- le **contexte** (équipes, saison, arbitre)

Cette organisation permet de croiser les variables afin de répondre à des questions variées sur le déroulement et l’issue des matchs.

---

#### Sous-groupes d’analyse

Plusieurs sous-ensembles peuvent être exploités :

- distinction **domicile / extérieur**
- comparaison entre **équipes**
- évolution selon les **saisons**
- analyse selon le **résultat du match**

Ces sous-groupes structureront directement les analyses du projet.

---

#### Limites du dataset

Certaines variables (notamment tirs, tirs cadrés, corners, fautes, cartons et arbitres) ne sont pas renseignées pour toutes les saisons, en particulier les plus anciennes.

Cela implique que certaines analyses devront être réalisées sur des sous-ensembles de données.

Par ailleurs, le dataset ne contient pas d’informations contextuelles (composition des équipes, blessures, enjeux du match), ce qui limite l’interprétation causale des résultats.
**Plan d'analyse**
