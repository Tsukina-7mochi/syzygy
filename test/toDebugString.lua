local describe = require("src.test").describe
local test = require("src.test").test
local expect = require("src.test").expect
local toDebugString = require("src.toDebugString")

describe("toDebugString", function ()
    test("nil", function ()
        expect(toDebugString(nil)):toBe("nil")
    end)

    describe("boolean", function ()
        test("true", function ()
            expect(toDebugString(true)):toBe("true")
        end)

        describe("number", function ()
            test("integer", function ()
                expect(toDebugString(1)):toBe("1")
            end)

            test("float", function ()
                expect(toDebugString(1.5)):toBe("1.5")
            end)

            test("inf", function ()
                expect(toDebugString(math.huge)):toBe("inf")
            end)
        end)

        test("false", function ()
            expect(toDebugString(false)):toBe("false")
        end)
    end)

    describe("string", function ()
        test("empty", function ()
            expect(toDebugString("")):toBe('""')
        end)

        test("normal", function ()
            expect(toDebugString("hello")):toBe('"hello"')
        end)

        test("new line", function ()
            expect(toDebugString("hello\nworld")):toBe('"hello\\nworld"')
        end)

        test("binary", function ()
            expect(toDebugString("\xA0")):toBe('"\\xA0"')
        end)
    end)

    describe("table", function ()
        test("empty", function ()
            expect(toDebugString({})):toBe("{}")
        end)

        test("simple array", function ()
            expect(toDebugString({ 1, 2, 3 })):toBe("{ 1, 2, 3 }")
        end)

        test("array with hole", function ()
            expect(toDebugString({ [1] = 1, [5] = 3 })):toBe(
                "{ 1, (empty x 3), 3 }"
            )
        end)

        test("array with large hole", function ()
            expect(toDebugString({ [1] = 1, [100] = 3 })):toBe(
                "{ 1, [100] = 3 }"
            )
        end)

        test("array start with 0", function ()
            expect(toDebugString({ [0] = 0, 1, 2 })):toBe("{ [0] = 0, 1, 2 }")
        end)

        test("array start with 2", function ()
            expect(toDebugString({ [2] = 2, [3] = 3, [4] = 4 })):toBe(
                "{ [2] = 2, 3, 4 }"
            )
        end)

        test("array start with -1", function ()
            expect(toDebugString({ [-1] = -1, [0] = 0, 1 })):toBe(
                "{ [-1] = -1, 0, 1 }"
            )
        end)

        test("array with decimal index", function ()
            expect(toDebugString({ 1, 2, [1.5] = 1.5 })):toBe(
                "{ 1, [1.5] = 1.5, [2] = 2 }"
            )
        end)

        test("simple map", function ()
            expect(toDebugString({ key1 = "value1", key2 = "value2" })):toBe(
                '{ key1 = "value1", key2 = "value2" }'
            )
        end)

        test("array and map mixed", function ()
            expect(toDebugString({ 1, 2, 3, foo = "bar" })):toBe(
                '{ 1, 2, 3, foo = "bar" }'
            )
        end)
    end)
end)
