#!/bin/bash

~/robotino/sphinx/voxgen/buildwordlist.sh | sort | uniq > ~/robotino/sphinx/voxgen/wordlist
~/robotino/sphinx/voxgen/buildconf.sh > ~/robotino/sphinx/voxgen/voicecommands.conf
cd ~/robotino/sphinx/voxgen
make 
sudo make install
