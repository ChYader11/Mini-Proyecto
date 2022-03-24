#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak la carga del sistema en el último minuto
#
key_write=LBIXNLJ6MF70QXLS
c_1=($(/usr/bin/uptime | awk '{print $9}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field3=${c_1}
