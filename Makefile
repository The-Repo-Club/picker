# instamenu - menu from CynicalTeam
# See LICENSE file for copyright and license details.

include config.mk

clean:
	rm -rf $(DESTDIR)$(ETC)/picker.conf\
		$(DESTDIR)$(PREFIX)/bin/picker\
		$(DESTDIR)$(MANPREFIX)/man8/picker.8\
		$(DESTDIR)$(MANPREFIX)/man8/picker.conf.8

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f picker $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(ETC)/
	cp -f picker.conf $(DESTDIR)$(ETC)/

	mkdir -p $(DESTDIR)$(MANPREFIX)/man8
	sed "s/VERSION/$(VERSION)/g" < picker.8 > $(DESTDIR)$(MANPREFIX)/man8/picker.8
	chmod 644 $(DESTDIR)$(MANPREFIX)/man8/picker.8
	sed "s/VERSION/$(VERSION)/g" < picker.conf.8 > $(DESTDIR)$(MANPREFIX)/man8/picker.conf.8
	chmod 644 $(DESTDIR)$(MANPREFIX)/man8/picker.conf.8

uninstall:
	rm -rf $(DESTDIR)$(ETC)/picker.conf\
		$(DESTDIR)$(PREFIX)/bin/picker\
		$(DESTDIR)$(MANPREFIX)/man8/picker.8\
		$(DESTDIR)$(MANPREFIX)/man8/picker.conf.8

.PHONY: all install uninstall
