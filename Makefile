#
# Makefile for epsonps.c
# 
# for Turbo C, use 
#   tcc epsonps.c
# for Microsoft C 5.1, use
#   cl /W3 /DANSI epsonps.c
#
MANDIR = /usr/local/man/man1
BINDIR = /usr/local/bin

epsonps: epsonps.c
	cc -DANSI epsonps.c -o epsonps

man: epsonps.1
	nroff -man epsonps.1 -Tlatin1 | col -bx > epsonps.txt

pdf: epsonps.1
	groff -fC -man epsonps.1 -Tpdf > epsonps.pdf

ps: epsonps.1
	groff -fC -man epsonps.1 -Tps > epsonps.ps

install: epsonps epsonps.pro epsonps.1
	install -c -m 755 epsonps     $(BINDIR)/epsonps
	install -c -m 644 epsonps.pro $(BINDIR)/epsonps.pro
	install -c -m 644 epsonps.1   $(MANDIR)/epsonps.1

clean:
	rm -f epsonps
	
shar: README epsonps.c epsonps.pro epsonps.1 Makefile
	shar README epsonps.c > epsonps.sh1
	shar epsonps.1 epsonps.pro Makefile > epsonps.sh2
