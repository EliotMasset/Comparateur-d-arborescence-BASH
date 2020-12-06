	
     `````````)~\\~\     <_p_
       ````````)^\))\)) </  @\
  V      ````)))\~||~||</ /^`-'
 VVV   __       -\ \\--/ /
VVVVV<'  \\___/  )    .  )'              _
VVVVVV    `====\ _~~~))   ~~/\\         | |   /\
 """"""""""""""""""""""""""""""""\  Y   |  \__| \        Y
                                  \~~~~/         |~Y~~~~~~~~
 ^^^^^^^^^^^^^^^^^^^^^^^^^\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

_______________________________________________________________________________
    ____                                       ____     __       __     _     _
    /    )                   ,                 /   )    / |    /    )   /    / 
---/____/---)__----__------------__--_/_------/__ /----/__|----\-------/___ /--
  /        /   ) /   )     /   /___) /       /    )   /   |     \     /    /   
_/________/_____(___/_____/___(___ _(_ _____/____/___/____|_(____/___/____/____
                         /                                                     
                     (_ /                                                      
_______________________________________________________________________________

Réalisé par:
Eliot Masset
Ikarionen Maxène
Di Piaza Hugo

Pour tester le programme veuillez suivre les instructions suivantes :

_Ouvrir le terminal (Linux: Terminal, Windows: Cygwin(http://cygwin.com/setup-x86_64.exe))

_Rendez-vous sur le répertoire du logiciel :
                                            _--> cd <Répertoire>
                                            _ exemple: --> cd /home/projet-fr

_Lancez le programme avec la commande ci-suivante :

--> bash projet-bash.sh <chemin vers le premier répertoire> <chemin vers le second répertoire>
Ou
--> bash projet-bash.sh

Dans le cas de la seconde commande, on vous demanderas les 2 chemins en amont dans le programme

_On vous demanderas ensuite si vous souhaitez la version complête du programme ou non, vous n'aurez qu'à tappez au clavier le numéro 0 ou 1 celon votre choix. La confirmation ce fait avec la touche entrée de votre clavier.

_Il vous seras ensuite possible d'indiquez au programme le répertoire ou vous voudriez avoir les informations sous forme de fichier texte (md5.txt). Vous pourrez passer cette étapes avec le nombre 0.

_Le programme ce lance, les différentes étapes correspondes à la recherche d'erreurs :

             _étape 1: Vérifie que vous ayez bien mis 2 chemins en paramètre de votre commande, dans le cas échéant, on vous redemande les chemins
             _étape 2: Vérifie que la première arborescence est un répertoire.
             _étape 3: Vérifie que la seconde arborescence est un répertoire.
             _étape 4: Vérifie que la première arborescence n'est pas vide, sinon il est inutile de la comparer.
             _étape 5: Vérifie que la seconde arborescence n'est pas vide, sinon il est inutile de la comparer.
             _étape 6: Vérifie que les arborescences ont les droit de lecture, sinon il seras impossible au programme de les comparer.

_Il seras ensuite affiché :

             _Le trie des fichiers et dossier en fonction de leurs empreintes md5(https://fr.wikipedia.org/wiki/MD5) pour chaque arborescences.
   (en même /_Les fichiers et dossiers qui sont dans une arborescence et pas dans l'autre.
    temps)  \_Les fichiers et dossiers d'une arborescence, dont leurs empreintes md5 apparait dans l'autre arborescence.
             _Le nombre de fichiers et dossiers différents entre les deux arborescences.
Information : La première et deuxième étape n'apparaissent que dans la version complête.

_Il vous seras finalement indiquez si les deux arborescences sont identiques ou différentes.



En cas de problème n'hésiter pas à nous contacter par mail à l'adresse : eliotmasset@gmail.com ou par message au : 07.83.08.71.74


