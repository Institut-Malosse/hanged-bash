#!/usr/bin/env bash

# Création de la fonction usage qui contient les consignes
# d'utilisation du script

usage() {
	echo "$0 Nombre_de_vie Nombre_mini_de_caractère Nombre_maxi_de_caractère"
	echo ""
	echo "Merci de relancer la commande avec les paramètres correct"
}

# Création de la fonction Pendu qui contient le jeu

pendu() {
	nb_caractere=0
	# Récupération du nombre de mot dans le dictionnaire en 
	# enlevant les mots composés et les mots avec des apostrophes
	while [ $nb_caractere -lt $nb_min_car ] || [ $nb_caractere -gt $nb_max_car ]
	do
		nbmot=`cat /usr/share/dict/french | grep -v "-" | grep -v "'" | wc -l`

		# Génération d'un chiffre aléatoire compris entre
		# 1 et le nombre de mot précédement trouvé 

		ligne_du_mot=`echo $((1 + $RANDOM % $nbmot))`

		# Récupération du mot à deviner en le greppant grace 
		# à son numéro de ligne

		mot_a_deviner=`grep -v "-" /usr/share/dict/french | grep -v "'" | cat -n | grep -w "$ligne_du_mot" | awk -F' ' '{print $2}' | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ/aaaaeeeeiiiioooouuuuüüüü/"`
		
		# On récupère le nombre de caractère dans un variable

		nb_caractere=${#mot_a_deviner}
		# On fait une boucle for avec i comme variable d'itération
		# On passera autant de fois qu'il y a de caractères
		# dans le mot choisit
	done 

	for ((i=0 ; i<$nb_caractere ; i++))
	do
		# On crée des variables, chacune étant un point pour 
		# chaque caractère

		lettre_p[$i]='.'

		# On créer la chaine de caractères composée de point
		# pour être affiché à l'utilisateur 

		mot_cache=$mot_cache${lettre_p[$i]}

	done

	# On créer une boule while afin d'executer le code 
	# jusqu'à ce que l'utilisateur n'ai plus d'essais

	while [ $essai_restant != 0 ]
	do
		# On afficher le mot avec les caractères révélés
		# et des points à la place des caractères encore 
		# à deviner

		printf "$mot_cache \n Il vous reste $essai_restant / $essai_max  essais \n"

		# On récupère l'input de l'utilisateur 

		read -p 'Proposez une lettre : ' input_user

		# On initialise la variable juste a false, elle 
		# servira à savoir si l'utilisateur a trouvé une lettre

		juste=false

		# On créer un boucle for qui parcours le mot 
		# caractère par caractère

		for ((j=0 ; j<$nb_caractere ; j++))
		do

			# On check si la valeur de l'utilisateur est une 
			# lettre qui se trouve dans le mot en parcourant 
			# chaque lettre

			if [ $input_user == ${mot_a_deviner:$j:1} ]
			then

				# On met juste a true pour indiquer que
				# l'utilisateur a trouvé une lettre

				juste=true

				# On remplace le point par la lettre trouvée

				mot_cache="${mot_cache:0:j}$input_user${mot_cache:j+1}"

				# Si la variable mot__cache ne contient pas 
				# de point, cela signifie que l'utilisateur 
				# a gagné 

				if [[ $mot_cache != *'.'* ]]
				then 

					# On félicite le joueur et on quitte le programme
					echo "Bien joué ! Le mot était $mot_cache"
					exit 0
				fi
			fi
		done

		# Si l'utilisateur n'a pas trouvé de bonne
		# lettre, on lui retire une vie

		if [ $juste == false ]
		then

		essai_restant=$((essai_restant-1))

		fi

	done

	# Si l'utilisateur n'a plus de vie, on lui affiche
	# Le mot qu'il devait deviner

	if [ $essai_restant == 0 ]
	then
		echo "Tu as perdu ! Le mot était $mot_a_deviner"
	fi
}

# En cas de mauvaise utilisation de la commande,
# on affiche l'aide à l'utilisateur

[[ $# -lt 3 ]] && usage
[[ $# -lt 3 ]] && exit 0

# On récupère les valeurs en entrée et on les affecte

essai_restant=$1
essai_max=$1
nb_min_car=$2
nb_max_car=$3

# On lance le pendu 

pendu
exit 0