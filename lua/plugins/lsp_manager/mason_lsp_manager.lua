local custom_configs = {}

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		lazy = true,
		opts = {
			ensure_installed = {},
			automatic_installation = true,
		},
		event = { "BufAdd" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup()

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
				local opts = {
					capabilities = capabilities,
				}

				if custom_configs[server_name] then
					opts = vim.tbl_deep_extend("force", opts, custom_configs[server_name])
				end

				require("lspconfig")[server_name].setup(opts)
			end
		end,
	},
	{
		"mason-org/mason.nvim",
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
