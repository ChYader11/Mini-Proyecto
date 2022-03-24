#!/usr/bin/env bash
#
# Este script sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los tiros de campo
#
key_write=LBIXNLJ6MF70QXLS
id_player=$(($RANDOM%500))
datos_fg=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "fg_pct" | awk '{print $2}' | tr -d ','))
fg=$(echo "100*${datos_fg}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field7=${fg}
