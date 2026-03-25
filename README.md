# Analyse exploratoire: English Premier League (EPL) Results
**Introduction**
#
**Contexte et objectifs**
#
Le présent projet s’inscrit dans le domaine de la data analyse appliquée au sport. Il repose sur l’exploitation d’un dataset contenant les résultats et statistiques des matchs de la Premier League sur plusieurs saisons. Ce championnat, reconnu pour sa compétitivité, offre un cadre pertinent pour étudier les facteurs influençant les performances des équipes et les résultats des rencontres.

L’objectif de cette étude est de réaliser une analyse exploratoire des données afin d’identifier les tendances, les relations entre variables et les facteurs susceptibles d’influencer l’issue d’un match. Cette analyse permettra notamment d’évaluer l’impact des statistiques de jeu (tirs, fautes, cartons) sur les résultats et de dégager des insights exploitables pour des analyses plus avancées ou des modèles prédictifs.

##
**Structure du dataset**
# Projet IF36 – Analyse des matchs de Premier League

## Introduction

### Données

Le jeu de données étudié porte sur les matchs de Premier League anglaise et couvre plusieurs saisons. Il est fourni au format **CSV** et contient **11 113 observations** (matchs) et **23 variables**.

Chaque observation correspond à un match et regroupe des informations sur le score, le déroulement du match, l’activité des équipes ainsi que certains éléments contextuels.

Ce dataset provient d’une source publique (Kaggle) et a été retenu pour sa richesse, sa lisibilité et sa pertinence dans le cadre d’une analyse exploratoire basée sur la visualisation de données.

---

#### Typologie des variables

Afin de mieux comprendre la structure du dataset, les variables peuvent être classées selon leur nature.

##### Variables temporelles
- `Season` : saison du championnat  
- `DateTime` : date et heure du match  

Ces variables permettent d’analyser l’évolution du jeu dans le temps et d’identifier des tendances saisonnières.

---

##### Variables catégorielles nominales
- `HomeTeam` : équipe jouant à domicile  
- `AwayTeam` : équipe jouant à l’extérieur  
- `Referee` : arbitre du match  

Elles permettent de comparer les équipes entre elles et d’étudier d’éventuelles différences liées au contexte du match.

---

##### Variables catégorielles ordinales (résultats)
- `FTR` : résultat final (`H` = victoire domicile, `A` = victoire extérieur, `D` = match nul)  
- `HTR` : résultat à la mi-temps  

Ces variables sont essentielles pour relier les performances des équipes à l’issue du match.

---

##### Variables numériques discrètes

**Score**
- `FTHG`, `FTAG` : buts en fin de match  
- `HTHG`, `HTAG` : buts à la mi-temps  

**Activité offensive**
- `HS`, `AS` : tirs  
- `HST`, `AST` : tirs cadrés  
- `HC`, `AC` : corners  

**Discipline et engagement**
- `HF`, `AF` : fautes  
- `HY`, `AY` : cartons jaunes  
- `HR`, `AR` : cartons rouges  

Ces variables permettent d’analyser la performance offensive, la pression exercée par les équipes et leur comportement disciplinaire.

---

#### Structure analytique du dataset

Ce jeu de données repose sur une logique simple : chaque match est décrit selon plusieurs dimensions complémentaires :

- le **résultat du match**  
- la **production offensive**  
- l’**efficacité** (tirs vs buts)  
- la **discipline**  
- le **contexte** (équipes, saison, arbitre)  

Cette structure permet de croiser les variables pour répondre à des questions variées.

---

#### Sous-groupes d’analyse

Plusieurs sous-groupes peuvent être exploités :

- domicile vs extérieur  
- comparaison entre équipes  
- évolution selon les saisons  
- analyse selon le résultat  

---

#### Limites du dataset

Certaines variables (tirs, tirs cadrés, cartons, arbitres…) ne sont pas renseignées pour toutes les saisons, notamment les plus anciennes.

Cela implique que certaines analyses devront être réalisées sur des sous-ensembles de données.

De plus, le dataset ne contient pas d’informations contextuelles (joueurs, blessures, tactiques), ce qui limite l’interprétation causale des résultats.

---


