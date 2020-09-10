#!/bin/bash


for dir in sphinx/voxgen/ sphinx/sphinxbase-5prealpha/ sphinx/pocketsphinx-5prealpha/ 
do

  if [ ! -d "$dir" ] ; then 
	echo "$dir not found!"
	read -p "continue?"
  fi
  pushd "$dir"
  if [ -f "autogen.sh" ] ; then
	./autogen.sh
  fi
  make 
  sudo make install
  popd
done

