Code befindet sich im Ordner AddKnit\Source.
Bitte die Datei MAIN.m von Matlab aus ausf�hren. Am Anfang wird aufgefordert, eine Mesh-Datei auszuw�hlen. 
Diese befinden sich im Ordner AddKnit\Data.
Testfl�chen wie Halbkugel, Pyramide, Pyramidenstumpf etc. befinden sich im Unterordner AddKnit\Data\TESTFLAECHEN.
Externe Bibliotheken und Funktionen, die bei der Berechnung erforderlich sind, befinden sich im Ordner AddKnit\Extras.
Wenn nichts ausgew�hlt wurde, wird das MAIN sofort beendet. 
Nach der Wahl einer Mesh-Datei erscheint sie in einer 3D-Darstellung und die Markierung kann vorgenommen werden.

Die Markierung muss in folgender Reihenfolge vorgenommen werden:
- Anfang des Gestricks
- Ende des Gestricks
- ggf. Naht
- Mittellinie

F�r eine erfolgreiche Definition der Linien m�ssen mindestens der Anfang, das Ende und die Mittellinie konstruiert werden.


-------------------------------------------------------------------------------------------------------------------------------------------
Bedienung des GUI:

Rotate: Rechts-Click und halten
Zoom: Scroll
Pan: Mitte-Click and halten

Punktauswahl: Links-Click

Erneutes links-click auf einen Punkt entfernt diesen Punkt.
Zwischen zwei angeclickten Punkten wird eine Linie berechnet und in rot visualisiert.
Diese Linie folgt entweder den Kanten im Mesh (berechnet mit Dijkstra-Algorithmus f�r k�rzesten Pfad
in einem Graph)
oder sie stellt die geod�siche Distanz zwischen zwei Punkten dar.
Beim Starten von GUI ist der Dijkstra-Algorithmus eingestellt.
Zum Wechsel zur geod�tischen Distanz "s" dr�cken.
Zum Wechsel zum Dijkstra "b" dr�cken.
Wechseln zwischen den zwei Algorithmen ist jederzeit m�glich.

Doppelclick links schlie�t eine Linie, sodass eine geschlossene Kurve entsteht.
"n" beendet die Konsturktion einer Linie.

Ab hier kann eine so definierte Linie nicht mehr ver�ndert werden. 
(Linien �ndern sich von rot=aktiv zu blau)

Vor der Konstruktion der Mittellinie muss "m" gedr�ckt werden. 
Die Konstruktion (anclicken) der Punkte in der Mittellinie muss zum Schluss erfolgen und zwar von Anfangslinie bis zur Endlinie.

Mit "q" wird das GUI beendet, die definierten Punkten in den Mesh eingebaut und Mesh aktualisiert.
-------------------------------------------------------------------------------------------------------------------------------------------


Nach dem Beenden des GUI l�uft der Algorithmus automatisch. Das Ergebnis wird im Unterordner AddKnit\Results gespeichert.
Es besteht aus einer .jac-Datei und aus einer .bmp-Datei.
Die Dateiname setzt sich wie folgt zusammen:
[Name der Mesh-Datei]_[Erstellungsdatum]_[Stricktechnik].[jac oder bmp]
z.B.
Halbkugel_D20_03-Nov-2021_RR.bmp
Halbkugel_D20_03-Nov-2021_RR.jac

Derzeit sind folgende Stricktechniken m�glich:
RR - rechts-rechts
RL - rechts-links
HS - halbschlauch
IP - ital. Patent
HS2 - halbschlauch Variante
Die �nderung der Stricktechnik muss h�ndisch in MAIN.m vorgenommen werden. 
Hierzu muss der Index der Stricktechnik am Anfang der MAIN ge�ndert werden.  
Zuerst sind die Maschenbreite- und H�he f�r alle Techniken definiert. Sie beziehen sich auf die Dimensionen nach Waschen und B�geln. 
Genauere Informationen hierzu liefert Uwe R�der.
z.B.
W = [0.96, 0.88, 0.84, 0.76, 10/6];
H = [0.42, 0.3, 0.85, 0.44, 10/13];
KNIT_STR = {'RR', 'HS', 'IP', 'RL', 'HS2'};
KNIT = 5; # hier wird Stricktechnik ge�ndert.
