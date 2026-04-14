local custom_configs = {}

return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {},
			automatic_installation = true,
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			mason_lspconfig.setup(opts)

			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_opts = {
						capabilities = capabilities,
					}
					if custom_configs[server_name] then
						server_opts = vim.tbl_deep_extend("force", server_opts, custom_configs[server_name])
					end
					lspconfig[server_name].setup(server_opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonLog" },
		event = { "UIEnter" },
		config = function()
			require("mason").setup()

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				virtual_text = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
}
