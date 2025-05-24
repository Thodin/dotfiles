-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'lua', 'vim', 'bash', 'markdown', 'json', 'rust' },
	highlight = {
		enabled = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enabled = true
	}
}
