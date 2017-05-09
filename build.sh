#!/bin/sh

if [ $# -eq 0 ];then
    echo "tag version required"
    exit 1;
fi

aprint() {
    echo "$(tput setaf 3)>>> $1 $(tput sgr0)"
}

aprint "build manager... "; 
docker build docker/manager --tag mariadb-manager:$1
aprint "Finish build";
sleep 3 

aprint "build node... "; 
docker build docker/node --tag mariadb-node:$1
aprint "Finsih build";