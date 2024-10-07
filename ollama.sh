#!/usr/bin/env bash
set -e

cat << "EOF"
        _ _                       
       | | |                      
   ___ | | | __ _ _ __ ___   __ _ 
  / _ \| | |/ _` | '_ ` _ \ / _` |
 | (_) | | | (_| | | | | | | (_| |
  \___/|_|_|\__,_|_| |_| |_|\__,_|

EOF

cat << EOF
Ollama Container Helper
v0.1 by Sébastien Dominguez
https://github.com/SebDominguez
===================================================

EOF

CYAN='\033[0;36m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Get the directory of the current script
DIR=$(dirname "$(readlink -f "$0")")

# Get the path of the docker-compose.yml file
COMPOSE_FILE=$DIR/docker-compose.yml

# Check if docker-compose exist. If it doesnt then we use docker compose instead
if command -v docker-compose &> /dev/null
then
    dccmd='docker-compose'
else
    dccmd='docker compose'
fi

function dockerComposeDown() {
    if [ $($dccmd ps | wc -l) -gt 2 ]; then
        $dccmd -f $COMPOSE_FILE down
    fi
}

# Functions
function restart() {
    dockerComposeDown
    dockerComposeUp
}

function dockerComposeUp() {
    $dccmd -f $COMPOSE_FILE up -d
}

function dockerPull() {
    $dccmd pull
}

function update() {
    dockerComposeDown
    dockerPull
    dockerComposeUp
}

function listModel(){
    docker exec -it ollama ollama list
}

function pullModel(){
    docker exec -it ollama ollama pull $1
}

function deleteModel(){
    docker exec -it ollama ollama rm $1
}

function listCommands() {
cat << EOT
Available commands:

start
stop
update
pullmodel
listmodel
deletemodel
help

EOT
}

# Commands

case $1 in
    "start")
        dockerComposeUp
        ;;
    "update")
        update
        ;;
    "restart")
        restart
        ;;
    "stop")
        dockerComposeDown
        ;;
    "listmodel")
        listModel
        ;;
    "pullmodel")
        pullModel "$2"
        ;;
    "deletemodel")
        deleteModel "$2"
        ;;
    "help")
        listCommands
        ;;
    *)
        echo "No command found."
        echo
        listCommands
esac
