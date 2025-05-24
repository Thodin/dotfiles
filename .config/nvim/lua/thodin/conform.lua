require("conform").setup({
	formatters_by_ft = {
		rust = { "rustfmt" },
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		cs = { "csharpier" },
	},
	formatters = {
		csharpier = {
			command = "csharpier",
			args = { "format", "--write-stdout", "--no-cache" },
			stdin = true,
		},
	},
})
