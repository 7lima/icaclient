#!/bin/sh
#
# icaclient.sh
# Containerisierten Citrix-ICAClient-Container sowie eine Sitzung mit oder
# ohne Docker Compose starten
#
# Deutsche Bahn DB Systel, Projekt DSR
#
# Credits to MarvAmBass!
# Heiko Graeber, 2017-07-07
#		 2017-07-10

export WEB_URL
WEB_URL=https://vds.service.deutschebahn.com/Citrix/XenAppWeb/
NAME=icaclient

if
	docker-compose --help >/dev/null	# ist es installiert?
then
	docker-compose up -d			# dann per docker-compose
else						# sonst per docker
	sudo docker start $NAME 		|| \
	sudo docker run --name $NAME 	   	   \
		-e WEB_URL	  		   \
		desktopcontainers/$NAME
fi || exit

ssh -fX app@`
	docker inspect --format '{{ .NetworkSettings.IPAddress }}' $NAME` true
