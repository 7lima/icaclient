#!/bin/sh
#
# stop.sh
# Containerisierten Citrix-ICA-Client-Container stoppen
#
# Deutsche Bahn DB Systel, Projekt DSR
#
# Credits to MarvAmBass!
# Heiko G.,      2017-07-10

NAME=icaclient

if
	sudo docker-compose --help >/dev/null	# ist es installiert?
then
	sudo docker-compose stop		# dann per docker-compose
else
	sudo docker stop $NAME >/dev/null	# sonst per docker
fi
