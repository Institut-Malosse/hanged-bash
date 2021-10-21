# hanged-bash

## Guide d'utilisation 

Exécutez la commande suivante sur le fichier une fois que vous l'avez téléchargé pour le rendre exécutable :

`chmod +x pendu.sh`

Ensuite le programme se lance en ajoutant les paramètres comme ci-dessous :

`./pendu.sh [nombre de vie] [nombre de caractère minimum] [nombre de caractères maximum]`

## Requirements 

Le programme nécessite la présence du dictionnaire `/usr/share/dict/french`

Assurez vous de posséder le paquet. 

Sur Archlinux lancez la commande 

`sudo pacman -S words`

## Détails 

Le fichier converti automatiquement les accents en caractères standard et ignore les mots composés.

Attention à ne pas définir un interval de lettres min et max trop réduit, le script risque de prendre du temps avant de trouver le mot