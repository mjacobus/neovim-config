config = require('lspconfig')
completion = require('completion').on_attach
utils = require('utils')
inoremap = utils.inoremap
nnoremap = utils.nnoremap

config.solargraph.setup{ on_attach = completion }
config.tsserver.setup{ on_attach = completion }

config.sumneko_lua.setup{}

-- Autocomplete
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}


-- inoremap('<tab>', '<Plug>(completion_smart_tab)') -- conflicts with  ultisnippets
-- inoremap('<s-tab>', '<Plug>(completion_smart_s_tab)')
vim.api.nvim_exec('imap <silent> <c-p> <Plug>(completion_trigger)', true)


-- disable ruby completion
vimp.nnoremap('<leader>dr', function()
  local disable_warnings = function(_, bufnr)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = false,

      -- show signs
      signs = false,

      -- delay update diagnostics
      update_in_insert = false,
    }
    )
  end

  require('lspconfig').solargraph.setup{ on_attach = disable_warnings }
  print('Annoying warnings disabled')
end)
