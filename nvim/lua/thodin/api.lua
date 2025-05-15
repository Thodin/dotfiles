-- Format rust files on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.rs", "*.ts", "*.tsx", "*.cs", "*.lua" },
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
