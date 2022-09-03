# mcserveur
Un groupe de scripts permettant de lancer, d'arrêter, de créer des serveurs Minecraft.
Les scripts utilisent SCREEN pour permettre de détacher le serveur d'un terminal / session ssh mais aussi pour envoyer des commandes au serveur depuis un bot telegram/discord

Si vous souhaitez utiliser un server.jar **non officiel** (spigot ou autre), le script pourrait ne pas marcher, ou certaines fonctions du .jar pourraient ne pas fonctionner à cause de screen : je ne l'ai tester qu'avec les .jar de minecraft.net

---

## Dépendances
- java (pour minecraft)
- screen
- bash
- coreutils (cat, tail, sleep, touch, mkdir, echo, grep, sed)

## Installation
- `git clone https://github.com/mathis-r/mcserveur`
- `cd mcserveur`
- Modifiez le fichier start.bash : à la ligne 4, changez la valeur de la variable `ram` pour le maximum que vous voulez donner à votre serveur 
- `sudo chmod +x install.sh`
- `sudo ./install.sh` 

C'est fait !

## Désinstallation
- `sudo uninstall.sh`

C'est fait !

Vos serveurs ne sont pas affectés par la désinstallation des scripts

Les différents serveurs sont des dossiers sous /root/serveurs
Tous les serveurs sont lancés avec root, ce qui permet un simple `sudo stop.sh` pour arrêter le serveur, peu importe l'utilisateur (s'il peut utiliser sudo). Cela permet d'arrêter facilement un serveur à distance, avec un autre script par exemple.

## Utilisation
### Créer un serveur
- `sudo mkdir /root/serveurs/*nomduserveur*`
- ajouter un server.jar, téléchargé sur le site de minecraft ou ailleurs
- lancez le une première fois : `sudo start.sh` il s'arrête peu après
- éditez le fichier "eula.txt" et changez la valeur false -> true
- éditez le fichier server.properties
- Vous pouvez à présent relancer le serveur : `sudo start.sh` Le monde va se générer (peut prendre du temps) puis vous pourrez le rejoindre

### Utiliser SCREEN
Détacher un screen : 'Ctrl + a' puis 'd'

Attacher un screen : sudo screen -r

Arreter le serveur depuis screen : `stop` ou `/stop` (fonctionne aussi avec toutes les commandes minecraft)

Arrêter le serveur depuis bash : `sudo stop.sh`
                   
Si vous souhaitez lire les logs plus anciennes du serveur qui tourne (mais les logs de cette session, qui n'est plus visible car les nouvelles ont pris l'écran du serveur), faites `sudo less /root/serveurs/*nomduserveur*/screenlog.0`

Les logs des anciennes sessions sont dans le dossier "logs" du serveur minecraft.
