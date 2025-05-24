require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true
        }
    },
    defaults = {
        file_ignore_patterns = { 'node_modules', '.git' },
        prompt_prefix = '> ',
        color_devicons = true,
        initial_mode = "insert",
        path_display = { "tail" } -- show only filename
    },
    pickers = {
        find_files = {
            hidden = true,
            follow = true,
        }
    }
}

require('telescope').load_extension('fzf')
