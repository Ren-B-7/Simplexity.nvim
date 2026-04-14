local g = vim.g
local opt = vim.opt
local uv = vim.uv

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.autoformat = true

opt.number = true

opt.relativenumber = true
opt.signcolumn = "yes:1"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.textwidth = 80
opt.expandtab = true

opt.listchars = { eol = "¬", tab = ">>", trail = "·", space = "␣" }

-- Modern options
opt.cursorline = true
opt.cursorlineopt = "both"
opt.smoothscroll = true
opt.virtualedit = "block"

-- Spelling settings
opt.spell = true
opt.spelllang = { "en" }

opt.wrap = false

opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.modifiable = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Set nvim clipboard and system clipboard
opt.clipboard = "unnamedplus"

opt.scrolloff = 8
opt.updatetime = 100

opt.termguicolors = true

opt.sessionoptions = { -- required
	"buffers",
	"tabpages",
	"globals",
	"resize",
	"terminal",
}
