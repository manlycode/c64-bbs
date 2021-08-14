SHELL = bash

.PHONY: deps
deps: bin/tcpser

vendor:
	-mkdir vendor

vendor/tcpser: vendor
	git clone https://github.com/FozzTexx/tcpser.git $</tcpser

vendor/tcpser/tcpser: vendor/tcpser
	cd $< && make

bin:
	-mkdir bin

bin/tcpser: vendor/tcpser/tcpser bin
	cp $< $@


.PHONY: clean
clean:
	-rm -rf vendor
	-rm -rf bin
