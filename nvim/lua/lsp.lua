require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "pyright" },
})

local lspconfig = require "lspconfig"

local lsp_mappings = function()
    vim.keymap.set("n", "<localleader>e", vim.diagnostic.open_float, { desc = "error details" })
    vim.keymap.set("n", "<localleader>]", vim.diagnostic.goto_prev, { desc = "jump to previous error" })
    vim.keymap.set("n", "<localleader>[", vim.diagnostic.goto_next, { desc = "jump to next error" })
    vim.keymap.set("n", "<localleader>q", vim.diagnostic.setloclist, { desc = "show error list" })
    vim.keymap.set("n", "<localleader>gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
    vim.keymap.set("n", "<localleader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
    vim.keymap.set("n", "<localleader>gs", vim.lsp.buf.signature_help, { desc = "show signature help" })
    vim.keymap.set("n", "<localleader>h", vim.lsp.buf.hover, { desc = "hover" })
    vim.keymap.set("n", "<localleader>gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
    vim.keymap.set("n", "<localleader>d", vim.lsp.buf.type_definition, { desc = "type definition" })
    vim.keymap.set("n", "<localleader>a", vim.lsp.buf.code_action, { desc = "code actions" })
    vim.keymap.set("n", "<localleader>gr", vim.lsp.buf.references, { desc = "references" })
    vim.keymap.set("n", "<localleader>f", function()
        vim.lsp.buf.format { async = true }
    end, { desc = "format" })
    vim.keymap.set("n", "<localleader>rn", vim.lsp.buf.rename, { desc = "rename" })
end

local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup {
    init_options = {
        fallbackFlags = {
            "-std=c++17",
            "-I/Users/ivokaragyozov/Documents/cp/coding-library"
        },
    },
    capabilities = caps,
    on_attach = lsp_mappings,
    settings = {
        clangd = {
            backgroundIndexing = true,
        },
    },
}

lspconfig.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.fn.filereadable(path .. "/.luarc.json") == 1 or vim.fn.filereadable(path .. "/.luarc.jsonc") == 1 then
                return
            end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME -- Add Neovim runtime to Lua library
                }
            }
        })
    end,
    on_attach = lsp_mappings,
    capabilities = caps,
    settings = {
        Lua = {}
    }
}

lspconfig.pyright.setup({
    on_attach = lsp_mappings(),
    capabilities = caps,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
            formatting = {
                provider = "black",
            },
        }
    }
})
