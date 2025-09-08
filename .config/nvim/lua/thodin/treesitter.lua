-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'lua', 'vim', 'bash', 'markdown', 'json', 'rust', 'typescript', 'tsx', 'javascript', 'html', 'css' },
	highlight = {
		enabled = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enabled = true
	}
}
