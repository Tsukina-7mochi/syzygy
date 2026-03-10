local describe = require("syzygy").describe
local test = require("syzygy").test
local expect = require("syzygy").expect

describe("toMatchObject", function ()
    test("{ a = 1, b = 2 } matches to { a = 1 }", function ()
        expect({ a = 1, b = 2 }):toMatchObject({ a = 1 })
    end)

    test("{ a = 1 } does not match to { a = 1, b = 2 }", function ()
        expect({ a = 1 }).not_:toMatchObject({ a = 1, b = 2 })
    end)
end)
