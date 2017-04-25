#!/bin/sh

echo "mode: $1"
CONTAINER_ID=`docker container ls | grep -e mariadb-$1 | awk '{print $1}'`

docker container exec -it $CONTAINER_ID mysql -uroot -p
