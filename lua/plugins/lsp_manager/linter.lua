return {
	"mfussenegger/nvim-lint",
	enabled = true,
	lazy = true,
	event = {
		"InsertLeave",
		"InsertEnter",
	},
	config = function()
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
			"InsertEnter",
		}, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	opts = {
		linters_by_ft = {
			rust = { "bacon" },
			rs = { "bacon" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			python = { "pylint" },
			py = { "pylint" },
			javascript = { "quick-lint-js" },
			typescript = { "quick-lint-js" },
			javascriptreact = { "quick-lint-js" },
			typescriptreact = { "quick-lint-js" },
			lua = { "selene" },
			luau = { "selene" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
			zsh = { "shellcheck" },
			ksh = { "shellcheck" },
			csh = { "shellcheck" },
		},
	},
	keys = {
		{
			"<leader>ml",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Trigger linting for current file",
		},
	},
}
