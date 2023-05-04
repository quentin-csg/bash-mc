#!/bin/bash

apt install openjdk-17-jdk openjdk-17-jre
sudo dpkg -i jdk-17.0.6_linux-x64_bin.deb
java -version


sudo apt install firewalld
sudo systemcd /ho   ccdctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-port=25565/tcp --permanent
sudo firewall-cmd --reload

SERVER_DIR="/opt/minecraft/$1"

if [ ! -d "${SERVER_DIR}" ]; then
    mkdir -p "${SERVER_DIR}"
fi

# Télécharger le fichier du serveur Minecraft si nécessaire
if [ ! -f "${SERVER_DIR}/server.jar" ]; then
    wget "${SERVER_DIR}/server.jar" https://launcher.mojang.com/v1/objects/8f7d743f50e7c7a2bcb44f702baeaa00c3629f4c/server.jar
fi

cd /opt/minecraft/$1
java -jar server.jar

if [ -f eula.txt ]; then
    sed -i 's/eula=false/eula=true/g' eula.txt
else
    echo "file doesn't exist."
fi

if [ -f server.properties ]; then
    sed -i 's/online-mode=true/online-mode=false/g' server.properties
    sed -i 's/motd=^motd=.*/motd='"$1"'/g' server.properties
else
    echo "file doesn't exist."
fi

java -Xmx1024M -Xms1024M -jar server.jar