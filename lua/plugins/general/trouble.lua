return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	opts = {
		modes = {
			lsp = {
				win = { position = "right", size = 0.3 },
			},
		},
		icons = {
			indent = {
				top = "│ ",
				middle = "├─ ",
				last = "└─ ",
				fold_open = " ",
				fold_closed = " ",
				ws = "  ",
			},
		},
	},
}
