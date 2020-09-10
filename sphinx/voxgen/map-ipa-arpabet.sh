#!/bin/bash
 echo $1 | espeak -v de -x --ipa -q>ipafile
mapfile=map-ipa-arpabet.lst
cat $mapfile | while read line; do
space=' '
neww=${line##* };
newww=$neww$space
oldw=${line%% *};
sed -i "s/$oldw/$newww/g" ipafile
done
#remove Anglizismen Marker e.g.
#SEX: (eN )S EH K S (D e) -> S EH K S 
#ONLINE: (eN )ÉN L AY N (D e) -> ÉN L AY N
sed -e "s/(eN )//g" -i ipafile
sed -e "s/(D e)//g" -i ipafile
tr -d "ˈˌ" < ipafile
rm ipafile
