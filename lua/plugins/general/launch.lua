return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "↑" },
				changedelete = { text = "·" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "↑" },
				changedelete = { text = "·" },
			},
		},
	},
	{
		"tiagovla/scope.nvim",
		lazy = true,
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy", lazy = true },
}
