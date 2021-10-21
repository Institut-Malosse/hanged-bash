# hanged-bash

## Guide d'utilisation 

Exécutez la commande suivant sur le fichier une fois que vous l'avez télécharger pour le rendre exécutable :

`chmod +x pendu.sh`

Ensuite le programme se lance en ajoutant les paramètres qui ci-dessous :

`./pendu.sh [nombre de vie] [nombre de caractère minimum] [nombre de caractères maximum]`

## Détails 

Le programme nécessite la présence du dictionnaire `/usr/share/dict/french`

Assurez vous de posséder le paquet. 

Sur Archlinux lancez la commande 

`sudo pacman -S words`

Le fichier converti automatiquement les accents en caractères standard et ignore les mots composés.