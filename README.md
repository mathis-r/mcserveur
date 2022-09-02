# mcserveur
Un groupe de scripts permettant de lancer, d'arrêter, de créer des serveurs Minecraft.
Les scripts utilisent SCREEN pour permettre de détacher le serveur d'un terminal / session ssh mais aussi pour envoyer des commandes au serveur depuis un bot telegram/discord

---

## Installation
### Dépendances
- java (pour minecraft)
- screen
- bash
- coreutils (cat, tail, sleep, touch, mkdir, echo, grep, sed)

Les différents serveurs sont des dossiers sous /root/serveurs
Tous les serveurs sont lancés avec root, ce qui permet un simple `sudo stop.sh` pour arrêter le serveur, peu importe l'utilisateur (s'il peut utiliser sudo). Cela permet d'arrêter facilement un serveur à distance, avec un autre script par exemple.
