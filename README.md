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

#### Stratégie d'encodage visuel
Pour permettre la clarté de l'analyse, les choix de visualisation respectent les propriétés des données :
- **Variables Nominales** : utilisation de l'encodage par position sur l'axe (Bar Charts) pour faciliter la comparaison entre entités (équipes, arbitres).
- **Variables Ordinales/Discrètes** : utilisation de l'ordre pour observer les distributions (Histogrammes) et les écarts (Boxplots).
- **Variables Temporelles** : utilisation de l'axe horizontal pour représenter la continuité et les tendances (Line charts).

#

#### Limites du dataset

Certaines variables (tirs, tirs cadrés, cartons, arbitres…) ne sont pas renseignées pour toutes les saisons, notamment les plus anciennes.

Cela implique que certaines analyses devront être réalisées sur des sous-ensembles de données.

De plus, le dataset ne contient pas d’informations contextuelles (joueurs, blessures, tactiques), ce qui limite l’interprétation causale des résultats.

---

## Plan d’analyse

Afin de structurer notre analyse de manière cohérente, nous avons organisé nos questions comme une enquête progressive permettant de mieux comprendre les résultats des matchs de Premier League.

**Notre analyse suivra une progression en cinq axes. Nous commencerons par décrire la structure générale des résultats du championnat, puis nous étudierons la dynamique temporelle des matchs. Nous chercherons ensuite à comprendre dans quelle mesure la domination offensive et la discipline influencent l’issue d’une rencontre, avant de terminer par une vision plus globale des évolutions saisonnières et des corrélations entre variables.**

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
| 8 | ~~Les équipes qui tirent le plus gagnent-elles ?~~<br>La différence de tirs entre les deux équipes est-elle associée au résultat final ? | HS, AS, FTR | Boxplot | Tester la domination offensive |
| 9 | ~~Les tirs cadrés sont-ils plus déterminants que les tirs ?~~<br>Les tirs cadrés permettent-ils de mieux expliquer le nombre de buts que le nombre total de tirs ? | TotalShots (HS + AS), TotalShotsTarget (HST + AST), TotalGoals (FTHG + FTAG) | Scatter comparatif | Comparer le lien entre tirs, tirs cadrés et buts |
| 10 |~~Existe-t-il une relation entre tirs et buts ?~~<br> | ~~TotalShots (HS + AS), TotalGoals (FTHG + FTAG)~~<br> | ~~Scatter~~<br> | ~~Corrélation |
| 11 | ~~Les équipes dominantes en tirs gagnent-elles réellement ?~~<br>La quantité de tirs garantit-elle la victoire à coup sûr ? | ShotDiff (HS − AS), FTR | Boxplot | Domination vs victoire |
| 12 | ~~Existe-t-il des matchs dominés mais perdus ?~~<br>Quelle est la fréquence des hold-ups (matchs dominés aux tirs mais perdus) ? | ShotDiff (HS − AS), FTR | Scatter | Cas contre-intuitifs |
| 13 | ~~Les matchs équilibrés en tirs finissent-ils plus souvent en nul ?~~<br>Les matchs les plus ouverts offensivement sont-ils aussi les plus imprévisibles ? | TotalGoals (FTHG + FTAG), GoalDiff = \|FTHG - FTAG\| | Scatter plot | Comparer intensité offensive et équilibre du score |
| 14 | Comment l'efficacité (Buts/Tirs) varie-t-elle selon les 5 meilleures équipes ? | HomeTeam, HS, FTHG | Bar chart (Faceting) | Comparer les profils d'efficacité par équipe |


### 4. Discipline et impact sur le jeu

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 15 | ~~Les fautes influencent-elles le résultat du match ?~~<br>L'agressivité sur le terrain (fautes) pénalise-t-elle le résultat final ? | HF, AF, FTR | Boxplot | Agressivité vs performance |
| 16 | Existe-t-il une relation entre fautes et cartons ? | HF, HY | Scatter | Cohérence disciplinaire |
| 17 | ~~Les cartons rouges ont-ils un impact sur le résultat ?~~<br>Les arbitres sanctionnent-ils de la même manière un nombre donné de fautes ? | Referee, TotalFouls (HF + AF), TotalCards (HY + AY + HR + AR) | Scatter plot | Analyser les différences de sanction selon les arbitres |
| 18 | Certaines équipes sont-elles plus sanctionnées que d’autres ? | HomeTeam, AwayTeam, Cards (HY + AY + HR + AR) | Bar chart | Comparaison des styles |
| 19 | Les arbitres distribuent-ils différemment les cartons ? | Referee, Cards (HY + AY + HR + AR) | Bar chart | Influence du contexte |


### 5. Évolution et vision globale

| # | Question | Variables | Visualisation | Objectif |
|--:|----------|----------|--------------|---------|
| 20 | Le nombre de buts évolue-t-il selon les saisons ? | Season, TotalGoals (FTHG + FTAG) | Line chart | Évolution du jeu |
| 21 | ~~Quelles variables sont les plus corrélées entre elles ?~~ | ~~Variables numériques (incluant TotalGoals, TotalShots, ShotDiff, Cards)~~ | ~~Heatmap~~ | ~~Vision globale des relations~~ |
| 21 | Les équipes les plus offensives sont-elles aussi les plus efficaces ? | HomeTeam, AwayTeam, TotalShots (HS + AS), TotalGoals (FTHG + FTAG) | Scatter plot | Comparer volume offensif et efficacité offensive |
| 22 | Le style de jeu général de la Premier League est-il devenu plus propre ou plus indiscipliné au fil des décennies ? | Season, TotalFouls, TotalCards | Multi-line chart / Facet | Analyser l'évolution de la discipline historique |


**Modification du plan d'analyse :**
Une heatmap de corrélation globale permet d'identifier des relations statistiques entre variables, mais elle ne répond pas directement à une problématique métier ou footballistique clairement définie. Les résultats obtenus auraient été difficiles à interpréter dans le cadre de notre analyse exploratoire.


---

## Méthodologie de traitement et exploration interactive
Dans le cadre du projet, notre démarche suit le cycle de **Aquire > Filter > Mine > Refine** :
1. **Traitement (dplyr)** : Nettoyer les données et gérer des valeurs manquantes `NA` pour garantir la fiabilité des analyses.
2. **Exploration statique (ggplot2)** : Créer des visualisations statiques pour valider les hypothèses.
3. **Interactivité (Shiny)** : Transformer le visuel pour permettre à l'utilisateur de découvrir des tendences spécifiques en appliquant des filtres.
