return {
	{
		"echasnovski/mini.comment",
		version = "*",
		lazy = true,
		config = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			options = {
				custom_commentstring = nil,
				ignore_blank_line = true,
				start_of_line = false,
				pad_comment_parts = true,
			},
			mappings = {
				-- Normal and Visual modes
				comment = "gca",
				-- Toggle comment on current line
				comment_line = "gcc",
				-- Toggle comment on visual selection
				comment_visual = "gcc",
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "gcs",
			},
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = true,
		event = "InsertEnter",
		opts = {},
	},
}
