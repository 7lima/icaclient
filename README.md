# Citrix ICA-Client - VDS der Deutschen Bahn
_Citrix ICA-Client-Plugin in Verbindung mit Mozilla Firefox_

Diese containerisierte Lösung ist vorkonfiguriert,
sich mit dem VDS-Service (Virtual Desktop Service) der
[Deutschen Bahn](http://www.bahn.de/)
zu verbinden.
Sie basiert auf dem
[Citrix ICA-Client-Plugin von MarvAmBass](https://github.com/DesktopContainers/icaclient).
Als Benutzerschnittstelle dient der Mozilla Firefox,
in dem das ICA-Client-Plugin ausgeführt wird,
um eine VDS-Oberfläche anzuzeigen.
Diese Lösung ist nur für Mitarbeiter der Deutschen Bahn einsetzbar.

## Lizenzen
Um diese Lösung rechtmäßig zu nutzen,
müssen die Lizenzen der enthaltenen Software-Komponenten befolgt werden.

Der Citrix ICA-Client unterliegt der Lizenz _Citrix License Agreement_,
deren Inhalt mit Stand mit Stand 2017-07-10
in der Datei `LICENSE` hinterlegt ist.
Alle Informationen dazu von Seiten [Citrix](https://www.citrix.com/)
sowie der originale Citrix ICA-Client
können von
[deren Website](https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html)
heruntergeladen werden.
Siehe auch die [Angaben von MarvAmBass zu diesem Thema](https://github.com/DesktopContainers/icaclient#ica-client-license).

Für den
[Mozilla Firefox](https://www.mozilla.org/de/firefox/new/)
gilt eine
[Open-Source-Lizenz](https://www.mozilla.org/en-US/MPL/).

## Zugriff auf den VDS-Service
Die Deutsche Bahn stellt eine
[öffentliche Adresse](https://vds.service.deutschebahn.com/Citrix/XenAppWeb/)
zum Zugriff auf ihren VDS-Service zur Verfügung.
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
Dieses Kommando erzeugt ein neues Unterverzeichnis
und legt die Dateien dort ab.

## Starten des Citrix ICA-Clients
Voraussetzung ist ein graphischer Desktop.
Man wechselt dort in einer UNIX-Shell
in das durch Git angelegte Verzeichnis,
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

## Beenden
Wird eine der VDS-Applikationen beendet,
so bleibt das Browserfenster mit der VDS-Oberfläche weiterhin geöffnet.
Dasselbe gilt für das Beenden des VDS-Desktops.
Jedoch kann es sein,
daß der Benutzer aufgrund einer Zeitüberschreitung
automatisch abgemeldet wird.
Diese Vorgänge sind das Standard-Verhalten von VDS.

Will man die Sitzung selbst beenden,
so schließt man einfach das Browserfenster.

Zum Beenden des Containers kann man folgendes Script benutzen:

	$ sudo sh stop.sh

## Persistenz
Der Zustand des Browsers und dessen Einstellungen bleiben erhalten,
solange der Container nicht gelöscht wird.

Die Persistenz einer VDS-Sitzung
verhält sich wie durch das Citrix ICA-Client-Plugin vorgegeben.
Eine Sitzung auf dem VDS-Desktop kann also persistent bleiben,
wenn man sich von der Sitzung nur trennt und sie nicht beendet.

## Debugging

        $ sudo sh -x icaclient.sh
        $ sudo sh -x      stop.sh
