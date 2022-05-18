CC=cl65

CFLAGS=-ttelestrat
PROGRAM=vidplay

SOURCE=src/vidplay.c

ifeq ($(CC65_HOME),)
        CC = cl65
        AS = ca65
        LD = ld65
        AR = ar65
else
        CC = $(CC65_HOME)/bin/cl65
        AS = $(CC65_HOME)/bin/ca65
        LD = $(CC65_HOME)/bin/ld65
        AR = $(CC65_HOME)/bin/ar65
endif



vidplay:
	$(CC) $(CFLAGS) -o $(PROGRAM) src/play.asm src/vidplay.c
	mkdir build/bin -p && cp vidplay build/bin
	mkdir build/usr/share/vidplay -p && cp data/usr/share/vidplay/*.gz build/usr/share/vidplay &&  cd build/usr/share/vidplay && gzip -df *.gz && cd ../../../../
	mkdir build/usr/share/man -p
	@echo "Create .hlp"
	cat docs/vidplay.md | ../md2hlp/src/md2hlp.py3 -c docs/md2hlp.cfg > build/usr/share/man/vidplay.hlp
