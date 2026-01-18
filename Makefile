.PHONY: all thesis presentation clean cleanall

all: thesis presentation

thesis:
	$(MAKE) -C thesis all
	mv thesis/thesis.pdf thesis.pdf

presentation:
	$(MAKE) -C presentation all
	mv presentation/presentation.pdf presentation.pdf

clean:
	$(MAKE) -C thesis clean
	$(MAKE) -C presentation clean

cleanall:
	$(MAKE) -C thesis cleanall
	$(MAKE) -C presentation cleanall