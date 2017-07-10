# Dockerfile fuer Citrix ICA-Client-Container
#
# Heiko G.,	 2017-07-05
#		 2017-07-07

FROM	desktopcontainers/icaclient             
						# Credits to MarvAmBass!
LABEL	maintainer="Heiko G. (https://github.com/7lima)"

ENV	WEB_URL					# weiterreichen
