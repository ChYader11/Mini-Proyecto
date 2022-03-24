#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak la RAM ocupada
#
key_write=LBIXNLJ6MF70QXLS
r_o=($(/usr/bin/free -h | grep "Mem" | awk '{print $3}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field2=${r_o}
