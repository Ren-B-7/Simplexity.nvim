local statusok, alpha, theme, dashboard

local recent_align = "center"
local recent_files = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent files",
			opts = {
				hl = "SpecialComment",
			},
		},
		{
			type = "group",
			val = function()
				local temp = theme.mru(0, vim.fn.getcwd(), 10, theme.mru_opts)
				temp.opts = {
					shrink_margin = false,
					position = recent_align,
					inherit = { shrink_margin = false, position = recent_align },
				}
				return { temp }
			end,
		},
	},
	opts = {
		shrink_margin = false,
		position = recent_align,
		inherit = { shrink_margin = false, position = recent_align },
	},
}

local create = function()
	statusok, alpha = pcall(require, "alpha")
	if not statusok then
		return
	end
	theme = require("alpha.themes.theta")
	dashboard = require("alpha.themes.dashboard")
	local themeconfig = theme.config
	local plugs = require("lazy").stats()

	themeconfig.layout[1] = { type = "padding", val = 2 }
	themeconfig.layout[2] = {
		type = "text",
		val = {
			".d88888b  dP 8888ba.88ba   888888ba  dP                          oo   dP            ",
			"88.    \"' 88 88  `8b  `8b  88    `8b 88                               88            ",
			"`Y88888b. 88 88   88   88 a88aaaa8P' 88        .d8888b. dP.  .dP dP d8888P dP    dP ",
			"      `8b 88 88   88   88  88        88        88ooood8  `8bd8'  88   88   88    88 ",
			"d8'   .8P 88 88   88   88  88        88        88.  ...  .d88b.  88   88   88.  .88 ",
			" Y88888P  dP dP   dP   dP  dP        88888888P `88888P' dP'  `dP dP   dP   `8888P88 ",
			"oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo~~~~.88~",
			"                                                                            d8888P  ",
		},

		opts = { position = "center", hl = "Number" },
	}
	themeconfig.layout[3] = { type = "padding", val = 1 } --padding

	themeconfig.layout[4] = recent_files -- recent files

	themeconfig.layout[5] = { type = "padding", val = 1 } --padding

	themeconfig.layout[6] = {
		type = "group",
		val = {
			dashboard.button("e", "  > New file", "<cmd>ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  > Find file", "<cmd> Telescope find_files <CR>"),
			dashboard.button("o", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("l", "󰚥  > Plugin manager", "<cmd>Lazy<CR>"),
			dashboard.button("b", "  > Bookmarks", "<cmd>lua require('harpoon.ui').toggle_quick_menu() <CR>"),
			dashboard.button("m", "  > Mason", "<cmd>Mason<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
		},
		position = "center",
	}

	themeconfig.layout[7] = { type = "padding", val = 1 }

	themeconfig.layout[8] = {
		type = "text",
		val = {
			"Plugins listed     " .. plugs.count .. " plugins 󰗇",
			"Plugins loaded     " .. plugs.loaded .. " plugins 󰚥",
		},
		opts = { position = "center", hl = "Comment" },
	}

	return themeconfig
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	lazy = true,
	priority = 1,
	event = "VimEnter",
	config = function()
		require("alpha").setup(create())
	end,
}
