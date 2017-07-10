# Dockerfile fuer Citrix-ICAClient-Container
# Deutsche Bahn DB Systel, Projekt DSR
#
# Heiko Graeber, 2017-07-05
#		 2017-07-07

FROM	desktopcontainers/icaclient             
						# Credits to MarvAmBass!
LABEL	maintainer="Heiko G. (https://github.com/7lima)"

ENV	WEB_URL					# weiterreichen
