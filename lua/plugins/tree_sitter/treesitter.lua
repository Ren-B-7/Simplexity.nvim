-- Treesitter is a new parser generator tool that we can
-- use in Neovim to power faster and more accurate
-- syntax highlighting.
return {
	{
		"romus204/tree-sitter-manager.nvim",
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"python",
					"query",
					"rust",
					"javascript",
					"typescript",
					"bash",
					"json",
					"xml",
					"html",
					"yaml",
					"vim",
					"markdown",
					"markdown_inline",
				},
				auto_install = false,
				highlight = true,
				nohighlight = {},
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { { "romus204/tree-sitter-manager.nvim" } },
		lazy = true,
		opts = {},
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"romus204/tree-sitter-manager.nvim-textobjects",
		dependencies = { "romus204/tree-sitter-manager.nvim" },
		enabled = true,
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "romus204/tree-sitter-manager.nvim" },
		enabled = true,
		lazy = true,
		ft = {
			"astro",
			"glimmer",
			"handlebars",
			"html",
			"javascript",
			"jsx",
			"markdown",
			"php",
			"rescript",
			"svelte",
			"tsx",
			"twig",
			"typescript",
			"vue",
			"xml",
		},

		opts = {},
	},
}
