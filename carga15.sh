#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak la carga del sistema en los últimos quince minutos
#
key_write=LBIXNLJ6MF70QXLS
c_15=($(/usr/bin/uptime | awk '{print $11}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field5=${c_15}
