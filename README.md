
# robotino

... a german speech robot based on pocketsphinx

# install deps

  install deb packages (apt):
  
    cd robotino
    ./deps.sh


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
  
