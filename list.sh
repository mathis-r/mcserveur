#!/bin/sh
# Ce script vient de github.com/mathis-r/mcserveur

path=$(cat /tmp/serv.txt)
# Voici comment on envoie une commande au serveur avec screen
screen -S Minecraft -p 0 -X stuff "list^M"
# On attend un peu
sleep 1
# On récupère la réponse
tail -n2 $path/screenlog.0 | grep -o "There.*$"
