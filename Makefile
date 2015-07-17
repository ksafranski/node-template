.DEFAULT_GOAL := all

# Paths
BIN     = ./node_modules/.bin
SRC     = ./src
DIST    = ./dist
DOCS    = ./docs
TESTS   = ./test/src/**/*.spec.js

# Tasks

install:
	npm i .

lint:
	$(BIN)/eslint $(SRC)

test:
	$(BIN)/mocha --compilers js:babel/register $(TESTS)

build:
	$(BIN)/babel $(SRC) --out-dir $(DIST) --experimental

doc:
	$(BIN)/esdoc -c esdoc.json

all: install lint test build doc


# Phonies
.PHONY: install lint test build doc all