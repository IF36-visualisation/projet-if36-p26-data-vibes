# Analyse exploratoire : English Premier League (EPL) Results

## Introduction

### Contexte et objectifs

Le présent projet s’inscrit dans le domaine de la **data analyse appliquée au sport**. Il repose sur l’exploitation du dataset *English Premier League (EPL) Results*, disponible sur Kaggle :  
https://www.kaggle.com/datasets/irkaal/english-premier-league-results/data

Ce dataset contient les résultats et statistiques des matchs de la Premier League sur plusieurs saisons. Ce championnat, reconnu pour sa compétitivité, constitue un cadre pertinent pour étudier les facteurs influençant les performances des équipes et les résultats des rencontres.

L’objectif de cette étude est de réaliser une **analyse exploratoire des données** afin de :

- identifier les tendances générales du championnat  
- analyser les relations entre variables  
- mettre en évidence les facteurs susceptibles d’influencer l’issue d’un match  

Cette analyse permettra notamment d’évaluer l’impact des statistiques de jeu (tirs, fautes, cartons) et de dégager des insights exploitables pour des analyses plus avancées.

---

##  Structure des données

Le jeu de données étudié porte sur les matchs de Premier League anglaise et couvre plusieurs saisons. Il est fourni au format **CSV** et contient **11 113 observations** (matchs) et **23 variables**.

Chaque observation correspond à un match et regroupe des informations sur le score, le déroulement du match, l’activité des équipes ainsi que certains éléments contextuels.

Plusieurs sous-groupes peuvent être exploités :

- domicile vs extérieur  
- comparaison entre équipes  
- évolution selon les saisons  
- analyse selon le résultat du match

Ce jeu de données repose sur une logique simple : chaque match est décrit selon plusieurs dimensions complémentaires :

- le **résultat du match**  
- la **production offensive**  
- l’**efficacité** (tirs vs buts)  
- la **discipline**  
- le **contexte** (équipes, saison, arbitre)  

Cette organisation permet de croiser les variables afin de répondre à des questions variées sur le déroulement et l’issue des matchs.

#

## Typologie des variables

Afin de mieux comprendre la structure du dataset, les variables peuvent être classées selon leur nature.

##### Variables temporelles
- `Season` : saison du championnat  
- `DateTime` : date et heure du match  

Ces variables permettent d’analyser l’évolution du jeu dans le temps et d’identifier des tendances saisonnières.


##### Variables catégorielles nominales
- `HomeTeam` : équipe jouant à domicile  
- `AwayTeam` : équipe jouant à l’extérieur  
- `Referee` : arbitre du match  

Elles permettent de comparer les équipes entre elles et d’étudier d’éventuelles différences liées au contexte du match.


##### Variables catégorielles ordinales (résultats)
- `FTR` : résultat final (`H` = victoire domicile, `A` = victoire extérieur, `D` = match nul)  
- `HTR` : résultat à la mi-temps  

Ces variables sont essentielles pour relier les performances des équipes à l’issue du match.


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

#

#### Limites du dataset

Certaines variables (tirs, tirs cadrés, cartons, arbitres…) ne sont pas renseignées pour toutes les saisons, notamment les plus anciennes.

Cela implique que certaines analyses devront être réalisées sur des sous-ensembles de données.

De plus, le dataset ne contient pas d’informations contextuelles (joueurs, blessures, tactiques), ce qui limite l’interprétation causale des résultats.


### Questions de recherche

Afin d’explorer le dataset de manière claire et structurée, nous avons retenu cinq questions principales :

1. **Les équipes à domicile gagnent-elles plus souvent ?**  
   - **Variables** : `FTR`  
   - **Visualisation** : diagramme en barres  
   - **Objectif** : comparaison des résultats (victoire à domicile / nul / victoire à l’extérieur)

2. **L’avantage du terrain évolue-t-il selon les saisons ?**  
   - **Variables** : `Season`, `FTR`  
   - **Visualisation** : courbe d’évolution ou diagramme en barres groupées  
   - **Objectif** : étude de l’évolution temporelle du taux de victoire à domicile

3. **Le résultat à la mi-temps influence-t-il le résultat final ?**  
   - **Variables** : `HTR`, `FTR`  
   - **Visualisation** : diagramme en barres groupées ou diagramme mosaïque  
   - **Objectif** : analyse de la relation entre la mi-temps et le résultat final

4. **Les tirs cadrés expliquent-ils mieux la victoire que le nombre total de tirs ?**  
   - **Variables** : `HS`, `AS`, `HST`, `AST`, `FTR`  
   - **Visualisation** : boxplots  
   - **Objectif** : comparaison de l’efficacité offensive selon le résultat du match

5. **Un carton rouge influence-t-il fortement l’issue d’un match ?**  
   - **Variables** : `HR`, `AR`, `FTR`  
   - **Visualisation** : diagramme en barres groupées ou empilées  
   - **Objectif** : analyse de l’impact des cartons rouges sur le résultat final
