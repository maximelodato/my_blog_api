
Voici un exemple de fichier README.md pour votre projet :

Rails API - Blog Application
Description
Ce projet est réalisé dans le cadre d'un cours et constitue un exercice pratique pour apprendre à utiliser Ruby on Rails en tant qu'API. L'application met en œuvre un système de blog avec des fonctionnalités de gestion d'articles, de commentaires, et une authentification basée sur JWT grâce à la gem Devise.

Fonctionnalités
Authentification :

Inscription, connexion, déconnexion via Devise et JWT.
Gestion des utilisateurs avec des routes protégées.
Gestion des articles :

Création, consultation, mise à jour et suppression des articles.
Les articles sont liés à leurs auteurs (utilisateurs authentifiés).
Gestion des commentaires :

Ajout de commentaires sur les articles.
Modification et suppression réservées aux auteurs des commentaires.
Gestion des photos :

CRUD complet pour les photos liées aux utilisateurs.
Objectifs pédagogiques
Comprendre et configurer une API en mode Rails uniquement.
Implémenter un système d'authentification basé sur des tokens JWT.
Gérer les relations entre les modèles dans une base de données.
Protéger les routes et restreindre l'accès aux ressources.
Tester les endpoints avec des outils comme curl ou Postman.
Prérequis
Ruby version 3.x.x ou supérieure.
Rails version 7.x.x ou supérieure.
Base de données PostgreSQL ou SQLite3.



Endpoints principaux
Authentification :

Inscription : POST /users
Connexion : POST /users/sign_in
Déconnexion : DELETE /users/sign_out
Articles :

Liste des articles : GET /articles
Détails d'un article : GET /articles/:id
Créer un article : POST /articles (authentification requise)
Mettre à jour un article : PATCH /articles/:id (auteur uniquement)
Supprimer un article : DELETE /articles/:id (auteur uniquement)
Commentaires :

Liste des commentaires d'un article : GET /articles/:article_id/comments
Ajouter un commentaire : POST /articles/:article_id/comments (authentification requise)
Modifier un commentaire : PATCH /articles/:article_id/comments/:id (auteur uniquement)
Supprimer un commentaire : DELETE /articles/:article_id/comments/:id (auteur uniquement)
Photos :

Liste des photos : GET /photos
Ajouter une photo : POST /photos (authentification requise)



Voici un exemple de fichier README.md pour votre projet :

Rails API - Blog Application
Description
Ce projet est réalisé dans le cadre d'un cours et constitue un exercice pratique pour apprendre à utiliser Ruby on Rails en tant qu'API. L'application met en œuvre un système de blog avec des fonctionnalités de gestion d'articles, de commentaires, et une authentification basée sur JWT grâce à la gem Devise.

Fonctionnalités
Authentification :

Inscription, connexion, déconnexion via Devise et JWT.
Gestion des utilisateurs avec des routes protégées.
Gestion des articles :

Création, consultation, mise à jour et suppression des articles.
Les articles sont liés à leurs auteurs (utilisateurs authentifiés).
Gestion des commentaires :

Ajout de commentaires sur les articles.
Modification et suppression réservées aux auteurs des commentaires.
Gestion des photos :

CRUD complet pour les photos liées aux utilisateurs.
Objectifs pédagogiques
Comprendre et configurer une API en mode Rails uniquement.
Implémenter un système d'authentification basé sur des tokens JWT.
Gérer les relations entre les modèles dans une base de données.
Protéger les routes et restreindre l'accès aux ressources.
Tester les endpoints avec des outils comme curl ou Postman.
Prérequis
Ruby version 3.x.x ou supérieure.
Rails version 7.x.x ou supérieure.
Base de données PostgreSQL ou SQLite3.
Installation
Clonez le dépôt :

bash
Copier le code
git clone <lien-du-repo>
cd my_blog_api
Installez les dépendances :

bash
Copier le code
bundle install
Configurez la base de données :

bash
Copier le code
rails db:create
rails db:migrate
(Facultatif) Ajoutez des données initiales :

bash
Copier le code
rails db:seed
Lancez le serveur :

bash
Copier le code
rails server
Utilisation
Endpoints principaux
Authentification :

Inscription : POST /users
Connexion : POST /users/sign_in
Déconnexion : DELETE /users/sign_out
Articles :

Liste des articles : GET /articles
Détails d'un article : GET /articles/:id
Créer un article : POST /articles (authentification requise)
Mettre à jour un article : PATCH /articles/:id (auteur uniquement)
Supprimer un article : DELETE /articles/:id (auteur uniquement)
Commentaires :

Liste des commentaires d'un article : GET /articles/:article_id/comments
Ajouter un commentaire : POST /articles/:article_id/comments (authentification requise)
Modifier un commentaire : PATCH /articles/:article_id/comments/:id (auteur uniquement)
Supprimer un commentaire : DELETE /articles/:article_id/comments/:id (auteur uniquement)
Photos :

Liste des photos : GET /photos
Ajouter une photo : POST /photos (authentification requise)
Tester l'API
Avec cURL
Exemple pour obtenir la liste des articles :

bash
Copier le code
curl -X GET http://127.0.0.1:3000/articles
Exemple pour créer un article (authentification requise) :

bash
Copier le code
curl -X POST -H "Authorization: Bearer <votre_token_jwt>" \
-H "Content-Type: application/json" \
-d '{"article": {"title": "Titre de l'article", "content": "Contenu de l'article"}}' \
http://127.0.0.1:3000/articles
Avec Postman ou Insomnia
Créez une requête POST, GET, ou autre selon le besoin.
Configurez l'URL (par exemple, http://127.0.0.1:3000/articles).
Ajoutez les en-têtes nécessaires, comme Authorization pour les endpoints protégés.
Envoyez la requête et observez les réponses JSON.
Structure du projet
app/models/ : Modèles pour les utilisateurs, articles, commentaires, photos.
app/controllers/ : Contrôleurs pour les endpoints.
config/routes.rb : Définition des routes de l'API.
db/ : Migrations et schéma de la base de données.
Remarque
Ce projet est réalisé dans un cadre pédagogique et n'est pas destiné à être utilisé en production. Des améliorations, notamment en termes de sécurité et de gestion des erreurs, peuvent être nécessaires pour une utilisation réelle.

