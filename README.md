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
- `FTHG` (*Full Time Home Goals*) : nombre de buts marqués par l’équipe à domicile à la fin du match  
- `FTAG` (*Full Time Away Goals*) : nombre de buts marqués par l’équipe à l’extérieur à la fin du match  
- `HTHG` (*Half Time Home Goals*) : buts marqués à domicile à la mi-temps  
- `HTAG` (*Half Time Away Goals*) : buts marqués à l’extérieur à la mi-temps  

Ces variables permettent d’analyser le score final et la dynamique entre première et seconde mi-temps.

**Activité offensive**
- `HS` (*Home Shots*) : nombre total de tirs effectués par l’équipe à domicile  
- `AS` (*Away Shots*) : nombre total de tirs effectués par l’équipe à l’extérieur  
- `HST` (*Home Shots on Target*) : nombre de tirs cadrés à domicile  
- `AST` (*Away Shots on Target*) : nombre de tirs cadrés à l’extérieur  
- `HC` (*Home Corners*) : nombre de corners obtenus par l’équipe à domicile  
- `AC` (*Away Corners*) : nombre de corners obtenus par l’équipe à l’extérieur  

Ces variables décrivent la production offensive et la pression exercée par les équipes.

**Discipline et engagement**
- `HF` (*Home Fouls*) : nombre de fautes commises par l’équipe à domicile  
- `AF` (*Away Fouls*) : nombre de fautes commises par l’équipe à l’extérieur  
- `HY` (*Home Yellow Cards*) : nombre de cartons jaunes reçus à domicile  
- `AY` (*Away Yellow Cards*) : nombre de cartons jaunes reçus à l’extérieur  
- `HR` (*Home Red Cards*) : nombre de cartons rouges reçus à domicile  
- `AR` (*Away Red Cards*) : nombre de cartons rouges reçus à l’extérieur  

Ces variables permettent d’étudier le niveau d’engagement des équipes ainsi que leur discipline.

#

#### Limites du dataset

Certaines variables (tirs, tirs cadrés, cartons, arbitres…) ne sont pas renseignées pour toutes les saisons, notamment les plus anciennes.

Cela implique que certaines analyses devront être réalisées sur des sous-ensembles de données.

De plus, le dataset ne contient pas d’informations contextuelles (joueurs, blessures, tactiques), ce qui limite l’interprétation causale des résultats.

---

### Questions de recherche

Afin d’explorer le dataset de manière claire et structurée, nous avons retenu 20 questions principales :

|    | Question                                                           | Variables                 | Visualisation         | Pourquoi ce choix est adapté                                                                           |
| -- | ------------------------------------------------------------------ | ------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------ |
| 1  | Quelle est la proportion de victoires (domicile, extérieur, nul) ? | FTR                       | Bar chart             | Permet de comparer des catégories discrètes et de visualiser rapidement la distribution des résultats. |
| 2  | Quelle est la distribution du nombre de buts par match ?           | FTHG, FTAG                | Histogramme           | Idéal pour analyser la distribution d’une variable numérique (forme, dispersion, asymétrie).           |
| 3  | Le nombre de buts évolue-t-il selon les saisons ?                  | Season, TotalGoals        | Line chart            | Permet d’observer des tendances temporelles et des évolutions dans le temps.                           |
| 4  | Quelles équipes marquent le plus ?                                 | HomeTeam, AwayTeam, Goals | Bar chart (Top N)     | Permet de comparer efficacement des valeurs entre catégories (équipes).                                |
| 5  | Quelles équipes encaissent le plus de buts ?                       | Goals conceded            | Bar chart             | Permet d’identifier les équipes les plus faibles défensivement.                                        |
| 6  | Existe-t-il un avantage du terrain ?                               | FTR                       | Bar chart             | Visualisation simple pour observer un déséquilibre entre catégories.                                   |
| 7  | Les équipes qui tirent plus gagnent-elles plus souvent ?           | HS, AS, FTR               | Boxplot               | Compare la distribution d’une variable numérique selon des catégories.                                 |
| 8  | Relation entre tirs et buts ?                                      | HS, FTHG                  | Scatter plot          | Permet d’identifier une corrélation entre deux variables quantitatives.                                |
| 9  | Les tirs cadrés expliquent-ils mieux les buts ?                    | HST, FTHG                 | Scatter + régression  | Permet de visualiser une relation et une tendance (corrélation plus précise).                          |
| 10 | Les corners influencent-ils les buts ?                             | HC, FTHG                  | Scatter plot          | Permet de tester une relation potentielle entre deux variables.                                        |
| 11 | Les matchs avec plus de tirs ont-ils plus de buts ?                | TotalShots, TotalGoals    | Scatter plot          | Permet de vérifier si l’intensité offensive influence le score.                                        |
| 12 | Distribution du nombre de tirs ?                                   | HS, AS                    | Histogramme           | Permet de comprendre la variabilité et la dispersion des tirs.                                         |
| 13 | Quelles équipes commettent le plus de fautes ?                     | HF, AF                    | Bar chart             | Permet de comparer le style de jeu des équipes.                                                        |
| 14 | Quelles équipes reçoivent le plus de cartons ?                     | HY, AY                    | Bar chart             | Permet d’identifier les équipes les plus sanctionnées.                                                 |
| 15 | Les fautes entraînent-elles des cartons ?                          | HF, HY                    | Scatter plot          | Permet d’analyser la relation entre agressivité et sanctions.                                          |
| 16 | Les arbitres distribuent-ils différemment les cartons ?            | Referee, Cards            | Bar chart             | Permet de comparer des comportements entre individus (arbitres).                                       |
| 17 | Les cartons évoluent-ils dans le temps ?                           | Season, Cards             | Line chart            | Permet d’observer une évolution temporelle.                                                            |
| 18 | Les matchs avec plus de buts ont-ils plus de tirs ?                | TotalGoals, TotalShots    | Scatter plot          | Permet de valider une hypothèse logique sur l’intensité du jeu.                                        |
| 19 | Les équipes dominantes en tirs gagnent-elles ?                     | ShotDiff, FTR             | Bar chart / boxplot   | Permet de relier domination statistique et résultat.                                                   |
| 20 | Quelles variables sont corrélées entre elles ?                     | Variables numériques      | Heatmap (corrélation) | Permet d’avoir une vue globale des relations entre toutes les variables.                               |

