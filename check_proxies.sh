#!/usr/bin/env bash

while IFS= read -r line; do
    server_ip=`echo $line | awk -F ":" '{print $1}'`
    server_port=`echo $line | awk -F ":" '{print $2}'`
    nc -vz -w 5 $server_ip $server_port
done < "${1}"