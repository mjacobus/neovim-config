-- Plugins managed by packer: https://github.com/wbthomason/packer.nvim

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

  -- Do I want them?
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
end)
