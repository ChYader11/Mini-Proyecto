#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak el espacio de disco disponible
#
key_write=LBIXNLJ6MF70QXLS
e_d=($(/usr/bin/df . -h | grep "/dev/sda1" | awk '{print $4}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field1=${e_d}

