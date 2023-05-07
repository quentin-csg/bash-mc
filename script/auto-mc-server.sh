#!/bin/bash

sudo apt install openjdk-17-jdk openjdk-17-jre -y
sudo dpkg -i jdk-17.0.6_linux-x64_bin.deb 
java -version


sudo apt install firewalld -y
sudo systemcd /ho   ccdctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-port=25565/tcp --permanent
sudo firewall-cmd --reload

SERVER_DIR="/opt/minecraft/$1"

if [ ! -d "${SERVER_DIR}" ]; then
    mkdir -p "${SERVER_DIR}"
fi

cd /opt/minecraft/$1
wget https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar

java -jar server.jar

if [ -f eula.txt ]; then
    sudo sed -i 's/eula=false/eula=true/g' eula.txt
else
    echo "file doesn't exist."
fi
ls
if [ -f server.properties ]; then
    sudo sed -i 's/online-mode=true/online-mode=false/g' server.properties
    sudo sed -i 's/motd=A Minecraft Server/motd='"$1"'/g' server.properties
else
    echo "file doesn't exist."
fi

java -Xmx1024M -Xms1024M -jar server.jar