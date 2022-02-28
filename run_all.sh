#!/bin/bash

docker kill `docker ps -q`

while IFS= read -r line; do
   docker run --platform linux/amd64 -d  alpine/bombardier -c 300 -d 60000h -l "$line"
done < resources.txt