.DEFAULT_GOAL := all

# Paths
DEPS    = ./node_modules
BIN     = $(DEPS)/.bin
SRC     = ./src
DIST    = ./dist
DOCS    = ./docs

# Tests
TESTS   = ./test/src/
SPACE   :=
SPACE   +=
# Default to recursive, can override on run
FILE    = $(SPACE)--recursive

# Tasks

clean:
	rm -rf $(DIST) && rm -rf $(DEPS)

install:
	npm i .

lint:
	$(BIN)/eslint $(SRC)

test:
	$(BIN)/mocha --compilers js:babel/register $(TESTS)$(FILE)

build:
	$(BIN)/babel $(SRC) --out-dir $(DIST)

start:
	node dist/server.js

doc:
	$(BIN)/esdoc -c esdoc.json

dev: lint test build start

all: clean install lint test build doc


# Phonies
.PHONY: install lint test build doc start