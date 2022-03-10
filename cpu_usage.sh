#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
    ssh -T -n andrew@$server_ip "grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage \"%\"}'"
    echo ""
done < "${1}"
