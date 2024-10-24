require('mason').setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'clangd' },
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lspconfig = require('lspconfig')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function()
    vim.keymap.set('n', ' e', vim.diagnostic.open_float, { desc = 'error details' })
    vim.keymap.set('n', ' ]', vim.diagnostic.goto_prev, { desc = 'jump to previous error' })
    vim.keymap.set('n', ' [', vim.diagnostic.goto_next, { desc = 'jump to next error' })
    vim.keymap.set('n', ' q', vim.diagnostic.setloclist, { desc = 'show error list' })
    vim.keymap.set('n', ' gD', vim.lsp.buf.declaration, { desc = 'go to declaration' })
    vim.keymap.set('n', ' gd', vim.lsp.buf.definition, { desc = 'go to definition' })
    vim.keymap.set('n', ' gs', vim.lsp.buf.signature_help, { desc = 'show signature help' })
    vim.keymap.set('n', ' K', vim.lsp.buf.hover, { desc = 'hover' })
    vim.keymap.set('n', ' gI', vim.lsp.buf.implementation, { desc = 'go to implementation' })
    vim.keymap.set('n', ' D', vim.lsp.buf.type_definition, { desc = 'type definition' })
    vim.keymap.set('n', ' rn', vim.lsp.buf.rename, { desc = 'rename' })
    vim.keymap.set('n', ' ca', vim.lsp.buf.code_action, { desc = 'code actions' })
    vim.keymap.set('n', ' gr', vim.lsp.buf.references, { desc = 'references' })
    vim.keymap.set('n', ' f', function()
        vim.lsp.buf.format({ async = true })
    end, { desc = 'format' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup({
    cmd = {
        'clangd', '--completion-style=detailed', '--all-scopes-completion', '-header-insertion=never'
    },
    init_options = {
        fallbackFlags = { '-std=c++20', '-I/usr/local/include' },
    },
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.lua_ls.setup({
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {}
    }
})
