local describe = require("syzygy").describe
local test = require("syzygy").test
local expect = require("syzygy").expect

describe("toBeFalsy", function ()
    test("false is falsy", function ()
        expect(false):toBeFalsy()
    end)

    test("true is not falsy", function ()
        expect(true).not_:toBeFalsy()
    end)

    test("nil is falsy", function ()
        expect(nil):toBeFalsy()
    end)

    test("0 is not falsy", function ()
        expect(0).not_:toBeFalsy()
    end)

    test("empty string is not falsy", function ()
        expect("").not_:toBeFalsy()
    end)
end)
