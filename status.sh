#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
    ssh -T -n andrew@$server_ip "docker ps --no-trunc"
    echo "Server: $line. Done"
    echo ""
done < "${1}"


