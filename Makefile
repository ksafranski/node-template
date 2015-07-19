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

# Make things more readable
define colorecho
      @tput setaf 2
      @tput bold
      @printf "\n"
      @echo $1
      @echo ==========================================
      @tput sgr0
endef

# Tasks

clean:
	$(call colorecho, "Cleaning $(DIST) and $(DEPS)")
	rm -rf $(DIST) && rm -rf $(DEPS)

install:
	$(call colorecho, "Installing")
	npm i .

lint:
	$(call colorecho, "Linting $(SRC)")
	$(BIN)/eslint $(SRC)

test:
	$(call colorecho, "Testing $(TESTS)$(FILE)")
	$(BIN)/mocha --compilers js:babel/register $(TESTS)$(FILE)

build:
	$(call colorecho, "Building $(SRC) to $(DIST)")
	$(BIN)/babel $(SRC) --out-dir $(DIST)

start:
	$(call colorecho, "Starting...")
	node dist/server.js

doc:
	$(call colorecho, "Building Docs")
	$(BIN)/esdoc -c esdoc.json

dev: lint test build start

all: clean install lint test build doc


# Phonies
.PHONY: install lint test build doc start