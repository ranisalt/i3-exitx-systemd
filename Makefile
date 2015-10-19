DESTDIR ?= /usr
BINDIR = $(DESTDIR)/bin

all: exitx exitx.po

exitx: main.c halt.h logout.h reboot.h suspend.h
	gcc -O2 -Wall -o exitx main.c `pkg-config gtk+-2.0 --cflags` `pkg-config gtk+-2.0 --libs` `pkg-config --cflags --libs glib-2.0` `pkg-config x11 --libs`

install: exitx
	install -Dm755 exitx "$(BINDIR)/exitx"

exitx.po: *.c
	xgettext -k_ --language=C -o $@ $^ --from-code=utf-8

.PHONY: clean
clean:
	-rm -f exitx.po exitx
