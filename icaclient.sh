#!/bin/sh
#
# icaclient.sh
# Containerisierten Citrix-ICA-Client-Container mit oder ohne Docker Compose
# sowie eine Sitzung starten
#
# Deutsche Bahn DB Systel, Projekt DSR
#
# Credits to MarvAmBass!
# Heiko G.,      2017-07-07
#		 2017-07-10
#		 2017-07-11

export WEB_URL
WEB_URL=https://vds.service.deutschebahn.com/Citrix/XenAppWeb/
NAME=icaclient

if
	sudo docker-compose --help >/dev/null	# ist es installiert?
then
	sudo docker-compose up -d		# dann per docker-compose
	CONT=`sudo docker ps -q -f "name=${NAME}_${NAME}_*" | tail -n 1`
						# ID des Containers
else						# sonst per docker
	sudo docker start $NAME 			|| \
	sudo docker run --name $NAME 	   		   \
		-e WEB_URL	  			   \
		7lima/$NAME
	CONT=`sudo docker ps -q -f name"=$NAME" | tail -n 1`
						# ID des Containers
fi || exit

ADRE=`sudo docker inspect \
	-f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONT`
						# IP-Adresse des Containers
ssh -fX							\
    -o UserKnownHostsFile=/dev/null			\
    -o StrictHostKeyChecking=no				\
    app@$ADRE true				# SSH startet immer Firefox
