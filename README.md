
# robotino

... a german speech robot

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
    - /home/pi/robotino/sphinx/voxgen/voicecommands.sh
    - /home/pi/robotino/sphinx/voxgen/voicecommands.conf

wake word

    robotino ein
    
sleep word

    robotino aus   
