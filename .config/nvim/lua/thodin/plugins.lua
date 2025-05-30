-- Ensure Packer is installed
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing packer.nvim...")
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

-- Load packer
vim.cmd([[packadd packer.nvim]])

-- Start packer
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Let packer manage itself

	-- gruvbox theme
	use("ellisonleao/gruvbox.nvim")

	-- nvim-tree for file tree exploring
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional file icons
		},
	})

	-- status line
	use("vim-airline/vim-airline")

	-- telescope for fuzzy finding
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	-- treesitter for syntax highlighting etc
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- mason for installing language clients
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- cmp for autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"hrsh7th/cmp-buffer", -- buffer source
			"hrsh7th/cmp-path", -- path source
			"hrsh7th/cmp-cmdline", -- command line source
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completions
		},
	})

	-- icons for lsp completion items
	use("onsails/lspkind.nvim")

	-- nicer display of references, errors etc.
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
		end,
	})

	-- show signature help for functions.
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				hint_enable = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	})

	-- for automatic formatting
	use({ "stevearc/conform.nvim" })
end)
