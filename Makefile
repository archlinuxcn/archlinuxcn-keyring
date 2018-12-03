V=20181204

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archlinuxcn{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/archlinuxcn{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
dist:
	git archive --format=tar --prefix=archlinuxcn-keyring-$(V)/ master | gzip -9 > archlinuxcn-keyring-$(V).tar.gz
	gpg --default-key BA266106 --detach-sign --use-agent archlinuxcn-keyring-$(V).tar.gz

upload:
	rsync --chmod 644 --progress archlinuxcn-keyring-$(V).tar.gz archlinuxcn-keyring-$(V).tar.gz.sig archlinuxcn.org:/nginx/var/www/keyring/

.PHONY: install uninstall dist upload

