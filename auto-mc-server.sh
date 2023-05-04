#!/bin/bash

apt install openjdk-17-jdk openjdk-17-jre
sudo dpkg -i jdk-17.0.6_linux-x64_bin.deb
java -version


sudo apt install firewalld
sudo systemcd /ho   ccdctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-port=25565/tcp --permanent
sudo firewall-cmd --reload

cd /opt/minecraft/
sudo mkdir $1
cd $1


wget https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar
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