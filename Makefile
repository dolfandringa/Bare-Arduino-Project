ECHO    = printf

SUBDIRS := $(wildcard src/*)
UNAME_S := $(shell uname -s)
TOPTARGETS := upload build

ifeq ($(UNAME_S),Linux)
    MKFILE = Makefile-Linux.mk
endif
ifeq ($(UNAME_S),Darwin)
    MKFILE = Makefile-OSX.mk
endif

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(shell cp ${MKFILE} $@/Makefile)\
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBDIRS)

install:
	./script/install.sh

test:
	./script/runtests.sh


help:
		@$(ECHO) "\nAvailable targets:\n\
  make install              - install all software required for building\n\
  make test                 - run the tests in ./test\n\
  make upload <src/dirname> - upload the sketch in src/<dirname>\n\
  make <src/dirname>        - compile the sketch in src/<dirname>\n\
"
.PHONY: install test help