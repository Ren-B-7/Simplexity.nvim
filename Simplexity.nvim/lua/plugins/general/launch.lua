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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = true,
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"tiagovla/scope.nvim",
		lazy = true,
	},
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy", lazy = true },
}
