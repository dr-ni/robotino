#!/bin/bash
voicecommands_path=/home/uwe/robotino/sphinx/voxgen
pilot_path=/home/uwe/pilotx
voicecmdfile=$voicecommands_path/voicecommands.conf
audiopath=/var/www/html/audio
speak=/usr/local/bin/espeak_speak.sh
mute=$pilot_path/mic_mute.sh
umute=$pilot_path/mic_init.sh
string=$(echo "$1")
echo "string=$string"
echo
#echo awk -F "\t" --assign voicestr="$string" 'BEGIN{}/!^#/{}{if (voicestr == $1){print $2}}' $voicecmdfile
cmd=$(awk -F "\t" --assign voicestr="$string" 'BEGIN{}/!^#/{}{if (voicestr == $1){print $2}}' $voicecmdfile)
echo "cmd=$cmd"
if [ -z "$cmd" ] ; then
#	echo "=> nicht verstanden"
notify-send -u normal -t 2000 "Unknown" "command"
	exit 1
else
[[ -z "$string" ]] || notify-send -u normal -t 2000 "Command:" "$string"
        eval $mute
        echo $cmd
        eval $cmd
        eval $unmute
        echo
fi
