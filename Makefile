LUA = lua
DIST = ./dist/syzygy.lua
NEBLUA = ./library/neblua-cli.lua
LUA_PATH = "./?.lua;./?/init.lua;./src/?.lua;./src/?/init.lua"

all: build

$(NEBLUA):
	mkdir -p ./library
	curl -sSL https://github.com/Tsukina-7mochi/neblua/releases/latest/download/neblua-cli.lua > $(NEBLUA)

.PHONY: build
build: $(NEBLUA)
	rm -f $(DIST)
	mkdir -p $$(dirname $(DIST))
	LUA_PATH=$(LUA_PATH) $(LUA) $(NEBLUA) -e src.syzygy -o $(DIST)

.PHONY: test
test:
	LUA_PATH=$(LUA_PATH) $(LUA) ./test/test.lua

.PHONY: clean
clean:
	rm -rf $(DIST)

.PHONY: format
format:
	stylua .
