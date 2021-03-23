config = require('lspconfig')
completion = require('completion').on_attach
inoremap = require('utils').inoremap

config.solargraph.setup{ on_attach = completion }
config.tsserver.setup{ on_attach = completion }

config.sumneko_lua.setup{}

-- Autocomplete
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}


inoremap('<tab>', '<Plug>(completion_smart_tab)') -- conflicts with  ultisnippets
inoremap('<s-tab>', '<Plug>(completion_smart_s_tab)')
vim.api.nvim_exec('imap <silent> <c-p> <Plug>(completion_trigger)', true)
