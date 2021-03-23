completion = require('completion').on_attach
config = require('lspconfig')

config.solargraph.setup{ on_attach = completion }
config.tsserver.setup{ on_attach = completion }

--Set completeopt to have a better completion experience
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
