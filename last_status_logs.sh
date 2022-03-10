#!/usr/bin/env bash

while IFS= read -r line; do
    server_ip=`echo $line | awk -F ";" '{print $1}'`


    ssh -T -n andrew@$server_ip "docker inspect --format='{{.LogPath}}' $container_id"
done < "${1}"


