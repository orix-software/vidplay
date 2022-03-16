CC=cl65

CFLAGS=-ttelestrat
PROGRAM=vidplay

SOURCE=src/vidplay.c

vidplay:
	$(CC) $(CFLAGS) -o $(PROGRAM) src/play.asm src/vidplay.c 
	mkdir build/bin -p && cp vidplay build/bin
	mkdir build/usr/share/vidplay -p && cp data/usr/share/vidplay/*.gz build/usr/share/vidplay &&  cd build/usr/share/vidplay && gzip -d *.gz && cd ../../../../
	mkdir build/usr/share/man -p && cp data/usr/share/man/*.hlp build/usr/share/man
