SHELL      = /bin/bash

CFG       := .env
PRG       ?= $(shell basename $$PWD)
SQL_ROOT  ?= sql
BUILD_DIR ?= .build
POMA_MAKE ?= $(SQL_ROOT)/poma/Makefile

allpak    ?= poma sample

%-all: POMA_PKG=$(allpak)
%-default: POMA_PKG=sample

define CONFIG_DEFAULT
# ------------------------------------------------------------------------------
# Master application config

NAME=VALUE
endef
export CONFIG_DEFAULT

all: help

## Show available make targets
help:
	@grep -A 1 -h "^##" Makefile $(POMA_MAKE) | less

## Remove all temp files
clean: poma-clean

include $(POMA_MAKE)
