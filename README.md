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

## Questions de recherche

Afin de structurer notre analyse de manière cohérente, nous avons organisé nos questions comme une enquête progressive permettant de mieux comprendre les résultats des matchs de Premier League.


### 1. Comprendre les résultats du championnat

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 1 | Quelle est la répartition des résultats (domicile, nul, extérieur) ? | FTR | Bar chart | Comprendre la structure globale |
| 2 | Existe-t-il un avantage du terrain ? | FTR | Bar chart | Comparer domicile vs extérieur |
| 3 | Quelle est la distribution du nombre de buts par match ? | TotalGoals (FTHG + FTAG) | Histogramme | Comprendre le profil des matchs |
| 4 | Quelles équipes marquent le plus ? | HomeTeam, AwayTeam, TotalGoals (FTHG + FTAG) | Bar chart | Identifier les meilleures attaques |


### 2. Dynamique des matchs

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 5 | Les matchs sont-ils souvent décidés en seconde mi-temps ? | HTR, FTR | Bar chart | Comprendre la dynamique temporelle |
| 6 | Quelle proportion de matchs connaît un retournement ? | HTR, FTR | Bar chart | Mesurer l’instabilité des matchs |
| 7 | Le résultat à la mi-temps prédit-il le résultat final ? | HTR, FTR | Heatmap | Étudier la dépendance |


### 3. Performance offensive et efficacité

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 8 | Les équipes qui tirent le plus gagnent-elles ? | HS, AS, FTR | Boxplot | Tester la domination offensive |
| 9 | Les tirs cadrés sont-ils plus déterminants que les tirs ? | HST, HS, TotalGoals (FTHG + FTAG) | Scatter | Mesurer l’efficacité |
| 10 | Existe-t-il une relation entre tirs et buts ? | TotalShots (HS + AS), TotalGoals (FTHG + FTAG) | Scatter | Corrélation |
| 11 | Les équipes dominantes en tirs gagnent-elles réellement ? | ShotDiff (HS − AS), FTR | Boxplot | Domination vs victoire |
| 12 | Existe-t-il des matchs dominés mais perdus ? | ShotDiff (HS − AS), FTR | Scatter | Cas contre-intuitifs |
| 13 | Les matchs équilibrés en tirs finissent-ils plus souvent en nul ? | ShotDiff (HS − AS), FTR | Bar chart | Équilibre vs résultat |


### 4. Discipline et impact sur le jeu

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 14 | Les fautes influencent-elles le résultat du match ? | HF, AF, FTR | Boxplot | Agressivité vs performance |
| 15 | Existe-t-il une relation entre fautes et cartons ? | HF, HY | Scatter | Cohérence disciplinaire |
| 16 | Les cartons rouges ont-ils un impact sur le résultat ? | HR, FTR | Bar chart | Impact d’un événement critique |
| 17 | Certaines équipes sont-elles plus sanctionnées que d’autres ? | HomeTeam, AwayTeam, Cards (HY + AY + HR + AR) | Bar chart | Comparaison des styles |
| 18 | Les arbitres distribuent-ils différemment les cartons ? | Referee, Cards (HY + AY + HR + AR) | Bar chart | Influence du contexte |


### 5. Évolution et vision globale

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 19 | Le nombre de buts évolue-t-il selon les saisons ? | Season, TotalGoals (FTHG + FTAG) | Line chart | Évolution du jeu |
| 20 | Quelles variables sont les plus corrélées entre elles ? | Variables numériques (incluant TotalGoals, TotalShots, ShotDiff, Cards) | Heatmap | Vision globale des relations |
    

