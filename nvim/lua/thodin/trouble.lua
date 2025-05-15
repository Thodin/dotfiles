require("trouble").setup({
    position = "bottom",            -- bottom, top, left, right
    height = 10,                    -- height of the window
    mode = "workspace_diagnostics", -- default mode
    fold_open = "",
    fold_closed = "",
    group = false,  -- group by file
    padding = true, -- add padding
    indent_lines = true,
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = true -- use signs defined in LSP
})

-- Use trouble instead of telescope's preview
local troubleTelescope = require("trouble.sources.telescope")

require("telescope").setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = troubleTelescope.open },
            n = { ["<c-t>"] = troubleTelescope.open },
        }
    }
})
