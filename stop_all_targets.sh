#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
    server_processes=`echo $line | awk -F ";" '{print $2}'`

    scp "${2}" andrew@$server_ip:/home/andrew/ddos/targets.txt
ssh -T andrew@$server_ip <<_EOF_
  cd /home/andrew/ddos
  ./stop_all.sh
_EOF_
#    echo "Params: $server_ip --- $server_processes"

    echo "Server: $line. Done"
    echo ""
#   docker run --platform linux/amd64 -d  alpine/bombardier -c "${2:-500}" -d 60000h -l "$line"
done < "${1}"


