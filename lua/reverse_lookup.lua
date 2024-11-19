local M = {}

function M.add_reverse_lookup(t)
    for key, value in pairs(t) do
        if type(value) == "string" or type(value) == "number" then
            t[value] = key
        end
    end
end

return M
