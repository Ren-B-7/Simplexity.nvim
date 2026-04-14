return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
	opts = {
		linters_by_ft = {
			rust = { "bacon" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			python = { "pylint" },
			javascript = { "quick-lint-js" },
			typescript = { "quick-lint-js" },
			javascriptreact = { "quick-lint-js" },
			typescriptreact = { "quick-lint-js" },
			lua = { "selene" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
		},
	},
}
