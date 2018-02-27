PLUGIN_NAME := helm-nuke
REMOTE      := https://github.com/adamreese/$(PLUGIN_NAME)

.PHONY: install
install:
	helm plugin install https://github.com/adamreese/$(PLUGIN_NAME)

.PHONY: link
link:
	helm plugin install .
