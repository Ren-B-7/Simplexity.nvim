vim.loader.enable()

require("config.opts")
require("config.lazy")
require("config.keymaps")
require("config.autocmd")

require("utils.commands").start()
