#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak la carga del sistema en los últimos cinco minutos
#
key_write=LBIXNLJ6MF70QXLS
c_5=($(/usr/bin/uptime | awk '{print $10}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field4=${c_5}
