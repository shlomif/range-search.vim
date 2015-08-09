VIM_DIR = .vim

TARGET_DIR_BASE = $(VIM_DIR)/plugin
DOC_DIR_BASE = $(VIM_DIR)/doc

TARGET_DIR = $(HOME)/$(TARGET_DIR_BASE)
DOC_DIR = $(HOME)/$(DOC_DIR_BASE)

PACKAGE_BASE = range-search
PACKAGE = $(PACKAGE_BASE).zip

VIM_FILES = $(PACKAGE_BASE).vim
VIM_DOCS = $(PACKAGE_BASE).txt

all:

install:
	mkdir -p $(TARGET_DIR) $(DOC_DIR)
	cp -f $(VIM_FILES) $(TARGET_DIR)/
	cp -f $(VIM_DOCS) $(DOC_DIR)/

dist: distdir
	rm -f $(PACKAGE)
	(cd $(VIM_DIR) && zip -r ../$(PACKAGE) .)
	rm -fr $(VIM_DIR)

distdir:
	mkdir -p $(TARGET_DIR_BASE) $(DOC_DIR_BASE)
	cp -f $(VIM_FILES) $(TARGET_DIR_BASE)/
	cp -f $(VIM_DOCS) $(DOC_DIR_BASE)/
