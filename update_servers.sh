#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
ssh -T andrew@$server_ip <<_EOF_
  cd /home/andrew/ddos
  git pull
_EOF_

    echo "Server: $line. Done"
    echo "\n";
#   docker run --platform linux/amd64 -d  alpine/bombardier -c "${2:-500}" -d 60000h -l "$line"
done < "${1}"


