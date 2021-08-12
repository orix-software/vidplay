CC=cl65

CFLAGS=-ttelestrat
PROGRAM=vidplay

SOURCE=src/vidplay.c

vidplay:
	$(CC) $(CFLAGS) -o $(PROGRAM) src/play.asm src/vidplay.c 
