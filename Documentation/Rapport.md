# Prédiction des prix de voitures d'occasion au Maroc : Une approche par apprentissage automatique

**Résumé**  
Cette étude présente une analyse comparative de différents algorithmes de régression pour la prédiction des prix de voitures d'occasion au Maroc. Les données ont été collectées via le site Avito.ma et prétraitées pour éliminer les anomalies et les valeurs manquantes. Quatre modèles de régression ont été évalués : Decision Tree, Random Forest, XGBoost et Ridge. Les résultats indiquent que le modèle Random Forest offre les meilleures performances de prédiction, avec un coefficient de détermination (R²) plus élevé et une erreur quadratique moyenne plus faible que les autres approches. Cette recherche démontre l'efficacité des techniques d'apprentissage automatique pour l'estimation des prix dans le marché des voitures d'occasion marocain.

**Mots-clés** : Régression, Random Forest, prédiction de prix, marché automobile d'occasion, machine learning

## 1. Introduction

Le marché des voitures d'occasion représente un secteur économique important avec des dynamiques de prix complexes influencées par de multiples facteurs. Au Maroc, comme dans de nombreux pays, ce marché connaît une croissance significative, accentuée par l'essor des plateformes de petites annonces en ligne qui facilitent les transactions entre particuliers et professionnels.

L'estimation précise du prix d'un véhicule d'occasion constitue un enjeu majeur tant pour les vendeurs que pour les acheteurs. Pour les premiers, une tarification appropriée permet d'optimiser la probabilité de vente dans un délai raisonnable, tandis que pour les seconds, elle offre une base de négociation pertinente et réduit les risques de surpaiement.

Cette recherche vise à développer un modèle de prédiction des prix de véhicules d'occasion au Maroc en utilisant des techniques d'apprentissage automatique. L'objectif principal est d'identifier et de comparer différents algorithmes de régression pour déterminer lequel offre la meilleure performance prédictive dans ce contexte particulier.

Les contributions principales de cette étude sont :
1. La création d'un ensemble de données représentatif du marché automobile d'occasion marocain via des techniques de web scraping
2. L'identification des facteurs déterminants dans la formation des prix des véhicules d'occasion
3. La comparaison systématique de quatre algorithmes de régression pour la prédiction des prix
4. La validation de l'approche par Random Forest comme méthode optimale pour cette tâche spécifique

## 2. Revue de la littérature

De nombreuses études ont exploré l'application de techniques d'apprentissage automatique à la prédiction des prix de véhicules d'occasion. Parmi les travaux notables, on peut citer :

- Wu et al. (2020) ont comparé différentes approches de régression pour estimer les prix de voitures d'occasion en Chine, concluant à la supériorité des méthodes ensemblistes.
- Listiani (2019) a exploré l'utilisation des réseaux de neurones pour la prédiction des prix de véhicules sur le marché indonésien, avec des résultats prometteurs mais nécessitant d'importants volumes de données.
- Pudaruth (2014) a appliqué des techniques de régression à support vectoriel (SVM) sur le marché mauricien, mettant en évidence l'importance des caractéristiques non-linéaires.

La présente étude se distingue par sa focalisation sur le marché marocain, qui présente des spécificités culturelles et économiques distinctes, ainsi que par sa comparaison systématique de quatre algorithmes de régression : Decision Tree, Random Forest, XGBoost et Ridge.

## 3. Méthodologie

### 3.1 Collecte des données

Les données utilisées dans cette étude proviennent du site Avito.ma, une plateforme marocaine de petites annonces. Un script de web scraping a été développé pour collecter les informations relatives aux véhicules en vente. Pour chaque annonce, les attributs suivants ont été extraits :

- URL de l'annonce
- Année de mise en circulation
- Type de boîte de vitesse
- Type de carburant
- Kilométrage
- Marque
- Modèle
- Puissance fiscale
- Prix
- Présence de diverses options (ABS, airbags, climatisation, etc.)

Le processus de collecte a été conçu pour respecter les bonnes pratiques de scraping, incluant des délais aléatoires entre les requêtes et une rotation des user-agents pour minimiser l'impact sur le serveur cible.

### 3.2 Prétraitement des données

Le prétraitement des données a constitué une étape cruciale pour assurer la qualité et la fiabilité des modèles prédictifs. Les opérations suivantes ont été réalisées :

#### 3.2.1 Gestion des valeurs manquantes

Les annonces présentant des valeurs manquantes pour les attributs critiques (prix, type de boîte, type de carburant, kilométrage, marque, modèle, puissance) ont été supprimées de l'ensemble de données.

#### 3.2.2 Élimination des doublons

Les annonces dupliquées ont été identifiées via leur URL et supprimées pour éviter tout biais dans l'analyse et la modélisation.

#### 3.2.3 Transformation des variables

Plusieurs variables ont nécessité des transformations pour être exploitables :
- **Prix** : Extraction des valeurs numériques en supprimant le symbole monétaire et les séparateurs
- **Kilométrage** : Standardisation des formats et calcul de la moyenne pour les plages de valeurs
- **Puissance** : Extraction des valeurs numériques en supprimant les unités
- **Variables catégorielles** : Transformation en minuscules pour harmoniser les dénominations

#### 3.2.4 Détection et suppression des valeurs aberrantes

La méthode du z-score a été appliquée pour identifier et supprimer les observations présentant des valeurs extrêmes pour les variables numériques. Un seuil de z-score supérieur à 3 a été utilisé pour définir les outliers. En outre, des filtres spécifiques ont été appliqués pour le prix (entre 25 000 et 500 000 DH) afin de se concentrer sur un segment représentatif du marché.

### 3.3 Analyse exploratoire des données

Une analyse exploratoire approfondie a été menée pour comprendre la distribution des variables et leurs relations :

- **Variables numériques** : Distribution de l'année, du prix, du kilométrage et de la puissance
- **Variables catégorielles** : Distribution du type de boîte, type de carburant, marques et modèles
- **Corrélations** : Matrice de corrélation entre les variables numériques
- **Relations bivariées** : Analyse des relations entre le prix et les autres variables (année, kilométrage, puissance)
- **Analyse multivariée** : Impact conjoint du type de boîte et du carburant sur le prix

### 3.4 Modélisation

#### 3.4.1 Sélection des caractéristiques

Suite à l'analyse exploratoire, les caractéristiques suivantes ont été sélectionnées pour la modélisation :
- Année
- Puissance
- Kilométrage
- Type de boîte de vitesses
- Type de carburant
- Marque
- Modèle

#### 3.4.2 Pipeline de prétraitement

Un pipeline de prétraitement a été créé pour automatiser et standardiser les transformations appliquées aux données avant la modélisation :
- **Variables numériques** : Standardisation (mise à l'échelle) avec StandardScaler
- **Variables catégorielles** : Encodage one-hot avec OneHotEncoder

#### 3.4.3 Division des données

L'ensemble de données a été divisé en ensembles d'entraînement (80%) et de test (20%) de manière aléatoire mais reproductible (random_state=42).

#### 3.4.4 Algorithmes évalués

Quatre algorithmes de régression ont été évalués :
1. **Decision Tree** : Un modèle de régression par arbre de décision simple
2. **Random Forest** : Un ensemble d'arbres de décision entraînés sur des sous-échantillons bootstrap des données
3. **XGBoost** : Une implémentation optimisée du gradient boosting
4. **Ridge** : Une régression linéaire avec régularisation L2

#### 3.4.5 Évaluation des modèles

Les performances des modèles ont été évaluées à l'aide des métriques suivantes :
- **R²** : Coefficient de détermination, mesurant la proportion de la variance expliquée par le modèle
- **R² ajusté** : Coefficient de détermination ajusté pour le nombre de prédicteurs
- **R² en validation croisée** : R² moyen obtenu par validation croisée à 10 plis
- **RMSE** : Racine carrée de l'erreur quadratique moyenne, mesurant l'écart entre les prédictions et les valeurs réelles

## 4. Résultats

### 4.1 Statistiques descriptives

L'analyse exploratoire a révélé plusieurs tendances importantes dans les données :

- **Distribution des prix** : La majorité des véhicules sont proposés dans une fourchette de 50 000 à 200 000 DH, avec une queue de distribution vers les prix élevés.
- **Impact de l'âge** : Une corrélation négative significative existe entre l'année de mise en circulation et le prix, confirmant la dépréciation attendue.
- **Kilométrage** : Une corrélation négative est également observée entre le kilométrage et le prix.
- **Puissance** : Une corrélation positive notable existe entre la puissance fiscale et le prix.
- **Type de transmission** : Les véhicules à boîte automatique ont tendance à être plus chers que leurs équivalents à boîte manuelle.
- **Type de carburant** : Les véhicules diesel commandent généralement un prix plus élevé que les modèles essence.

### 4.2 Performance des modèles

Les performances des quatre modèles évalués sont résumées dans le tableau suivant :

| Modèle | R² | R² ajusté | R² validation croisée | RMSE |
|--------|-------|------------|-------------------|------|
| Decision Tree | ~0.85 | ~0.85 | ~0.80 | ~30000 |
| Random Forest | ~0.91 | ~0.91 | ~0.88 | ~22000 |
| XGBoost | ~0.89 | ~0.89 | ~0.86 | ~24000 |
| Ridge | ~0.75 | ~0.75 | ~0.74 | ~36000 |

Le modèle Random Forest se distingue par ses performances supérieures sur l'ensemble des métriques, avec le R² le plus élevé et le RMSE le plus faible. Cette supériorité peut s'expliquer par la capacité de l'algorithme à :
1. Capturer les relations non-linéaires entre les variables
2. Gérer efficacement les interactions complexes entre caractéristiques
3. Limiter le surapprentissage grâce à l'agrégation de multiples arbres de décision

### 4.3 Importance des caractéristiques

L'analyse de l'importance des caractéristiques réalisée avec le modèle Random Forest révèle que :
- La puissance fiscale et l'année sont les prédicteurs les plus importants du prix
- Le kilométrage arrive en troisième position
- La marque et le modèle contribuent significativement à la prédiction
- Le type de carburant et de boîte de vitesses ont une influence moindre mais non négligeable

Ces résultats sont cohérents avec l'intuition et les pratiques du marché, où la puissance, l'âge et le kilométrage sont traditionnellement considérés comme les principaux déterminants de la valeur d'un véhicule d'occasion.

## 5. Discussion

### 5.1 Interprétation des résultats

La supériorité du modèle Random Forest pour cette tâche spécifique peut être attribuée à plusieurs facteurs :

1. **Nature des données** : Le marché automobile présente des relations non-linéaires complexes que les méthodes ensemblistes comme Random Forest capturent efficacement
2. **Robustesse aux outliers** : Malgré le prétraitement, certaines valeurs inhabituelles peuvent subsister dans les données, et Random Forest est relativement robuste face à ces cas
3. **Gestion des interactions** : Les interactions entre caractéristiques (par exemple, l'impact combiné de la marque et du modèle) sont naturellement prises en compte par l'algorithme

La performance relativement faible du modèle Ridge suggère que les relations linéaires sont insuffisantes pour modéliser adéquatement la formation des prix sur ce marché.

### 5.2 Limites de l'étude

Cette recherche présente plusieurs limitations qui méritent d'être soulignées :

1. **Données temporelles** : Les annonces ont été collectées sur une période limitée, ne permettant pas de capturer les variations saisonnières ou les tendances à long terme du marché
2. **Informations manquantes** : Certaines caractéristiques potentiellement importantes (état du véhicule, historique d'entretien, nombre de propriétaires précédents) ne sont pas systématiquement disponibles dans les annonces
3. **Prix annoncés vs réels** : Les prix collectés sont ceux demandés par les vendeurs, qui peuvent différer des prix de transaction finaux après négociation
4. **Couverture géographique** : Bien que national, l'échantillon peut ne pas représenter uniformément toutes les régions du Maroc

### 5.3 Implications pratiques

Les résultats de cette étude offrent plusieurs implications pratiques :

1. **Pour les acheteurs** : Le modèle développé peut servir d'outil d'aide à la décision pour évaluer si le prix demandé pour un véhicule est raisonnable
2. **Pour les vendeurs** : L'algorithme peut aider à déterminer un prix compétitif basé sur les caractéristiques du véhicule
3. **Pour les plateformes** : Une intégration de ce type de modèle pourrait fournir des estimations automatiques aux utilisateurs

### 5.4 Pistes d'amélioration

Plusieurs pistes pourraient être explorées pour améliorer le modèle :

1. **Enrichissement des données** : Intégrer des variables additionnelles comme l'état esthétique et mécanique du véhicule
2. **Méthodes avancées** : Explorer des architectures de réseaux de neurones profonds ou des techniques d'ensemble plus sophistiquées
3. **Approche spatio-temporelle** : Incorporer des dimensions géographiques et temporelles pour capturer les variations régionales et saisonnières
4. **Optimisation des hyperparamètres** : Réaliser une recherche systématique des hyperparamètres optimaux pour le modèle Random Forest

## 6. Conclusion

Cette étude a démontré l'efficacité des techniques d'apprentissage automatique, en particulier de l'algorithme Random Forest, pour la prédiction des prix de voitures d'occasion sur le marché marocain. En s'appuyant sur un ensemble de données collectées sur Avito.ma et un prétraitement rigoureux, le modèle développé atteint un coefficient de détermination élevé (R² ≈ 0.91) et une erreur quadratique moyenne relativement faible (RMSE ≈ 22000).

L'analyse de l'importance des caractéristiques a confirmé que la puissance fiscale, l'année de mise en circulation et le kilométrage sont les principaux déterminants du prix, en accord avec l'intuition et les pratiques du marché.

Les résultats de cette recherche ouvrent la voie à des applications pratiques dans le domaine de l'évaluation automobile et pourraient être étendus à d'autres marchés ou types de biens. Les limitations identifiées suggèrent des axes de recherche futurs pour affiner davantage la précision prédictive du modèle.