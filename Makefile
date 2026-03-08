LUA = lua
DIST = ./dist/syzygy.lua
NEBLUA = ./library/neblua-cli.lua

all: build

$(NEBLUA):
	mkdir -p ./library
	curl -sSL https://github.com/Tsukina-7mochi/neblua/releases/latest/download/neblua-cli.lua > $(NEBLUA)

build: $(NEBLUA)
	rm -f $(DIST)
	mkdir -p $$(dirname $(DIST))
	$(LUA) $(NEBLUA) -e src.test -o $(DIST)

.PHONY: test
test:
	$(LUA) ./test/test.lua

.PHONY: clean
clean:
	rm -rf $(DIST)

.PHONY: format
format:
	stylua .
