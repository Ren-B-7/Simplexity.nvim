local extensions = {
	media_files = {
		filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "webm", "mp4", "mp3" },
		find_cmd = "rg",
	},
	git_command = { "git", "log", "--oneline", "--decorate", "--all", "." },
	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				lazy = true,
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
		lazy = true,
		cmd = { "Telescope" },
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-q>"] = actions.close,
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
				pickers = { buffers = { show_all_buffers = true } },
				extensions = extensions,
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		-- opts = {
		--     -- don't use `defaults = { }` here, do this in the main telescope spec
		--     extensions = {
		--         undo = {
		--             -- telescope-undo.nvim config, see below
		--         },
		--         -- no other extensions here, they can have their own spec too
		--     },
		-- },
		config = function()
			-- Calling telescope's setup from multiple specs does not hurt, it will happily merge the configs
			-- require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
	{
		"paopaol/telescope-git-diffs.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			require("telescope").load_extension("git_diffs")
		end,
	},
	{
		"benfowler/telescope-luasnip.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			require("telescope").load_extension("luasnip")
		end,
	},
}
