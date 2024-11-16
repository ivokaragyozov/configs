local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")

nvimtree.setup({
    filters = {
        dotfiles = true
    },
    view = {
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        width = 30
    },
})

vim.keymap.set("n", ",e", api.tree.focus, { desc = "focus tree" })
