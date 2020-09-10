CC=gcc
CFLAGS= -lX11 -lXtst -lXext
all: ipa2arphabet voxgen fakemouse

fakemouse: fakemouse.o
	$(CC) fakemouse.c $(CFLAGS) -o fakemouse

ipa2arphabet: ipa2arphabet.o
	$(CC) ipa2arphabet.c -o ipa2arphabet

voxgen:
	bash sepvoicecmd.sh voicecommands.conf
	bash build-model.sh

install:
	sudo cp ipa2arphabet /usr/local/bin/
	sudo cp -r ../voxgen/ /usr/local/share/
	sudo cp voicecommands.sh /usr/local/bin/
	sudo cp fakemouse /usr/local/bin/
	sudo cp mutepulse.sh /usr/local/bin/
	sudo cp umutepulse.sh /usr/local/bin/
uninstall:
	sudo rm -f /usr/local/bin/ipa2arphabet
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
	rm -f ipa2arphabet
	rm -f *.o
