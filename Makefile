SHELL = bash

.PHONY: deps
deps: bin/tcpser /usr/local/bin/x64sc
# ------------------------------------
#  Dependencies
# ------------------------------------
bin/tcpser: vendor/tcpser/tcpser bin
	cp $< $@

/usr/local/bin/x64sc:
	brew install vice

# ------------------------------------
#  Directories
# ------------------------------------
vendor:
	-mkdir vendor

vendor/tcpser: vendor
	git clone https://github.com/FozzTexx/tcpser.git $</tcpser

bin:
	-mkdir bin

vendor/tcpser/tcpser: vendor/tcpser
	cd $< && make


# ------------------------------------
#  Utils
# ------------------------------------
.PHONY: clean
clean:
	-rm -rf vendor
	-rm -rf bin
