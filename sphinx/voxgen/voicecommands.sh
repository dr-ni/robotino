#!/bin/bash

for voicecmdfile in "$(dirname $0)/voicecommands.conf" /usr/local/share/uwevoxgen/voicecommands.conf
do 
if [ -f "$voicecomdfile" ] ; then
	echo using $voicecomdfile
fi
done


#define shortcuts
speak='espeak -v mb-de6 -s 150'
ans=$1
mute='mutepulse.sh'
unmute='umutepulse.sh'


cmd=$(awk -F "\t" --assign voicestr="$1" 'BEGIN{}/!^#/{}{if (voicestr == $1){print $2}}' $voicecmdfile)

#if [ -z "$cmd" ] ; then
#	$speak "nicht verstanden"
#	exit 1
#fi
eval $mute
eval $cmd
eval $unmute
