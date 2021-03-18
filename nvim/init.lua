-- https://github.com/nanotee/nvim-lua-guide
-- require('legacy_config.vim')
-- vim.api["source"]("legacy_config.vim")
-- Plugins: https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

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
end)

vim.g.mapleader = " "
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.background = "dark"
vim.wo.number = true
vim.wo.numberwidth = 2
vim.cmd([[colorscheme OceanicNext]])

-- Fall back config
vim.api.nvim_exec("source ~/.config/nvim/config.vim", true)

-- OLD CONFIG
-- source ~/.vim/functions.vim
-- source ~/.vim/abbreviations.vim
-- source ~/.vim/mappings.vim
--
-- set background=dark
-- set path+=**
-- set autoindent
-- set autoread
-- set backspace=indent,eol,start
-- set directory=/tmp/
-- set display=lastline
-- set encoding=UTF-8
-- set expandtab tabstop=2 softtabstop=2 shiftwidth=2
-- set guicursor=a:blinkon0
-- set hidden
-- set hlsearch
-- set ignorecase smartcase
-- set laststatus=2
-- set list
-- set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
-- set mouse=""
-- set nobackup
-- set incsearch
-- set noswapfile
-- set nowrap
-- set number numberwidth=2
-- set pastetoggle=<F3>
-- set ruler rulerformat=%=%l/%L
-- set novisualbell " visualbel causes some weird char when in gnome terminal
-- set showcmd
-- set showmatch
-- set smarttab
-- set splitbelow
-- set splitright
-- set tabpagemax=20
-- set tags+=./tags.vendors
-- set tags+=tags-php
-- set tags+=tags-ruby
-- set tags+=tags-js
-- set tags+=gems.tags
-- set ttyfast
-- set wildignore+=*.so,*.swp,*.zip,*/build/*,*/coverage/*     " MacOSX/Linux
-- set wildmenu
-- set wildmode=list:longest,full
--
-- " Conditional settings
-- if exists("+undodir")
--   set undodir=~/.vimundodir
--   set undofile
--   if filewritable(&undodir) == 0
--     call mkdir(&undodir, "p")
--   endif
-- endif
--
-- if exists("+colorcolumn")
--   set colorcolumn=80
-- endif
--
-- if has("mac")
--   set clipboard=unnamed
-- elseif has("unix")
--   set clipboard=unnamedplus
-- endif
--
-- " Performance improvments
-- if has("mac")
--   set nocursorline
--
--   if exists("+relativenumber")
--     set norelativenumber
--   endif
--
--   set foldlevel=0
--   set foldmethod=manual
-- endif
--
-- "===============================================================================
-- " Autocommands:
-- "===============================================================================
-- " remember last position in file
-- autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
--
-- " Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
-- autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
--
-- " hb is handlebars
-- autocmd BufNewFile,BufRead *.hb set ai filetype=handlebars
--
-- " hbs is handlebars
-- autocmd BufNewFile,BufRead *.hbs set ai filetype=handlebars
--
-- " JSON is JS
-- " autocmd BufNewFile,BufRead *.json set ai filetype=javascript
-- " es6 is JS
-- autocmd BufNewFile,BufRead *.es6 set ai filetype=javascript
--
-- " enable spell check
-- autocmd FileType gitcommit setlocal spell spelllang=en_us,pt_br,de_de
-- autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,pt_br,de_de
-- autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us,pt_br,de_de
--
-- "===============================================================================
-- " Plugins
-- "===============================================================================
--
-- if !filereadable(".vim-skip-plugins")
--   call plug#begin('~/.vimplugged')
--     source ~/.vim/plugins/ag.vim
--     source ~/.vim/plugins/argumentrewrap.vim
--     source ~/.vim/plugins/eunuch.vim
--     source ~/.vim/plugins/fugitive.vim
--     source ~/.vim/plugins/fzf.vim
--     source ~/.vim/plugins/gist.vim
--     source ~/.vim/plugins/indentation-guides.vim
--     source ~/.vim/plugins/lightline.vim
--     source ~/.vim/plugins/nerdtree.vim
--     source ~/.vim/plugins/syntastic.vim
--     source ~/.vim/plugins/tabular.vim
--     source ~/.vim/plugins/ultisnipts.vim
--     source ~/.vim/plugins/vim-test.vim
--     source ~/.vim/plugins/vim-to-cterm.vim
--
--     " source ~/.vim/plugins/php.vim
--     source ~/.vim/plugins/ruby.vim
--     source ~/.vim/plugins/javascript.vim
--
--     Plug 'elixir-editors/vim-elixir'
--     Plug 'yukunlin/auto-pairs'          " fixed 'jiangmiao/auto-pairs'
--     " Plug 'endel/vim-github-colorscheme' " color
--     " Plug 'jonathanfilip/vim-lucius'     " color
--     " Plug 'chriskempson/base16-vim'      " color
--     " Plug 'nanotech/jellybeans.vim'      " color
--     Plug 'mhartington/oceanic-next'     " color
--     Plug 'Lokaltog/vim-easymotion'
--     " Plug 'airblade/vim-gitgutter'
--     Plug 'austintaylor/vim-commaobject'
--     " Plug 'joonty/vdebug'
--     Plug 'kana/vim-textobj-user'
--     Plug 'tomtom/tcomment_vim'
--     Plug 'tpope/vim-repeat'
--     Plug 'tpope/vim-speeddating'
--     Plug 'tpope/vim-surround'
--     " Plug 'slim-template/vim-slim'
--     Plug 'mechatroner/rainbow_csv'
--     Plug 'mattn/emmet-vim'
--     " Plug 'jparise/vim-graphql'
--     Plug 'othree/html5.vim'
--
--     if has('nvim')
--       Plug 'neovim/nvim-lspconfig'
--     endif
--   call plug#end()
-- end
--
-- "===============================================================================
-- " Appearence:
-- "===============================================================================
-- " colorscheme lucius
--
-- let base16colorspace=256
-- " colorscheme base16-tomorrow-night
-- colorscheme OceanicNext
-- " colorscheme jellybeans
-- call FixColors()
-- hi Normal guibg=NONE ctermbg=NONE
-- hi Normal guibg=NONE ctermbg=NONE
-- hi EndOfBuffer guibg=NONE ctermbg=NONE
--
-- "===============================================================================
-- " Allow overriding these settings:
-- "===============================================================================
-- if filereadable(expand("~/.vimrc.local"))
--   source ~/.vimrc.local
-- endif
--
-- if filereadable(".project.vim")
--   source .project.vim
-- endif
--
-- if filereadable(".editor/project.vim")
--   source .editor/project.vim
-- endif
