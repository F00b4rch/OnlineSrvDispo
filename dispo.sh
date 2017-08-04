#!/bin/bash

webhook="https://hooks.slack.com/services/XXX/XXXX/XXXX/XXXX"
url="https://www.online.net/fr/serveur-dedie/XXXXX"
text="DISPO : $url"
channel="test"
json="{\"channel\": \"#$channel\", \"text\": \"$text\"}"
server="XC 2016"

while true
    do curl --silent https://www.online.net/fr/serveur-dedie | \
    grep '<button class="btn btn--primary js-order-dedibox"' | \
    grep -i "$server" | grep -i 'victime' || \
    curl -s -d "payload=$json" "$webhook" ; \
    sleep 5 ; \
done
