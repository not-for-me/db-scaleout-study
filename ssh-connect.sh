#!/bin/bash

declare -a container_id;
declare -a service_name;

ssh-interconnect() {
    local ssh_init_path=/root/scripts/ssh-init.sh
    local ssh_pass_path=/root/scripts/ssh-pass.sh
    for con in $(docker-compose ps | sed -n '3,$p' | sed -n '/Up/p' | awk '{print $1}'); do
        cid=$(docker ps | grep "$con" | awk '{print $1}')
        container_id+=( "$cid" )
        service_name+=("$(docker inspect "$cid" | sed -n 's/\"com\.docker\.compose\.service\": \"//gp' \
            | sed -n 's/\",//gp')")
    done

    for c_id in ${container_id[*]}; do
        echo "$c_id initializing SSH..."
        docker exec "$c_id" "$ssh_init_path"
    done

    for c_id in ${container_id[*]}; do
        for c_name in ${service_name[*]}; do
            docker exec "$c_id" "$ssh_pass_path" "$c_name"
        done
    done
}

ssh-interconnect