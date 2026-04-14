return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local format_root = vim.fs.find(function(name, path)
			return name:match(".*%.clang-format$")
		end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })

		conform.setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				sh = { "beautysh" },
				python = { "black" },
				c = { "clang-format" },
				csharp = { "clang-format" },
				cpp = { "clang-format" },
				json = { "prettier" },
				java = { "clang-format" },
				javascript = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				typescript = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = function()
				if not vim.g.autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
			formatters = {
				clang_format = {
					prepend_args = function()
						local args = { "--fallback-style=webkit" }
						if format_root and #format_root > 0 then
							table.insert(args, 1, "--style-file:" .. format_root[1])
						end
						return args
					end,
				},
			},
		})
	end,
	keys = {
		{
			"<leader>mf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
}
