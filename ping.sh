#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
    ssh -T -n andrew@$server_ip "ping -c 1 80.78.249.141"
    echo "Server: $line. Done"
    echo ""
done < "${1}"


