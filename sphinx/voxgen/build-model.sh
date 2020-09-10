#!/bin/bash
perl quick_lm.pl -s robotino.snt 
sphinx_lm_convert -i robotino.snt.arpabo -o robotino.model.bin
rm -f robotino.snt.arpabo
