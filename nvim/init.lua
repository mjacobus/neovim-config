-- https://github.com/nanotee/nvim-lua-guide
-- require('legacy_config.vim')
-- vim.api["source"]("legacy_config.vim")
-- Plugins: https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'mattn/gist-vim',
    requires = {{'mattn/webapi-vim'}}
  }

  use { 'mjacobus/vim-snippets', requires = {{ 'sirver/ultisnips' }}}

  use  {
    "svermeulen/vimpeccable"
    -- requires = {{ 'svermeulen/vimpeccable-lua-vimrc-example', 'morhetz/gruvbox' }}
  } -- dsl for mappings
  use 'mhartington/oceanic-next'
  use 'elixir-editors/vim-elixir'
  use 'yukunlin/auto-pairs'
  use 'Lokaltog/vim-easymotion'
  use 'austintaylor/vim-commaobject'
  use 'kana/vim-textobj-user'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'mechatroner/rainbow_csv'
  use 'mattn/emmet-vim'
  use 'othree/html5.vim'
  use 'neovim/nvim-lspconfig'
  use 'rking/ag.vim'
  use 'weierophinney/argumentrewrap'
  use 'tpope/vim-eunuch'
  use 'scrooloose/nerdtree'
  use 'godlygeek/tabular'
  use 'tpope/vim-fugitive'
  -- use 'hrsh7th/vim-vsnip' -- check out

  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use {
    'junegunn/fzf',  run = './install --all'
  }

  -- ruby
  use 'noprompt/vim-yardoc'
  use 'hallison/vim-rdoc'

  use 'pwntester/octo.nvim'

  --     source ~/.vim/plugins/indentation-guides.vim
  --     source ~/.vim/plugins/lightline.vim
  --     source ~/.vim/plugins/syntastic.vim
  --     source ~/.vim/plugins/ultisnipts.vim
  --     source ~/.vim/plugins/vim-test.vim
  --     " source ~/.vim/plugins/php.vim
  --     source ~/.vim/plugins/ruby.vim
  --     source ~/.vim/plugins/javascript.vim
  --     " Plug 'airblade/vim-gitgutter'
  --     " Plug 'slim-template/vim-slim'
  --     " Plug 'jparise/vim-graphql'
  --     Plug 'othree/html5.vim'
  --
end)

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

-- nnoremap  <leader>j :buffer #<cr>:bd! term://<cr>

-- OLD CONFIG
-- source ~/.vim/functions.vim
-- source ~/.vim/abbreviations.vim
-- source ~/.vim/mappings.vim
--
-- set path+=**
-- set expandtab tabstop=2 softtabstop=2 shiftwidth=2
-- set guicursor=a:blinkon0
-- set hidden
-- set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
-- set mouse=""
-- set nobackup
-- set noswapfile
-- set nowrap
-- set number numberwidth=2
-- set showmatch
-- set wildignore+=*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux
-- set wildmode=list:longest,full
--
--
--
--
-- " enable spell check
