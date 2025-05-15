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

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    -- print("LSP attached:", client.name)
    -- your keymaps here
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
lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "OmniSharp" },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
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
