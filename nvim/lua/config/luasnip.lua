local luasnip = require('luasnip')
local s = luasnip.snippet
local t = luasnip.text_node

vim.keymap.set({ 'i' }, '<C-K>', function() luasnip.expand() end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function() luasnip.jump(-1) end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

-- Function to create snippet from a file
local function snippet_from_file(file_path, trigger, description)
    local file = io.open(file_path, 'r')
    if not file then
        print('Could not open file: ' .. file_path)
        return
    end

    -- Read file content
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()

    -- Create and add snippet
    luasnip.add_snippets('cpp', {
        s(trigger, {
            t(lines) -- Insert the file's lines as the snippet body
        }, {
            description = description
        })
    })
end

local coding_library_path = '/Users/ivokaragyozov/Documents/cp/coding-library'

snippet_from_file(coding_library_path .. '/data-structures/fenwick_tree.hpp', 'fenwick', 'Fenwick Tree')
snippet_from_file(coding_library_path .. '/data-structures/segment_tree.hpp', 'segtree', 'Segment Tree')
snippet_from_file(coding_library_path .. '/data-structures/treap.hpp', 'treap', 'Treap')
snippet_from_file(coding_library_path .. '/data-structures/implicit_treap.hpp', 'imptreap', 'Implicit Treap')

snippet_from_file(coding_library_path .. '/graphs/max_flow.hpp', 'maxflow', 'Max Flow')
snippet_from_file(coding_library_path .. '/graphs/scc.hpp', 'scc', 'Strongly Connected Components')

snippet_from_file(coding_library_path .. '/maths/modnum.hpp', 'modnum', 'Modnum')

snippet_from_file(coding_library_path .. '/strings/hash.hpp', 'hashing', 'Hash')
snippet_from_file(coding_library_path .. '/strings/suffix_array.hpp', 'suffarr', 'Suffix Array')

snippet_from_file(coding_library_path .. '/template.cpp', 'cptemp', 'Competitive Programming Template')
