# Automatisation de création d'un serveur minecraft

## Requis pour l'installation:

Debian11 et avoir les packets git installé
````
sudo apt install git
````

Installation:

````
git clone https://github.com/bash-mc.git

cd /bash-mc
````

Rendre le script exécutable
````
chmod 744 auto-mc-server.sh
````

Lancer le script en mettant en argument le nom que vous voulez donner au serveur Minecraft
````
sudo ./auto-mc-server.sh nom
````

Pour se connecter au serveur sur Minecraft:
- récupérer l'ip de la machine sur laquelle tourne le serveur Minecraft et ajouter le port 25565 (ip:25565)

