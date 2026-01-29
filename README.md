#Libri

Application mobile avec Flutter permettant de gérer les lectures où on peut :
  - Ajouter les livres que tu as déjà lus
  - Ajouter les livres que tu veux lire dans une wishlist
  - Supprimer des livres
  - Créer un compte utilisateur avec Firebase Auth
  - Sauvegarder les données de chaque utilisateur dans Firestore

#Fonctionnalités 
Gestion des livres lus :
  - Titre, auteur, description et note.
  - Liste en temps réel avec possibilité de supprimer un livre
Wishlist :
  - Titre et auteur des livres qu'on veut lire
Suppression possible
Authentification
Création de compte avec email et mot de passe
Connexion / Déconnexion
Stockage Cloud
Firebase Firestore pour les données des livres
UI / UX
Accueil avec titre centré
Boutons larges et colorés pour les listes
Bouton déconnexion rouge en bas

#Technologies utilisées
  - Flutter : développement multiplateforme Android & iOS
  - Firebase : Auth, Firestore, Storage
  - Dart : langage principal
  - firebase_auth, cloud_firestore
  - flutter_launcher_icons pour l’icône de l’application

#Installation
  - Clone le projet :
git clone https://github.com/ton-utilisateur/libri.git
cd libri
  - Installe les dépendances Flutter :
flutter pub get
  - Configure Firebase :
Crée un projet Firebase
Télécharge google-services.json pour Android
Place-le dans android/app/
  - Lance l’application sur un émulateur ou appareil :
flutter run
Build APK
  - Pour générer un APK debug :
flutter build apk --debug


# Structure du projet
lib/
 ├─ main.dart             # Point d'entrée
 ├─ screens/
 │   ├─ auth/             # Connexion / Inscription
 │   ├─ lus/              # Livres lus
 │   └─ alire/            # Wishlist
 ├─ models/               # Modèles de données (Livre, ReadBook)
 └─ services/             # FirestoreService pour la DB
icon/
 └─ lib_icon.png              # Icône de l'application

#Auteur
Anis – Étudiant en informatique
email : abdatanis2002@gmail.com
