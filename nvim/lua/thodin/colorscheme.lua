-- Setup gruvbox color scheme
require('gruvbox').setup({
	contrast = 'hard',
	italic = {
		strings = false,
		comments = false,
		operators = false,
		folds = false
	}
})

vim.o.background = 'dark'
vim.cmd([[colorscheme gruvbox]])
