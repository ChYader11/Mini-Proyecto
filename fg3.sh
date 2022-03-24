#!/usr/bin/env bash
#
# Esta parte sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los lanzamientos desde la zona de 3 puntos
#
key_write=LBIXNLJ6MF70QXLS
id_player=$(($RANDOM%500))
datos_fg3=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "fg3_pct" | awk '{print $2}' | tr -d ','))
fg3=$(echo "100*${datos_ft}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field8=${fg3}
