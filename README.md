
# robotino

... a german speech robot based on pocketsphinx

# install deps

  install deb packages (apt):
  
    cd robotino
    ./deps.sh
    if mbrola install fails, please install manually
    wget http://steinerdatenbank.de/software/mbrola3.0.1h_armhf.deb
    sudo dpkg -i mbrola3.0.1h_armhf.deb



# build

  build first time:
  
    ./automakeall.sh
    
  rebuild sphinx and model:
  
    ./makeall.sh
    
  run:
  
    robotino/sphinx/run-pocketsphinx.sh
    
# functional software components

main and parser:

    - robotino/sphinx/pocketsphinx-5prealpha/src/programs/continuous.c
    - robotino/sphinx/voxgen/voicecommands.sh
    - robotino/sphinx/voxgen/voicecommands.conf

wake words

    robotino einschalten
    
sleep words

    robotino ausschalten
  
