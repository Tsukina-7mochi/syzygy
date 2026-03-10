local describe = require("syzygy").describe
local test = require("syzygy").test
local expect = require("syzygy").expect

describe("toBeNil", function ()
    test("nil is nil", function ()
        expect(nil):toBeNil()
    end)

    test("false is not nil", function ()
        expect(false).not_:toBeNil()
    end)
end)
