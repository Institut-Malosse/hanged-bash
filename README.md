# hanged-bash

## Guide d'utilisation 

Exécutez la commande suivante sur le fichier une fois que vous l'avez téléchargé pour le rendre exécutable :

`chmod +x pendu.sh`

Ensuite le programme se lance en ajoutant les paramètres comme ci-dessous :

`./pendu.sh [nombre de vie] [nombre de caractère minimum] [nombre de caractères maximum]`

## Requirements 

Le programme nécessite la présence du dictionnaire `/usr/share/dict/french`

Assurez vous de posséder le paquet. 

Sur **Archlinux** lancez la commande 

`sudo pacman -S words`


Sur **Debian/Ubuntu** lancez la commande

`sudo apt install wordlist` 

ou 

`sudo apt install wfrench`

Sur Fedora/RedHat/CentOS

`sudo dnf install words`

## Détails 

Le fichier converti automatiquement les accents en caractères standard et ignore les mots composés.

Attention à ne pas définir un interval de lettres min et max trop réduit, le script risque de prendre du temps avant de trouver le mot

Le code est entièrement commenté vous pouvez donc facilement le comprendre et le modifier à votre guise.

_Developed by Ahraon, Bernie, Bashi_