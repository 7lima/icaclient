#!/bin/sh
#
# build.sh
# Containerisierten Citrix-ICAClient-Container erzeugen und taggen
#
# Deutsche Bahn DB Systel, Projekt DSR
#
# Credits to MarvAmBass!
# Heiko Graeber, 2017-07-07

docker build -t 7lima/icaclient	.
