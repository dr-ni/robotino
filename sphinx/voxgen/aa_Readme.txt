1. perl quick_lm.pl -s robotino.txt 
2. sphinx_lm_convert -i robotino.txt.arpabo -o robotino.model.bin
3. test mit deutschem hmm:

#!/bin/bash
pocketsphinx_continuous \
    -hmm /home/nieu/dev/sphinx/voxforge-de-r20141117/model_parameters/voxforge.cd_cont_3000 \
    -dict robotino.dic \
    -inmic yes \
    -lm robotino.model.bin

