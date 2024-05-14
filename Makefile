TARGET = ciadpi
CC ?= gcc
CFLAGS += -std=c99 -O2 -D_XOPEN_SOURCE=500 
SOURCES = packets.c main.c conev.c proxy.c desync.c mpool.c extend.c
WIN_LD =  -lws2_32 -lmswsock
WIN_SOURCES = win_service.c
DFLAGS = -fsanitize=address -fsanitize=undefined -fsanitize=pointer-subtract -fsanitize=leak

all:
	$(CC) $(CFLAGS) $(SOURCES) -I . -o $(TARGET)

windows:
	$(CC) $(CFLAGS) $(SOURCES) $(WIN_SOURCES) -I . $(WIN_LD) -o $(TARGET).exe

debug:
	$(CC) $(CFLAGS) $(DFLAGS) $(SOURCES) -I . -o $(TARGET)
