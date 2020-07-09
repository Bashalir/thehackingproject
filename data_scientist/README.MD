
## 1. Introduction

Dans ce projet, tu vas manipuler des arrays et des hashs contenant des centaines d'éléments, le tout via un programme dans un dossier Ruby bien rangé. Ce sera une excellente introduction aux programmes un peu plus funkys que tu verras la semaine prochaine.

Tu commenceras par créer un dossier Ruby et préparer le premier programme. Ensuite nous allons te donner une liste de journalistes sur laquelle tu devras faire des opérations. Enfin, nous allons te donner deux listes à transformer en un hash géant, que tu manipuleras ensuite.
## 2. Le projet
### 2.1. Un dossier

Crée donc un repo GitHub dans lequel tu auras la structure suivante :

ton_dossier
├── lib
│   ├── 00_journalists.rb
│   └── 01_cryptocurrencies.rb
└── README.md

### 2.2. Big data

Avec ton groupe, vous avez entendu parler d'un concept qui marche bien nommé le Big Data. Vous vous êtes chauffés pour vous lancer dedans et proposer des prestations de conseil facturées à des prix indécents. Grâce à vos super compétences en réalisation de Landing Pages, vous avez déjà votre premier client : une entreprise de Growth Hacking. Cette dernière a obtenu une liste de plusieurs centaines de comptes Twitter qu'ils voudraient analyser.


À partir de cette array, code un programme ruby qui répondra aux questions suivantes :

    Combien y a-t-il de handle dans cette array ?
    Quelle est le handle le plus court de cette liste ?
    Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)
    Combien commencent par une majuscule (première lettre juste après le @) ?
    Trie la liste de handle par ordre alphabétique.
    Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)
    Quelle est la position dans l'array de la personne @epenser ?
    Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)

Si tu as bien compris, quand tu lances le script, les réponses aux questions s'affichent sur ton écran de Terminal via des puts. N'hésite pas à ajouter un peu de pep’s à ton programme en écrivant des phrases, en ajoutant des blagues, voir en faisant un menu (pour les plus chauds) où l'utilisateur peut choisir, dans une liste, la question à laquelle le programme va répondre.

## 2.3. Blockchain

Après le succès de votre firme, vous vous êtes dits que vous pourriez mélanger deux fois plus de buzzwords et faire une firme qui fait de la big data sur de la blockchain. Votre idée est en train de disrupter le consulting et tous les grands groupes en quête de digitalisation veulent faire appel à vos services. Vous venez de signer un contrat pour Carrefour.io et vous allez devoir analyser des données de cryptomonnaies.

Maintenant on va travailler avec des hash. Voici deux arrays, un qui contient des noms de devise, un qui contient des prix.

Associe chaque devise à son montant pour obtenir un hash du genre :

my_hash = {Bitcoin: 6558.07, Ethereum: 468.95, XRP: 0.487526, etc.}

Hint : Il est entièrement possible de le faire "à la main" via une boucle, mais je t'invite à chercher s’il n'existe pas une méthode Ruby spécialement pour ça 😉.

Une fois cette association réalisée, code un programme Ruby pour donner :

    La ou les crypto qui ont la plus grosse valeur.
    La ou les crypto qui ont la plus petite valeur.
    Les devises dont le cours est inférieur à 6000
    La devise la plus chère parmi celles dont le cours est inférieur à 6000.

## 3. Rendu attendu

Ton rendu sera un repo GitHub respectant la structure donnée en 2.1.

Chaque programme doit permettre aux correcteurs de répondre à toutes les questions listées. Bon courage !
