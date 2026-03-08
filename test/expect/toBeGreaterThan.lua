local describe = require("src.test").describe
local test = require("src.test").test
local expect = require("src.test").expect

describe("toBeGreaterThan", function ()
    test("1 is greater than 0", function ()
        expect(1):toBeGreaterThan(0)
    end)

    test("0 is not greater than 0", function ()
        expect(0).not_:toBeGreaterThan(0)
    end)

    test("0 is not greater than 1", function ()
        expect(0).not_:toBeGreaterThan(1)
    end)

    test('"aab" is greater than "aaa"', function ()
        expect("aab"):toBeGreaterThan("aaa")
    end)
end)
