#!/usr/bin/env bash
#
key_write=HSLZ8UK6A39MUOWS
id_player=$(($RANDOM%500))
#
# Esta parte sube a un canal de ThingSpeak la carga del sistema en el último minuto
#
c_1=($(/usr/bin/uptime | awk '{print $8}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field3=${c_1}
#
sleep 17s
#
# Este script sube a un canal de ThingSpeak la RAM ocupada
#
r_o=($(/usr/bin/free -h | grep "Mem" | awk '{print $3}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field2=${r_o}
#
sleep 17s
#
# Esta parte sube a un canal de ThingSpeak la carga del sistema en los último 5 minutos
#
c_5=($(/usr/bin/uptime | awk '{print $9}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field4=${c_5}
#
sleep 17s
#
# Esta parte sube a un canal de ThingSpeak el espacio disponible en disco
#
e_d=($(/usr/bin/df . -h | grep "/dev/sda1" | awk '{print $4}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field1=${e_d}
#
sleep 17s
#
# Esta parte sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los lanzamientos del tiro libre
#
datos_ft=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "ft_pct" | awk '{print $2}'))
ft=$(echo "100*${datos_ft}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field6=${ft}
#
sleep 17s
#
# Esta parte sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los tiros de campo
#
datos_fg=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "fg_pct" | awk '{print $2}' | tr -d ','))
fg=$(echo "100*${datos_fg}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field7=${fg}
#
sleep 17s
#
# Esta parte sube a un canal de ThingSpeak los datos de un API sobre baloncesto, especificamente el porcentaje de acierto de los lanzamientos desde la zona de 3 puntos
#
datos_fg3=($(/usr/bin/curl "https://www.balldontlie.io/api/v1/season_averages?player_ids[]=${id_player}" | jq | grep "fg3_pct" | awk '{print $2}' | tr -d ','))
fg3=$(echo "100*${datos_fg3}"| bc )
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field8=${fg3}
#
sleep 17s
# Esta parte sube a un canal de ThingSpeak la carga del sistema en los último 15 minutos
#
c_15=($(/usr/bin/uptime | awk '{print $10}'))
/usr/bin/curl https://api.thingspeak.com/update?api_key=${key_write}\&field5=${c_15}
