VERSION = r7
BINNAME = kitten
EXTENSION = .z5

INFORM = inform
PERL = perl

DISTNAME = $(BINNAME)-$(VERSION)
DISTDIR = $(DISTNAME)

$(BINNAME): nki
	$(INFORM) $(BINNAME).inf

nki:
	$(PERL) nki2inf.pl *.nki > nki.inf

clean:
	rm -f *core *sav *$(EXTENSION) nki.inf

distclean: clean
	rm -rf $(DISTDIR)
	rm -f $(DISTDIR).tar $(DISTDIR).tar.gz
