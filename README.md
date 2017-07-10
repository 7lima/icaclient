# Citrix ICA-Client - VDS der Deutschen Bahn
_Citrix ICA Client-Plugin in Verbindung mit Mozilla Firefox_

Diese containerisierte Lösung basiert auf dem
[Citrix ICA Client-Plugin von MarvAmBass](https://github.com/DesktopContainers/icaclient)
und ist vorkonfiguriert,
sich mit dem VDS-Service (Virtual Desktop Service) der
[Deutschen Bahn](http://www.bahn.de/)
zu verbinden.

## Lizenzen
Um diese Lösung rechtmäßig zu nutzen,
müssen die Lizenzen der enthaltenen Software-Komponenten akzeptiert werden.

Der Citrix ICA-Client unterliegt der Lizenz _Citrix License Agreement_,
deren Inhalt mit Stand mit Stand 2017-07-10
in der Datei `LICENSE` hinterlegt ist.  
Alle Informationen dazu von Seiten [Citrix](https://www.citrix.com/)
sowie der originale Citrix ICA-Client
können von
[deren Website](https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html)
heruntergeladen werden.

Für den
[Mozilla Firefox](https://www.mozilla.org/de/firefox/new/)
gilt eine
[Open-Source-Lizenz](https://www.mozilla.org/en-US/MPL/).

## Zugriff auf den VDS-Service
Die Deutsche Bahn stellt eine
[öffentliche Adresse](https://vds.service.deutschebahn.com/Citrix/XenAppWeb/)
zum Zugriff auf ihren VDS-Service per Browser zur Verfügung.
Der Zugriff ist ausschließlich für Mitarbeiter der Deutschen Bahn gestattet
und setzt für den Benutzer eine Kennung
sowie die Freischaltung weiterer Zugriffsmechanismen voraus.

## Vorbereitung
Voraussetzung für den Betrieb dieser Lösung
ist [die Containerisierungs-Infrastruktur Docker](http://www.docker.com/),
die für Linux, macOS und MS Windoze
[zur Verfügung steht](https://store.docker.com/search?type=edition&offering=community).

Zum Starten des
[Containers](https://hub.docker.com/r/7lima/icaclient/)
benötigt man die
[Startscripts](https://github.com/7lima/icaclient/),
die von einer UNIX-Shell aus per Git-Kommando

	$ git clone https://github.com/7lima/icaclient.git
heruntergeladen werden können.

## Starten des Citrix ICA-Clients
Man wechselt in einer UNIX-Shell in das durch Git angelegte Verzeichnis,
in dem das Startscript `icaclient.sh` liegt,
und startet dann den Citrix ICA-Client mit:

	$ sudo sh icaclient.sh
(Ist der UNIX-Benutzer so konfiguriert,
daß er der Benutzergruppe `docker` angehört,
kann das `sudo` entfallen.)

Es öffnet sich dann ein Browserfenster,
in dem nach erfolgreichem Authentifizierungsvorgang
der VDS-Desktop und weitere VDS-Applikationen
in für DB-Mitarbeiter gewohnter Weise zur Verfügung stehen.
