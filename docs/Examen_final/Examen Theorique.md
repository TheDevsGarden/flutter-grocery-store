# Partie Théorique (35pts)

## Choix de réponse (10 pts)

1. Qu'est-ce que Firebase Authentification ?
   b) Un service d'authentification en temps réel

2. Qu'est-ce que Firebase Firestore ?
   b) Une base de données cloud NoSQL en temps réel

3. Que permet de faire la bibliothèque "shared_preferences" dans Flutter ?
   a) Stocker des données de manière persistante sur l'appareil de l'utilisateur

4. Quelle est la principale différence entre "shared_preferences" et Firebase Firestore pour le
   stockage de données ?
   a) "shared_preferences" est principalement destiné au stockage local des données, tandis que
   Firebase Firestore est une base de données cloud
5. Qu'est-ce qu'un "Future" en Dart ?
   a) Une classe qui représente une valeur potentiellement disponible dans le futur
6. Que signifie le mot-clé « async » dans une fonction Dart ?
   b) La fonction est asynchrone et peut retourner un « Future »
7. Comment pouvez-vous déclarer un membre de classe comme privé en Dart ?
   a) En le préfixant avec le mot-clé « private »
   de plus il est une bonne pratique (visuelle uniquement) de mettre un underscore Cela serla lisible pour les autres membres l'équipe.
8. Comment pouvez-vous déclarer un membre de classe comme public en Dart (c'est-à-dire
   accessible depuis d'autres classes) ?
   a) En le préfixant avec le mot-clé « public »
9. Dans Dart, qu'est-ce qu'un constructeur nommé ?
   c) Un constructeur qui a un nom spécifique et est utilisé pour créer des instances de classe
   personnalisées.
10. Dans Dart, que fait le mot-clé « required » lorsqu'il est utilisé dans la déclaration d'un
    paramètre de fonction ou de constructeur ?
    c) Il indique que le paramètre est obligatoire et doit être fourni lors de l'appel de la fonction ou
    du constructeur.

## Association terme et définition (15 pts)

A) Le langage de programmation utilisé par Flutter // DART
B) Une structure de programmation qui définit un
modèle pour créer des objets // Classe
C) Un framework open-source de développement
d'applications multiplateformes // Flutter
D) Un mot-clé utilisé à l'intérieur d'une fonction
asynchrone pour attendre qu'une opération
asynchrone se termine et récupérer son résultat avant
de continuer l'exécution du code. // Await
E) Un fichier de configuration dans un projet Flutter qui
spécifie les dépendances, les ressources, etc //pubspec.yaml
F) Un système de gestion de build // Gradle
G) Les fichiers statiques, tels que des images, des
fichiers audio, ou des polices de caractères //Assets
H) Une commande en ligne permettant d'exécuter une
application Flutter //flutter run
I) le point d'entrée de l'application où l'exécution
commence //main
J) Un widget de haut niveau dans Flutter qui défini les
paramètres globaux de l'application, tels que le thème,
la langue et la navigation //MaterialApp
K) Un élément de base de l'interface utilisateur dans
Flutter // Widget
L) Un environnement de développement intégré // Visual Studio Code
M) Un widget Flutter qui définit la structure de base
d'une page, y compris l'app bar, le contenu et le fond //Scaffold
N) Un widget Flutter qui représente la barre
d'application en haut de l'écran //AppBar
O) Un mot-clé utilisé pour définir une fonction qui peut
effectuer des opérations en arrière-plan sans bloquer
l'exécution du programme principal. // async
P) Un objet Dart qui représente une valeur ou une
erreur qui peut être disponible dans le futur //Future

## Remplir les blancs (10pts)

1. Donner moi la ligne de commande qui permettra d’afficher tous les émulateurs
   disponibles avec flutter

Flutter emulators

2. Donner moi la ligne commande qui permet de démarrer notre application en utilisant
   un émulateur avec l’identifiant « Pixel_6_XL_1 »

flutter run -e Pixel_6_XL_1

3. Si vous avez un problème avec votre installation flutter, vous pouvez exécuter un
   diagnostic avec quelle ligne de commande?

flutter doctor

4. Lorsque vous démarrez un projet, quelle commande vous permet de créer votre projet
   flutter?

flutter create myapp
Personnellement je passe par le GUI de Android Studio et je m'assure d'avoir Gradle 8.3.

5. Quelle information firebase nous demande afin d’enregistrer notre application Android
   à ses services.

en cliquant '+' dans Firebase, ça nous demande le nom. Next en décochant analytiques. On termine ce menu et puis omn arrive sur une page d'accueil. Après on clique sur in incone Android qui ouvre la page `Add Firebase to your Android app` ou on est demandé le package name:

        applicationId "com.example.test_flutter"

un Nickname (optionnel)

et un SHA-1 (optionnel)

C'est le package name qui est obligatoire et donc, pour répondre à la question: le package name
