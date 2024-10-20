local nvimtree = require('nvim-tree')

nvimtree.setup({
    filters = {
        dotfiles = true
    },
    view = {
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
        width = 30
    },
})

local wk = require('which-key')
wk.add({
    { '<leader>e', '<cmd>NvimTreeFocus<cr>', desc = 'focus NvimTree' },
})
