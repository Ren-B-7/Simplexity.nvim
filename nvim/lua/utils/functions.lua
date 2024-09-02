local api = vim.api
local cmd = vim.cmd
local logs = vim.log
local fn = vim.fn

local set_opts = api.nvim_set_option_value
local get_opts = api.nvim_get_option_value

local utils = {}

utils.DEBUG = logs.levels.debug
utils.INFO = logs.levels.info
utils.TRACE = logs.levels.trace
utils.WARN = logs.levels.warn
utils.ERROR = logs.levels.error
utils.OFF = 0

utils.notify = function(message, log)
	if log ~= utils.OFF then
		vim.notify(message, log)
	end
end

utils.toggle_list_and_col = function(log)
	log = log or utils.INFO
	utils.notify("Toggle column and list", log)
	utils.toggle_list(utils.OFF)
	utils.toggle_colorcol(utils.OFF)
end

utils.toggle_colorcol = function(log)
	log = log or utils.INFO
	utils.notify("Toggle colorcolumn", log)

	local val = (get_opts("colorcolumn", {}) == "" and tostring(get_opts("textwidth", {})) or "")
	set_opts("colorcolumn", val, {})
end

utils.toggle_list = function(log)
	log = log or utils.INFO
	utils.notify("Toggle list", log)
	cmd("set list!")
end

utils.toggle_modifiable = function(log)
	log = log or utils.INFO
	utils.notify("Toggle modifiable", log)

	cmd("setlocal modifiable!")
end

utils.reload_nvim_tree = function(log)
	log = log or utils.INFO
	utils.notify("Reload Nvim Tree", log)

	require("nvim-tree.api").tree.open()
	require("nvim-tree.api").tree.reload()
	require("nvim-tree.api").tree.focus()
end

utils.toggle_format_on_save = function(log)
	log = log or utils.INFO
	utils.notify("Toggle format on save", log)

	if vim.g.autoformat then
		vim.g.autoformat = false
		cmd('echo "Format disabled"')
	else
		vim.g.autoformat = true
		cmd('echo "Format enabled"')
	end
end

return utils
