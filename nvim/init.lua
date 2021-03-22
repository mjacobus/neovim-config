require('plugins')
-- https://github.com/nanotee/nvim-lua-guide

-- ===============================================================================
-- LSP
-- ===============================================================================
require('lspconfig').solargraph.setup{}

vim.g.mapleader = " "
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.background = "dark"
vim.wo.number = true
vim.wo.numberwidth = 2
vim.wo.wrap = false
vim.cmd([[colorscheme OceanicNext]])
vim.api.nvim_set_option('clipboard', 'unnamed')

-- Fall back config
vim.api.nvim_exec("source ~/.config/nvim/config.vim", true)

require('vimp')
-- vimp.nnoremap('<cr>', function(a, b)
vimp.nnoremap('<leader>j', function(a, b)
  name = vim.api.nvim_buf_get_name(0)

  if string.find(name, "term://") then
    vim.api.nvim_exec('buffer #', true)
  else
    -- vim.api.nvim_exec('<cr>', true)
  end
end)

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "vendor/*", "tmp/backup/**/*", "node_modules/*" }
  }
}
