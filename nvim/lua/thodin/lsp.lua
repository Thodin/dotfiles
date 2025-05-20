require('mason').setup()
require('mason-lspconfig').setup({
    automatic_enable = false,
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "omnisharp",
        "ts_ls",
        "eslint"
    }
})

-- Virtual text for errors
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Can be '●', '■', '▎', '➤', or just "" for no prefix
        spacing = 2,
    },
    signs = true,             -- Show signs in the gutter
    underline = true,         -- Underline the error line
    update_in_insert = false, -- Avoid updating while typing
    severity_sort = true,     -- Show most severe issues first
})


local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    -- print("LSP attached:", client.name)
    -- your keymaps here

    -- highlight occurrences of the currently selected variable
    -- TODO: adjust hold time (is too long) and highlighting (is too faint, only a bit of yellow)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        }
    }
})

-- Rust
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
                command = "clippy"
            }
        }
    }
})

-- C#
lspconfig.csharp_ls.setup({
    cmd = { "csharp-ls" },
    root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
    init_options = {
        AutomaticWorkspaceInit = true
    }
})

-- TS
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
})

lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
