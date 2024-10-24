local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    'tanvirtin/monokai.nvim',

    {
        'onsails/lspkind.nvim',
        event = { 'VimEnter' },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'lspkind.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function()
            require('config.nvim-cmp')
        end
    },

    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        config = function()
            require('config.luasnip')
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('config.nvim-treesitter')
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'echasnovski/mini.nvim'
        },
        config = function()
            require('config.nvim-tree')
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('config.telescope')
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            require('config.indent-blankline')
        end
    },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('config.catppuccin')
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('config.lualine')
        end
    },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy'
    },

    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        config = function()
            require('config.nvim-ufo')
        end
    }
})
