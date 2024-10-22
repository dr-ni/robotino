#!/bin/bash

voicecmdfile='/home/uwe/robotino/sphinx/voxgen/voicecommands.conf'
audiopath='/var/www/html/audio'
#define shortcuts
# speak='espeak -v mb-de6 -s 150'
speak='/usr/local/bin/espeak_speak.sh'
mute='/home/uwe/pilotx/mic_mute.sh'
umute='/home/uwe/pilotx/mic_init.sh'
string=$(echo "$1")
echo "string=$string"
mute='/home/uwe/pilotx/mic_mute.sh'
unmute='/home/uwe/pilotx/mic_init.sh'
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
