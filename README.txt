Code befindet sich im Ordner AddKnit\Source.
Bitte die Datei MAIN.m von Matlab aus ausführen. Am Anfang wird aufgefordert, eine Mesh-Datei auszuwählen. 
Diese befinden sich im Ordner AddKnit\Data.
Testflächen wie Halbkugel, Pyramide, Pyramidenstumpf etc. befinden sich im Unterordner AddKnit\Data\TESTFLAECHEN.
Externe Bibliotheken und Funktionen, die bei der Berechnung erforderlich sind, befinden sich im Ordner AddKnit\Extras.
Wenn nichts ausgewählt wurde, wird das MAIN sofort beendet. 
Nach der Wahl einer Mesh-Datei erscheint sie in einer 3D-Darstellung und die Markierung kann vorgenommen werden.

Die Markierung muss in folgender Reihenfolge vorgenommen werden:
- Anfang des Gestricks
- Ende des Gestricks
- ggf. Naht
- Mittellinie

Für eine erfolgreiche Definition der Linien müssen mindestens der Anfang, das Ende und die Mittellinie konstruiert werden.


-------------------------------------------------------------------------------------------------------------------------------------------
Bedienung des GUI:

Rotate: Rechts-Click und halten
Zoom: Scroll
Pan: Mitte-Click and halten

Punktauswahl: Links-Click

Erneutes links-click auf einen Punkt entfernt diesen Punkt.
Zwischen zwei angeclickten Punkten wird eine Linie berechnet und in rot visualisiert.
Diese Linie folgt entweder den Kanten im Mesh (berechnet mit Dijkstra-Algorithmus für kürzesten Pfad
in einem Graph)
oder sie stellt die geodäsiche Distanz zwischen zwei Punkten dar.
Beim Starten von GUI ist der Dijkstra-Algorithmus eingestellt.
Zum Wechsel zur geodätischen Distanz "s" drücken.
Zum Wechsel zum Dijkstra "b" drücken.
Wechseln zwischen den zwei Algorithmen ist jederzeit möglich.

Doppelclick links schließt eine Linie, sodass eine geschlossene Kurve entsteht.
"n" beendet die Konsturktion einer Linie.

Ab hier kann eine so definierte Linie nicht mehr verändert werden. 
(Linien ändern sich von rot=aktiv zu blau)

Vor der Konstruktion der Mittellinie muss "m" gedrückt werden. 
Die Konstruktion (anclicken) der Punkte in der Mittellinie muss zum Schluss erfolgen und zwar von Anfangslinie bis zur Endlinie.

Mit "q" wird das GUI beendet, die definierten Punkten in den Mesh eingebaut und Mesh aktualisiert.
-------------------------------------------------------------------------------------------------------------------------------------------


Nach dem Beenden des GUI läuft der Algorithmus automatisch. Das Ergebnis wird im Unterordner AddKnit\Results gespeichert.
Es besteht aus einer .jac-Datei und aus einer .bmp-Datei.
Die Dateiname setzt sich wie folgt zusammen:
[Name der Mesh-Datei]_[Erstellungsdatum]_[Stricktechnik].[jac oder bmp]
z.B.
Halbkugel_D20_03-Nov-2021_RR.bmp
Halbkugel_D20_03-Nov-2021_RR.jac

Derzeit sind folgende Stricktechniken möglich:
RR - rechts-rechts
RL - rechts-links
HS - halbschlauch
IP - ital. Patent
HS2 - halbschlauch Variante
Die Änderung der Stricktechnik muss händisch in MAIN.m vorgenommen werden. 
Hierzu muss der Index der Stricktechnik am Anfang der MAIN geändert werden.  
Zuerst sind die Maschenbreite- und Höhe für alle Techniken definiert. Sie beziehen sich auf die Dimensionen nach Waschen und Bügeln. 
Genauere Informationen hierzu liefert Uwe Röder.
z.B.
W = [0.96, 0.88, 0.84, 0.76, 10/6];
H = [0.42, 0.3, 0.85, 0.44, 10/13];
KNIT_STR = {'RR', 'HS', 'IP', 'RL', 'HS2'};
KNIT = 5; # hier wird Stricktechnik geändert.
