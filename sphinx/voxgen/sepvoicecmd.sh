#!/bin/bash
awk -F '\t' 'NF && !/^[:space:]*#/''{ print "<s> " $1 " </s>" }' $1 >robotino.snt
awk -F '\t' 'NF && !/^[:space:]*#/''{ print $1 " "}' $1 >robotino.lst
tr -s [:space:] \\n < robotino.lst | sort | uniq >robotino.wds
cat robotino.wds | espeak -v de -x --ipa -q>robotino.laut
cp robotino.laut robotino.ipa
./ipa2arpabet robotino.laut
paste -d "" robotino.wds robotino.laut >robotino.dic
rm -f robotino.wds
rm -f robotino.laut
rm -f robotino.lst
rm -f robotino.ipa
