local table_move = function (a1, f, e, t, a2)
    a2 = a2 or a1
    for i = 0, e - f do
        a2[t + i] = a1[f + i]
    end
end

local function load ()
    table.move = table.move or table_move
end

return { load = load }
