#!/usr/bin/env bash

while IFS= read -r line; do
    ssh -T -n andrew@"${1}" "docker logs $line"
done < "${2}"


