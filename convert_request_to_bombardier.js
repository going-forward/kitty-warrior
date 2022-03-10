const connections = 1;
const duration = '5s';

const method = 'POST';
const url = 'http://localhost:9999/authorize';

const headers = `User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:97.0) Gecko/20100101 Firefox/97.0
Accept: image/avif,image/webp,*/*
Accept-Language: ru-RU,ru;q=0.5
Accept-Encoding: gzip, deflate
Referer: https://www.google.com/
Sec-Fetch-Dest: image
Sec-Fetch-Mode: no-cors
Sec-Fetch-Site: same-site
Te: trailers
Content-Type: application/x-www-form-urlencoded`

const body = "version=3.0&pan=YWFhYWFhYWE=&expiry=YWFhYWFhYQ==&deviceCategory=0&purchAmount=100&purchaseDate=20220308+14:11:11&exponent=2&description=aaaaa&currency=643&merchantID=wildberries&merchantCountry=643&xid=MTIzNDEyMzQzMjE0&recurFreq=&recurEnd=&installments=&okUrl=https://ds1.mirconnect.ru/vbv/pareq&failUrl=https://ds1.mirconnect.ru/vbv/pareq&merchantName=wildberries&acqBIN=546901&merchantUrl=http://wildberries.ru/&dsMerchantId=20000000&utid=14999999&digest=YWFhYWFhYWFhYWFh&lastEventGmtTime=2022-03-08+14:11:11.123"


const parseHeaders = (headersRaw) => {
    const parsed = {};

    headersRaw.split('\n').forEach(line => {
        const delimiterIndex = line.indexOf(':');
        if (delimiterIndex !== -1) {
            parsed[line.substring(0, delimiterIndex).trim()] = line.substring(delimiterIndex + 1).trim()
        }
    })
    return parsed
}

const prepareHeadersForBombarider = (headers) => {
    let result = "";
    Object.keys(headers).forEach(headerName => {
        result += ` --header="${headerName}: ${escapeHeaderValue(headers[headerName])}" `
    })

    return result;
}

const escapeHeaderValue = (val) => {
    return val.replace(/"/gmi, "\\\"");
}


const headersParams = prepareHeadersForBombarider(parseHeaders(headers))


const result = `docker run --platform linux/amd64 -d alpine/bombardier -m ${method} -c ${connections} -p r -d ${duration} -b "${escapeHeaderValue(body)}" ${headersParams} -l  ${url}`

console.log(result)

