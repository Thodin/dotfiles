require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "rust_analyzer" }
})

local lspconfig = require('lspconfig')

-- Lua
lspconfig.lua_ls.setup {
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
}

-- Rust
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = {
				command = "clippy"
			}
		}
	}
})
