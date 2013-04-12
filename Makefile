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

dist: distclean
	mkdir $(DISTDIR)
	@for file in `ls`; do \
		if test $$file != $(DISTDIR); then \
			cp -rp $$file $(DISTDIR)/$$file; \
		fi; \
	done
	tar chof $(DISTDIR).tar $(DISTDIR)
	gzip -f --best $(DISTDIR).tar
	rm -rf $(DISTDIR)
	@echo
	@echo "$(DISTDIR).tar.gz created"
	@echo 

clean:
	rm -f *core *sav *$(EXTENSION) nki.inf

distclean: clean
	rm -rf $(DISTDIR)
	rm -f $(DISTDIR).tar $(DISTDIR).tar.gz

