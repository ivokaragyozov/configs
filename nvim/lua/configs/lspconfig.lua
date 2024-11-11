-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "lua_ls", "clangd", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

local lsp_mappings = function()
    vim.keymap.set("n", ";e", vim.diagnostic.open_float, { desc = "error details" })
    vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_prev, { desc = "jump to previous error" })
    vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_next, { desc = "jump to next error" })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "show error list" })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
    vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "show signature help" })
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "hover" })
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, { desc = "type definition" })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "code actions" })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "references" })
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
    end, { desc = "format" })
end

local capabilities = nvlsp.capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function()
            lsp_mappings()
        end,
        on_init = nvlsp.on_init,
        capabilities = capabilities,
    }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
