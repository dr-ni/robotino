#!/bin/bash
#am pi kein signal? Find the source name using the command: pacmd list-sources.
#am pi setzen:
#pacmd set-default-source alsa_input.usb-0c76_USB_Audio_Device-00-Device.analog-mono
#
#pactl set-source-volume 1 15000
#pactl set-sink-volume 0 40000
pocketsphinx_continuous \
    -hmm ~/robotino/sphinx/voxforge-de-r20141117/model_parameters/voxforge.cd_cont_3000 \
    -dict ~/robotino/sphinx/voxgen/robotino.dic \
    -inmic yes -vad_threshold 3.5\
    -topn 2 -ds 2 -maxwpf 5 -maxhmmpf 3000 -pl_window 30 \
    -frate 78 -bestpathlw 390 -lw 10 -fwdflatlw 13 -wip 0.07 -pip 28 -uw 2 \
    -lm ~/robotino/sphinx/voxgen/robotino.model.bin -logfn /dev/null -agc none
