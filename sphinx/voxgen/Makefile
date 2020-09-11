CC=gcc
CFLAGS= -lX11 -lXtst -lXext
all: ipa2arpabet voxgen fakemouse

fakemouse: fakemouse.o
	$(CC) fakemouse.c $(CFLAGS) -o fakemouse

ipa2arpabet: ipa2arpabet.c ipa2arpabet-de.c
	$(CC) ipa2arpabet.c ipa2arpabet-de.c -o ipa2arpabet-de

voxgen:
	bash sepvoicecmd.sh voicecommands.conf
	bash build-model.sh

install:
	sudo cp ipa2arpabet /usr/local/bin/
	sudo cp -r ../voxgen/ /usr/local/share/
	sudo cp voicecommands.sh /usr/local/bin/
	sudo cp fakemouse /usr/local/bin/
	sudo cp mutepulse.sh /usr/local/bin/
	sudo cp umutepulse.sh /usr/local/bin/
uninstall:
	sudo rm -f /usr/local/bin/ipa2arpabet
	sudo rm -f /usr/local/bin/fakemouse
	sudo rm -rf /usr/local/share/voxgen
	sudo rm /usr/local/bin/voicecommands.sh
	sudo rm /usr/local/bin/mutepulse.sh
	sudo rm /usr/local/bin/umutepulse.sh
clean:
	rm -f fakemouse
	rm -f robotino.snt
	rm -f robotino.dic
	rm -f robotino.model.bin
	rm -f ipa2arpabet
	rm -f *.o
