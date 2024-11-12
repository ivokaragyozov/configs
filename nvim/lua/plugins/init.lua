return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre',
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = {
            "kevinhwang91/promise-async"
        },
        config = function()
            require "configs.ufo"
        end
    },

    {
        "L3MON4D3/LuaSnip",
        lazy = false,
        config = function()
            require "configs.luasnip"
        end
    }
}
