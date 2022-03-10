#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
ssh -T andrew@$server_ip <<_EOF_
  cd /home/andrew/ddos
  git pull
_EOF_

    echo "Server: $line. Done"
    echo "";
done < "${1}"


