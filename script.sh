#!/bin/bash

wget https://download.oracle.com/java/17/archive/jdk-17.0.6_linux-x64_bin.deb
sudo dpkg -i jjdk-17.0.6_linux-x64_bin.deb
java -version

https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar
java -jar server.jar

if [ -f eula.txt ]; then
    sed -i 's/eula=false/eula=true/g' eula.txt
else
    echo "file doesn't exist."
fi

if [ -f server.properties ]; then
    sed -i 's/online-mode=true/online-mode=true/g' server.properties
else
    echo "file doesn't exist."
fi

java -Xmx1024M -Xms1024M -jar server.jar