---
title: 'COVID-19: 15km Radius WebApp'
author: Sebastian Brinkmann
date: '2021-01-15'
slug: covid-19-15km-radius-webapp
categories: []
tags:
  - COVID-19
  - GIS
  - R
  - Shiny
subtitle: ''
summary: ''
authors: []
lastmod: '2021-01-15T18:43:26+01:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
runtime: shiny
output: html_document
---
Klicke [hier](https://datageobrinkmann.be/bewegungsradius/) für die mobilfreundliche Version :iphone:<br />
<iframe frameborder="0" scrolling="no" seamless="seamless" style="display:block; width:95%; height:85vh;" src="https://datageobrinkmann.be/bewegungsradius/"></iframe>
<br />

# COVID-19 Bewegungsradius
### Stand: 15.1.2020
Die 15-Kilomenter Regel, nachdem sich Bewohner mit einer 7-Tage Inzidenz
von über 200 nur noch 15 km um ihren Wohnort bewegen dürfen, sorgt für
Verwirrung. Diese App soll dabei helfen, den individuellen
Bewegungsradius zu ermitteln.  
Zunächst wird die aktuelle 7-Tage-Inzidenz für jeden Landkreis
gedownloaded und in zwei Kategorien eingeteilt: \< 200 und \>= 200.
Anschließend wird die Adresse georeferenziert und ein 15 km Buffer wird
um die Gemeinde, bzw. den Landkreis der Adresse, oder auch die Adresse
selbst gelegt.  
Der genaue Wert der 7-Tage-Inzidenz, sowie die Verfügbarkeiten von
Intensivstationbetten (ITS) kann durch Anklicken eines Landkreisen
ausgelesen werden.

## Die Corona-Regeln in den Bundesländern

| Bundesland             | 15-km Regel                                                                                                    | Mehr Infos                                                                                                                                       |
| :--------------------- | :------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| Baden-Württemberg      | Wird aktuell nicht umgesetzt                                                                                   | [url](https://www.baden-wuerttemberg.de/de/service/aktuelle-infos-zu-corona/)                                                                    |
| Bayern                 | Ab der Gemeindegrenze                                                                                          | [url](https://www.corona-katastrophenschutz.bayern.de/faq/index.php)                                                                             |
| Berlin                 | Ab der Stadtgrenze                                                                                             | [url](https://www.rbb24.de/politik/thema/2020/coronavirus/beitraege_neu/2020/04/berlin-corona-massnahmen-lockerung-ausgang-kontakt-erlaubt.html) |
| Brandenburg            | Für touristische Ausflüge, Sport und Bewegung im Freien, um den jeweiligen Landkreis bzw. die kreisfreie Stadt | [url](https://kkm.brandenburg.de/kkm/de/)                                                                                                        |
| Bremen                 | Wird aktuell nicht umgesetzt                                                                                   | [url](https://www.bremen.de/corona)                                                                                                              |
| Hamburg                | Wird aktuell nicht umgesetzt                                                                                   | [url](https://www.hamburg.de/coronavirus/)                                                                                                       |
| Hessen                 | Ab der Gemeindegrenze; betroffene Landkreise: Gießen, Limburg-Weilburg, Fulda, Vogelsbergkreis                 | [url](https://www.faz.net/aktuell/rhein-main/corona-weitere-kreise-in-hessen-fuehren-15-kilometer-regel-ein-17143539.html)                       |
| Mecklenburg-Vorpommern | Ab der Wohnadresse                                                                                             | [url](https://www.regierung-mv.de/corona/Corona-Regeln-seit-10.01.2021/)                                                                         |
| Niedersachsen          | Ab der Wohnadresse, durch Kommunen geregelt                                                                    | [url](https://www.niedersachsen.de/Coronavirus)                                                                                                  |
| Nordrhein-Westfalen    | Ab der Gemeindegrenze; betroffene Landkreise: Höxter, Minden-Lübbecke, Oberbergischer Kreis, Recklinghausen    | [url](https://www.land.nrw/corona)                                                                                                               |
| Rheinland-Pfalz        | Ab der Gemeindegrenze, durch Kommunen geregelt                                                                 | [url](https://corona.rlp.de/index.php?id=34836)                                                                                                  |
| Saarland               | Für touristische Ausflüge, um die Wohnadresse                                                                  | [url](https://www.saarland.de/DE/portale/corona/home/home_node.html)                                                                             |
| Sachsen                | Ab der Wohnadresse                                                                                             | [url](https://www.coronavirus.sachsen.de/index.html)                                                                                             |
| Sachsen-Anhalt         | Ab der Gemeindegrenze                                                                                          | [url](https://coronavirus.sachsen-anhalt.de/)                                                                                                    |
| Schleswig-Holstein     | Ab der Gemeindegrenze, durch Kommunen geregelt                                                                 | [url](https://www.schleswig-holstein.de/DE/Schwerpunkte/Coronavirus/FAQ/Dossier/Allgemeines_Verwaltung.html)                                     |
| Thüringen              | Ab der Gemeindegrenze, nicht verpflichtend                                                                     | [url](https://corona.thueringen.de/)                                                                                                             |

## Credits

  - Geocoding [D.
    Kisler](https://datascienceplus.com/osm-nominatim-with-r-getting-locations-geo-coordinates-by-its-address/)
  - GPS locater via Dr. Tom August’s [shiny geolocation Javascript
    script](https://github.com/AugustT/shiny_geolocation)
  - API Aufrufe zu den aktuellen [COVID-19
    Fallzahlen](https://services7.arcgis.com/mOBPykOjAyBO2ZKk/ArcGIS/rest/services/Covid19_RKI_Sums/FeatureServer/0/)
    und [ITS-Betten](https://www.divi.de/register/tagesreport) via
    [entorb’s GitHub
    Seite](https://github.com/entorb/COVID-19-Coronavirus-German-Regions)

## Disclaimer

Dieses Tool dient nur zu Unterhaltungszwecken und stellt keine
medizinische, rechtliche oder sonstige Form der Beratung dar. Benutzer
sollten sich auf die offiziellen Richtlinien und Empfehlungen ihrer
nationalen, staatlichen und lokalen Behörden beziehen. Es werden
keinerlei personenbezogener Daten gespeichert.