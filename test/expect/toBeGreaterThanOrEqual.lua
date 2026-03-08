local describe = require("syzygy").describe
local test = require("syzygy").test
local expect = require("syzygy").expect

describe("toBeGreaterThanOrEqual", function ()
    test("1 is greater than 0", function ()
        expect(1):toBeGreaterThanOrEqual(0)
    end)

    test("0 is equals to 0", function ()
        expect(0):toBeGreaterThanOrEqual(0)
    end)

    test("0 is not greater or equals to than 1", function ()
        expect(0).not_:toBeGreaterThanOrEqual(1)
    end)

    test('"aab" is greater than "aaa"', function ()
        expect("aab"):toBeGreaterThanOrEqual("aaa")
    end)

    test('"aaa" is greater than "aaa"', function ()
        expect("aaa"):toBeGreaterThanOrEqual("aaa")
    end)
end)
