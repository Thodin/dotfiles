-- Setup cmp
local lspkind = require("lspkind")
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text", -- show symbol and symbol_text
            maxwidth = 50, -- limit popup width
            ellipsis_char = "…", -- truncation char
        })
    }
})
