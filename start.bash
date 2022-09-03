#!/bin/bash
# Ce script vient de github.com/mathis-r/mcserveur

ram="2048M" # Remplacez cette valeur par la valeur maximum de mémoire que vous voulez donner à votre serveur.

have_perm()
{
	#On vérifie que le script est éxecuté avec les droits administrateurs
	[ "$USER" = root ] && return 0 || return 1
}

started()
{
	touch /tmp/serv.txt
	touch /tmp/motd.txt
	#On vérifie qu'aucun autre serveur ne tourne
	if [ -z "$(screen -ls | grep -o "No Sockets")" ]; then
		erreur
	else
		launch
	fi
	return 0	
}

erreur()
{
	echo "Un serveur tourne déjà"
	echo "MOTD du serveur :"
	cat /tmp/motd.txt
	list.sh 
	echo "Utilisez sudo stop.sh pour l'arrêter"
	return 0
}

launch()
{
	i=0
	re='^[+-]?[0-9]+([.][0-9]+)?$' # Expression régulière permettant d'identifier si un variable est un nombre
	listserv=($(ls -x /root/serveurs))
	echo "Entrez le numéro du serveur à démarrer : "
	while [ $i -lt ${#listserv[@]} ] # On fait la liste des dossiers sous /root/serveurs
	do				 # Ils contiennent les serveurs à démarrer
		echo $(expr $i + 1) ${listserv[i]}
		i=$(expr $i + 1)
	done
	read -p "Numéro : " num # Choix du serveur
	num=$(expr $num - 1)
	if ! [[ $num =~	$re ]] ; then
		echo "Entrez un nombre" >&2; exit 1
	elif [ $num -ge ${#listserv[@]} -o 0 -gt $num ]; then
		echo "Numéro trop grand ou trop petit!"
		return 0
	else
		serv=${listserv[$num]}
		# On enregistre quelques infos utiles (chemin du serveur, MOTD)
		path=/root/serveurs/$serv/
		echo "$path" > /tmp/serv.txt
		rm "$path"/screenlog.0
		grep "motd=" "$path"/server.properties | sed s/motd=//g > /tmp/motd.txt
		cd "$path" || exit
		#On démarre le serveur avec SCREEN :
		screen -L -dmS Minecraft /usr/bin/java -Xmx$ram -jar server.jar --nogui
		screen -S Minecraft -p 0 -X colon "logfile flush 0^M"
		screen -r
	fi
	return 0
}

Main()
{
	have_perm && started || echo "Relancez le script avec sudo"
	return 0
}


Main
