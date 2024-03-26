require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

vim.wo.wrap = false
vim.wo.relativenumber = true


vim.api.nvim_set_keymap("n", "<S-s>", "<cmd>:w<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<S-q>", "<cmd>:q!<CR>", { noremap = true })

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"


-- In order to modify the `lspconfig` configuration:

