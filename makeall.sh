#!/bin/bash


for dir in sphinx/voxgen/ sphinx/sphinxbase-5prealpha/ sphinx/pocketsphinx-5prealpha/ 
do

  if [ ! -d "$dir" ] ; then 
	echo "$dir not found!"
	read -p "continue?"
  fi
  pushd "$dir"
  make 
  sudo make install
  popd
done
sudo ldconfig

