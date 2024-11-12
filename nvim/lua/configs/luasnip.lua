local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

-- function to create snippet from a file
local function snippet_from_file(file_path, trigger, description)
    local file = io.open(file_path, "r")
    if not file then
        print("Could not open file: " .. file_path)
        return
    end

    -- Read file content
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()

    -- Create and add snippet
    luasnip.add_snippets("cpp", {
        s(trigger, {
            t(lines) -- Insert the file"s lines as the snippet body
        }, {
            description = description
        })
    })
end

snippet_from_file("/Users/ivokaragyozov/Documents/cp/coding-library/template.cpp", "cptemp",
    "Competitive Programming Template")
