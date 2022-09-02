#!/bin/bash
# Ce script vient de github.com/mathis-r/mcserveur

# On vérifie que le script est éxecuté en tant que root :

haveperm()
{
	[ $USER = root ] && return 0 || return 1
}

# Même principe que pour list.sh : on envoie la commande que l'on veut au serveur

Main()
{
	haveperm && screen -S Minecraft -p 0 -X stuff "stop^M" || echo "Relancez le script avec sudo"
}

Main
