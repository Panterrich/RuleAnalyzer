.PHONY: all thesis clean cleanall

all: thesis

thesis:
	$(MAKE) -C thesis all
	mv thesis/thesis.pdf thesis.pdf

clean:
	$(MAKE) -C thesis clean

cleanall:
	$(MAKE) -C thesis cleanall
