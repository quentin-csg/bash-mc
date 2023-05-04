#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 server-name"
    exit 1
fi

SERVER_NAME=$1
SERVER_DIR="/opt/minecraft/${SERVER_NAME}"
SERVER_JAR="server.jar"

# Créer le répertoire du serveur si nécessaire
if [ ! -d "${SERVER_DIR}" ]; then
    mkdir -p "${SERVER_DIR}"
fi

# Télécharger le fichier du serveur Minecraft si nécessaire
if [ ! -f "${SERVER_DIR}/${SERVER_JAR}" ]; then
    curl -o "${SERVER_DIR}/${SERVER_JAR}" https://launcher.mojang.com/v1/objects/8f7d743f50e7c7a2bcb44f702baeaa00c3629f4c/server.jar
fi

# Aller dans le répertoire du serveur
cd "${SERVER_DIR}"

# Accepter l'EULA
if [ ! -f "eula.txt" ]; then
    echo "eula=true" > eula.txt
fi

# Désactiver le mode en ligne
sed -i 's/online-mode=true/online-mode=false/g' server.properties

# Démarrer le serveur
java -Xmx1024M -Xms1024M -jar "${SERVER_JAR}"