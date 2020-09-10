"sh /usr/local/bin/compu.sh 1 4 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 4 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 1 2 &
"sh /usr/local/bin/compu.sh 1 3 &
"sh /usr/local/bin/compu.sh 1 5 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 2 &
"sh /usr/local/bin/compu.sh 0 3 &
"sh /usr/local/bin/compu.sh 0 5 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 3 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 1 3 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 2 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 1 2 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 8 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 1 8 &
"espeak -v mb-de6 \"OK.\" &"
"sh /usr/local/bin/compu.sh 0 5 &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/compu.sh 1 5 &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_CHUP &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_CHDOWN &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_VOLUP &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_VOLDOWN &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_MUTE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_MUTE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_MUTE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_MUTE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/wue_line_on.sh &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/wue_line_off.sh &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_SOURCE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_MENU &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_ENTER &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_RIGHT &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_LEFT &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_UP &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_DOWN &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_EXIT &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/sams.sh KEY_GUIDE &
"espeak -v mb-de6 \"OK.\" &"
"/usr/local/bin/mapmac.sh &
"espeak -v mb-de6 \"OK, lese mac adressen ein.\" &"
"/usr/local/bin/compu.sh 1 10 &
"espeak -v mb-de6 \"Panik Alarm ausgelöst.\""
"/usr/local/bin/compu.sh 1 10 &
"espeak -v mb-de6 \"Alarm ausgelöst.\""
"/usr/local/bin/compu.sh 1 10 &
"espeak -v mb-de6 \"Netz Alarm ausgelöst.\""
"/usr/local/bin/compu.sh 0 10 &
"espeak -v mb-de6 \"Netz Alarm aus.\""
"espeak -v mb-de6 \"Die Bestätigung war erfogreich.\" &"
"echo \"Das ist ein Alarmruf von Uwe, bitte kommen!\" | sudo gammu-smsd-inject TEXT \"+49711332852\""
"/usr/local/bin/compu.sh 1 10 &
"espeak -v mb-de6 \"OK.\" &"
"espeak -v mb-de6 \"Mein Name ist Robotino.\" &"
"espeak -v mb-de6 \"Meine Freunde sind Simon und Uwe.\" &"
"espeak -v mb-de6 \"Es ist\"; date | awk '{ print $4 \" \" }' | cut -d\":\" -f 1 | bc | espeak -v mb-de6; espeak -v mb-de6 \"Uhr\";  date | awk '{ print $4 \" \" }' | cut -d\":\" -f 2 | bc | espeak -v mb-de6 &"
"espeak -v mb-de6 \"Es ist\"; date | awk '{ print $4 \" \" }' | cut -d\":\" -f 1 | bc | espeak -v mb-de6; espeak -v mb-de6 \"Uhr\";  date | awk '{ print $4 \" \" }' | cut -d\":\" -f 2 | bc | espeak -v mb-de6 &"
"espeak -v mb-de6 \"In Stuttgart haben wir:\"; ansiweather -a false -s false -l stuttgart | awk '// {print $6}' | bc | espeak -v mb-de6; espeak -v mb-de6 \"Grad Celsius\";  ansiweather -a false -s false -l stuttgart | awk '// {print $17}' | bc | espeak -v mb-de6; espeak -v mb-de6 \"Prozent Luftfeuchtigkeit\";ansiweather -a false -s false -l stuttgart | awk '// {print $22}' | bc | espeak -v mb-de6; espeak -v mb-de6 \"Hektopascal Luftdruck\";ansiweather -a false -s false -l stuttgart | awk '// {print $11}' | bc | espeak -v mb-de6; espeak -v mb-de6 \"Meter pro Sekunde Windgeschwindigkeit aus Richtung\"; ansiweather -a false -s false -l stuttgart | awk '// {print $13}' | espeak -v mb-de6 &"
"espeak -v mb-de6 \"Guten morgen, hast du gut geschlafen?\" &"
"espeak -v mb-de6 \"Gute Nacht, schlaf gut.\" &"
"espeak -v mb-de6 \"Guten Abend, bist du noch fit?\" &"
"espeak -v mb-de6 \"Und du bist ein angeber!\" &"
"espeak -v mb-de6 \"Und du bist eine trantüte!\" &"
"sh ./ip_espeak.sh &"
"grep MemTotal /proc/meminfo | espeak -v mb-de6 &"
"sh ./hard_espeak.sh &"
"espeak -v mb-de6 \"Es geht mir gut. Meine Temperatur beträgt\"; sensors | head -n11 | tail -n1 | awk '// {print $4}' | espeak -v mb-de6 &"
"sh ./stat_espeak.sh &"
"espeak -v mb-de6 \"Danke, das freut mich.\" &"
"espeak -v mb-de6 \"Hallo, ich heisse robotino und bin nun bereit\">/dev/null"
"pactl set-source-mute 0 1 &
"pactl set-source-mute 0 0 &
"/usr/local/bin/mapmac.sh &
