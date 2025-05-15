-- GENERAL KEYBINDINGS
-- leader key
vim.g.mapleader = ' '

-- Edit this config file
vim.keymap.set('n', '<leader>;;', ':e $MYVIMRC<CR>', {})
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR><Esc>', { silent = true })



-- PACKAGE SPECIFIC KEYBINDINGS

-- nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>r', function ()
	builtin.lsp_references({
		prompt_title = 'Find references',
		default_text = ''
	})
end, { desc = 'Find references' })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)


-- diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>td', builtin.diagnostics)

-- go to definition/implementation
vim.keymap.set('n', '<leader>d', function() 
	builtin.lsp_definitions() 
end, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>i', function()
	builtin.lsp_implementations()
end, { desc = "Go to implementation" })
