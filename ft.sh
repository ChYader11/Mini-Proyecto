#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los lanzamientos del tiro libre
#
key_write=LBIXNLJ6MF70QXLS
id_player=$(($RANDOM%500))
datos_ft=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "ft_pct" | awk '{print $2}' | tr -d ','))
ft=$(echo "100*${datos_ft}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field6=${ft}
