local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.fn.isdirectory(lazypath) == 0 then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Mason and LSP
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        },
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("config.none-ls")
        end,
    },

    -- Completion & Snippets
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp"
        },
        event = "InsertEnter",
        config = function()
            require("config.nvim-cmp")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        event = "InsertEnter",
        config = function()
            require("config.luasnip")
        end,
    },


    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("config.nvim-treesitter")
        end,
    },

    -- Nvim Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.nvim"
        },
        config = function()
            require("config.nvim-tree")
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("config.telescope")
        end,
    },


    -- Identation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPre",
        config = function()
            require("config.indent-blankline")
        end,
    },


    -- Colorschemes
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("config.catppuccin")
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        lazy = false,
        config = function()
            require("config.lualine")
        end,
    },

    -- Which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup({
                icons = {
                    breadcrumb = "»",
                    separator = "➜",
                    group = "+",
                    mappings = false
                },
                layout = {
                    align = "center",
                },
            })
        end,
    },

    -- Folds
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        },
        event = "BufReadPost",
        config = function()
            require("config.nvim-ufo")
        end,
    },

    -- Formatting
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                log_level = vim.log.levels.DEBUG,
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = {
                        "black",
                        command = vim.fn.stdpath("data") .. "/mason/bin/black"
                    }
                }
            })
        end,
    }
})
