" this are the configs that I mean to move to init.lua
inoremap jj <ESC>:w<cr>


set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set noswapfile
set splitright

autocmd BufWrite * :call <sid>MkdirsIfNotExists(expand("<afile>:h"))

" TODO: find out why it wont work when the function is not herer
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system("mkdir -p ".shellescape(a:directory))
  endif
endfunction

" Conditional settings
set undodir=~/.nvimundodir
set undofile

if filewritable(&undodir) == 0
  call mkdir(&undodir, "p")
endif

"  Telescope Plugin
nnoremap <leader>p  <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" use 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gac :Gcommit -am ""<LEFT>
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>

" Resolving conflics
" Vimcasts #33
" also https://www.youtube.com/watch?v=PO6DxfGPQvw
" nnoremap <leader>gd :Gdiff<cr>
" " get target version: diff get target
" nnoremap <leader>dgt :diffget //2 \| :diffupdate<cr>
" " get branch version: diff get branch
" nnoremap <leader>dgb :diffget //3 \| :diffupdate<cr>

noremap <leader>g1 :diffget //1<CR>
noremap <leader>gj :diffget //3<CR>
noremap <leader>gf :diffget //2<CR>

" returns to the previous buffer and closes all terminal buffers
" nnoremap  <leader>j :buffer #<cr>:bd! term://<cr>

" LSP stuff
set omnifunc="v:lua.vim.lsp.omnifunc"
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"
" " Avoid showing message extra message when using completion
set shortmess+=c

" gist plugin
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" use 'rking/ag.vim'
" nnoremap g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>ag :Ag!<space>
vnoremap <leader>ag y:Ag! '<C-R>"'
nnoremap <leader>lag :Ag<up><cr>
nnoremap <leader>ga :AgAdd!<space>
nnoremap <leader>g# :Ag! -w <C-R><C-W><space>
nnoremap <leader>gn :cnext<CR>
nnoremap <leader>gp :cprev<CR>
nnoremap <leader>gq :ccl<CR>
nnoremap <leader>gl :cwindow<CR>

" use 'weierophinney/argumentrewrap'
nnoremap <leader>wa :call argumentrewrap#RewrapArguments()<CR>

" Plugin tpope/vim-eunuch'
nnoremap <leader>mv :Move<space>
nnoremap <leader>rn :Rename<space>
nnoremap <leader>rm :Delete<cr>

" use 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
nnoremap <c-n> :NERDTreeToggle<CR>

" use 'godlygeek/tabular'
function! CustomTabularPatterns()
  if exists('g:tabular_loaded')
    AddTabularPattern! symbols / :/l0
    AddTabularPattern! hash /^[^>]*\zs=>/
    AddTabularPattern! chunks / \S\+/l0
    AddTabularPattern! assignment / = /l0
    AddTabularPattern! comma /^[^,]*,/l1
    AddTabularPattern! colon /:\zs /l0
    AddTabularPattern! options_hashes /:\w\+ =>/
  endif
endfunction

autocmd VimEnter * call CustomTabularPatterns()

nnoremap <leader>a\| :Tabularize /\|<CR>
vnoremap <leader>a\| :Tabularize /\|<CR>
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
nnoremap <leader>ar :Tabularize /=><CR>
vnoremap <leader>ar :Tabularize /=><CR>

" use mjacobus/vim-snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author="Marcelo Jacobus <marcelo.jacobus@gmail.com>"


" use 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<cr>
nnoremap <mleader>rm :Remove<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

"===============================================================================
" functions
"===============================================================================

" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction

" create directory for the current buffer
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call system("mkdir -p ".shellescape(a:directory))
  endif
endfunction

" remove trailing white spaces before saving rb files
function! TrimWhiteSpace()
" Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

" Restore cursor position
  call cursor(l, c)
endfunction

function! PHPUnit(args)
  let expected_config_file = fnamemodify('tests/phpunit.xml', ':p')
  let config_param = ''

  if filereadable(expected_config_file)
    let config_param = ' -c ' . expected_config_file
  endif

  let cmd = "phpunit " . config_param . " " . a:args
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! PHPUnitCurrentFile()
  " if file is test run file
  " else run test file
  let file = expand('%')
  let parts = split(file, 'Test')

  if len(parts) > 1
    :call PHPUnit("%")
  else
    :call PHPUnit(PHPUnitGetTestFileFor(file))
  endif
endfunction

function! PHPUnitGetTestFileFor(file)
  let file = fnamemodify(a:file, ':p')
  let test_file = split(file, ".php")[0] . 'Test.php'
  let test_file = substitute(test_file, "/src/", "/tests/", "")
  let test_file = substitute(test_file, "/lib/", "/tests/", "")
  let test_file = substitute(test_file, "/library/", "/tests/", "")
  let parts = split(test_file, "/tests/")

  let after_test_folder_parts = split(parts[1], "/")

  " prefix or not to prefix test to the folder ?
  let test_sufixed_folder = after_test_folder_parts[0] . 'Test'

  if isdirectory(parts[0] . '/tests/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  if isdirectory(parts[0] . '/test/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  let parts[1] = join(after_test_folder_parts, "/")

  let test_file = join(parts, "/tests/")

  " sometimes the test folder is test instead of tests
  if !isdirectory(parts[0] . "/tests")
    let test_file = join(parts, "/test/")
  endif

  return  test_file
endfunction

function! PHPGetAternativeFile(file)
  let currentFile = a:file

  if !empty(matchstr(currentFile, 'test\(s\)\?\/*.*Test.php$'))
    let file = PHPGetTestedFileFor(currentFile)

    if !filereadable(file)
      return
    end
  else
    let file = PHPUnitGetTestFileFor(currentFile)
  endif

  return file
endfunction

function! PHPOpenVAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "vsplit " . file
  endif
endfunction

function! PHPOpenAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "e " . file
  endif
endfunction

function! PHPUnitCreateTestFile()
  let test_file = PHPUnitGetTestFileFor(expand("%"))
  execute "vsplit " . test_file
endfunction

function! PHPUnitAll()
  :call PHPUnit("")
endfunction

function! PHPUnitFocused()
  :call PHPUnit("--group=focus")
endfunction

function! PHPUnitZendModule()
  let module = ZendGetModuleName()
  let phpunit = 'phpunit'
  let vendorPhpunit = './vendor/bin/phpunit'

  if filereadable(vendorPhpunit)
    let phpunit = vendorPhpunit
  endif

  let cmd = phpunit . " -c module/" . module . "/tests/phpunit.xml"
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! VOpenTestedFile()
  let test_file = PHPGetTestedFileFor(expand("%"))
  execute "vsplit " . test_file
endfunction

function! PHPGetTestedFileFor(test_file)
  let file = a:test_file
  let file = substitute(file, "/tests/", "/src/", "gI")
  let file = substitute(file, "/test/", "/src/", "gI")
  let file = substitute(file, "Test/", "/", "gI")
  let file = substitute(file, "Test.php", ".php", "gI")
  let file = substitute(file, "tests/", "src/", "gI")
  let file = substitute(file, "test/", "src/", "gI")

  if filereadable(file)
    return file
  endif

  let file = substitute(file, "/src/", "/lib/", "gI")

  if filereadable(file)
    return file
  endif


  let file = substitute(file, "/lib/", "/library/", "gI")

  if filereadable(file)
    return file
  endif

  echo "file not found: '" . file . "'"
endfunction


function! ZendGetModuleName()
  return split(split(expand('%'),'module/')[0], '/')[0]
endfunction

function! Prettier()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction

function! PrettifyJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction

function! PhpFixCs(target)
  " let cmd = '~/.dotfiles/composer/vendor/bin/./php-cs-fixer fix'
  " let options = '--level=symfony --fixers=-concat_without_spaces,-return,unused_use,align_double_arrow,phpdoc_indent,-phpdoc_short_description'
  let options = ''
  let cmd = '~/.dotfiles/composer/vendor/bin/./bro-code fix'

  if filereadable('vendor/bin/php-cs-fixer')
    let cmd = './vendor/bin/php-cs-fixer fix'
  endif

  if filereadable('vendor/bin/bro-code')
    let cmd = './vendor/bin/bro-code fix'
  endif

  let full_command = cmd . " " . a:target . " " . options
  call ClearEchoAndExecute(full_command)
endfunction

function! ElixirFixCs(target)
  let cmd = 'mix format '
  call ClearEchoAndExecute(cmd)
endfunction

function! RubocopFixCs(target)
  let options=''
  let cmd = 'bundle exec rubocop'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec rubocop'
  endif

  if filereadable('.rubocop.yml')
    let options = ' --config=.rubocop.yml '
  endif

  let full_command = cmd . " -a " . options . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! ReekCodeSmell(target)
  let cmd = 'bundle exec reek'

  if filereadable('./bin/bundle')
    let cmd = './bin/bundle exec reek'
  endif
  let full_command = cmd . " " . a:target
  call ClearEchoAndExecute(full_command)
endfunction

function! ClearEchoAndExecute(command)
  let cmd = "! clear && echo '" . a:command . "' && " . a:command

  if has('nvim')
    let cmd = "terminal " . a:command
  endif

  execute cmd
endfunction

function! CompileAndRunCurrentCFile()
  let file = expand('%')
  let binary = substitute(file, "\.c$", ".o", "")
  let command = "gcc " . file . " -o " . binary . " && ./" . binary
  call ExecuteCommand(command)
endfunction

function! ExecuteCommand(command)
  execute "! clear && echo '" . a:command . "'" . " && " . a:command
endfunction

function! SetChefTest()
  execute ":nnoremap <buffer> <leader>t :call ExecuteCommand('chef exec rspec %')<cr>"
endfunction

function! RubyGetAternativeFile(file)
  let currentFile = a:file

  if !empty(matchstr(currentFile, '\(test\|spec\)\(s\)\?\/*.*_\(test\|spec\).rb$'))
    let file = RubyGetTestedFileFor(currentFile)

    if !filereadable(file)
      return
    end
  else
    let file = RubyUnitGetTestFileFor(currentFile)
  endif

  return file
endfunction

function! RubyOpenVAlternativeFile()
  let file = RubyGetAternativeFile(expand("%"))
  if !empty(file)
    execute "vsplit " . file
  endif
endfunction

function! RubyUnitGetTestFileFor(file)
  let file = fnamemodify(a:file, ':p')
  let test_file = split(file, ".rb")[0] . '_test.rb'
  let test_file = substitute(test_file, "/src/", "/tests/", "")
  let test_file = substitute(test_file, "/lib/", "/tests/", "")
  let test_file = substitute(test_file, "/library/", "/tests/", "")
  let parts = split(test_file, "/tests/")

  let after_test_folder_parts = split(parts[1], "/")

  " prefix or not to prefix test to the folder ?
  let test_sufixed_folder = after_test_folder_parts[0] . 'Test'

  if isdirectory(parts[0] . '/tests/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  if isdirectory(parts[0] . '/test/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  let parts[1] = join(after_test_folder_parts, "/")

  let test_file = join(parts, "/tests/")

  " sometimes the test folder is test instead of tests
  if !isdirectory(parts[0] . "/tests")
    let test_file = join(parts, "/test/")
  endif

  echo  test_file
  " return  test_file
endfunction

function! RubyGetTestedFileFor(test_file)
  let file = a:test_file
  let file = substitute(file, "/tests/", "/lib/", "gI")
  let file = substitute(file, "/test/", "/lib/", "gI")
  let file = substitute(file, "_spec.rb", ".rb", "gI")
  let file = substitute(file, "_test.rb", ".rb", "gI")

  if filereadable(file)
    return file
  endif

  let file = substitute(file, "/lib/", "/src/", "gI")

  if filereadable(file)
    return file
  endif

  echo "file not found: '" . file . "'"
endfunction

function! FixColors()
  highlight ColorColumn ctermbg=235
  highlight vertsplit guifg=white guibg=black ctermbg=none
  highligh MatchParen cterm=bold ctermbg=none ctermfg=green
  highligh! def link phpDocTags  phpDefine
  highligh! def link phpDocParam phpType
endfunction

function! OpenAlternateFile()
  " Need to update dotfiled
  let file = system('dotfiled ' . expand('%'))
  " let file = system('alternative_file ' . expand('%'))
  if !empty(file)
    execute "e " . file
  endif
endfunction

"===============================================================================
" Mappings
"===============================================================================

" rm file
nnoremap <leader>rm :Delete<cr>

" escape alias
inoremap jj <esc>:w<cr>
inoremap jJ <esc>:w<cr>
inoremap Jj <esc>:w<cr>
inoremap JJ <esc>:w<cr>
inoremap jk <esc>

" use esc jj to escape terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" This mappings embraces my muscle memory while on ergodox
nnoremap <backspace> =
vnoremap <backspace> =

" buffer changing
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" find buffer file
nnoremap <leader><leader>b :b<space>

" closes buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bdd :bd!<cr>
nnoremap <leader>bda :bufdo %bd!<cr>
nnoremap <leader>n :NERDTree<cr>

" search
" nnoremap * :keepjumps normal *``<cr>

" Highlight but do not jump
" http://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" nnoremap * *``
nnoremap * *N

" * and # search for next/previous of selected text when used in visual mode
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" * and # search for next/previous of selected text when used in visual mode
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" saves from normal mode
nnoremap <leader>s :w<cr>
nnoremap <leader>S :w<cr>

" saves and exits insert mode
inoremap ,s <ESC>:w<cr>
inoremap ,S <ESC>:w<cr>

" Select all
nnoremap <leader>a ggVG

" new tab
nnoremap <c-w>t :tabnew<cr>

" jumps to the next position after the closest closing char
inoremap ,e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a

" adds arrow
inoremap <C-l> <Space>=><Space>

" Ruby old style hashes to new style hashes
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" Rails specific
" nnoremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
nnoremap <Leader>qq <ESC>:q<cr>

" reload buffer
nnoremap <Leader>rel :e<CR>

" Open vim rc
nnoremap <Leader>vi :vsplit ~/.config/nvim/config.vim<CR>
nnoremap <Leader>lvi :vsplit ~/.config/nvim/init.lua<CR>

" vundle
nnoremap <Leader>bi :BundleInstall<cr>
nnoremap <Leader>bu :BundleUpdate<cr>
nnoremap <Leader>bc :BundleClean<cr>

" Fix anoying original K
nnoremap K <nop>
nnoremap U <nop>

" Find
nnoremap <leader>f <ESC>/
nnoremap <leader>* <ESC>:find<space>

" convert file to latin1 and reloads
nnoremap <leader>lat1 :write ++enc=latin1<cr>:e<cr>

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" clear search
nnoremap <silent> <leader>F :nohlsearch<CR>

" Avoid arrow keys in command mode
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <C-x> <del>

" Control Ctrl and Ctrl V
vnoremap <C-c> "+y
vnoremap <leader>c "+y
nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>i

" buffer resizing mappings (shift + arrow key)
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Trim all trailing whitespaces no questions asked.
nnoremap <leader>wt :call TrimWhiteSpace()<cr>

" quotes
" Single quote word
nnoremap <leader>sq ciw''<esc><left>p
" double quote word
nnoremap <leader>dq ciw""<esc><left>p

" Execute last command over a visual selection
vnoremap . :norm.<CR>

" Resolving conflics
" Vimcasts #33
nnoremap <leader>gd :Gdiff<cr>
" get target version: diff get target
nnoremap <leader>dgt :diffget //2 \| :diffupdate<cr>
" get branch version: diff get branch
nnoremap <leader>dgb :diffget //3 \| :diffupdate<cr>

" quotes
nnoremap <leader>qw ciw''<esc>P
nnoremap <leader>qw ciw""<esc>P

" sort block
nnoremap <leader>sb vip:sort<cr>
nnoremap <leader>sa vi(:sort<cr>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" offers to create/edit a tmp file
nnoremap <leader>on :e tmp/notes.txt<cr>
nnoremap <leader>et :e ~/.tmp/
nnoremap <leader>cet :e tmp/
nnoremap <leader><leader>e :!<space>

inoremap ć ç
inoremap Ć Ç
inoremap ,a â
inoremap ,A Â

nnoremap <leader>st <esc>:terminal ./shell_test<cr>
nnoremap <leader><leader>xx <esc>:! chmod +x %<cr>
nnoremap <c-l> gt
nnoremap <c-k> gt
nnoremap <c-h> gT
nnoremap <c-j> gT

"===============================================================================
" Language specific
"===============================================================================

"===============================================================================
" Lua
"===============================================================================
autocmd FileType lua nnoremap <buffer> <leader>x <esc>:terminal time lua %<cr>

"===============================================================================
" PHP
"===============================================================================
autocmd FileType php nnoremap <buffer> <leader>x <esc>:terminal time php %<cr>
autocmd FileType php nnoremap <buffer> <leader>av <esc>:call PHPOpenAlternativeFile()<cr>
autocmd FileType php nnoremap <leader>cs  :call PhpFixCs('%')<cr>
autocmd FileType php nnoremap <leader>dcs :call PhpFixCs('.')<cr>
autocmd FileType php inoremap <buffer> <C-.> .
autocmd FileType php inoremap <buffer> ... ../
autocmd FileType php inoremap <buffer> .. ->
let s:keys = [
  \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  \ 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_'
  \ ]
for key in s:keys
  exe 'autocmd Filetype php inoremap <buffer> .' . key . ' ->' . key
endfor
autocmd FileType php inoremap <buffer> ;; <esc>$a;

"===============================================================================
" Phython
"===============================================================================
autocmd FileType python nnoremap <buffer> <leader>x <esc>:terminal time python %<cr>

"===============================================================================
" Ruby
"===============================================================================
autocmd FileType ruby nnoremap <buffer> <leader>x <esc>:terminal time ruby %<cr>
autocmd FileType ruby nnoremap <buffer> <leader>cs  :call RubocopFixCs('%')<cr>
autocmd FileType ruby nnoremap <buffer> <leader>dcs :call RubocopFixCs('.')<cr>
autocmd FileType ruby nnoremap <buffer> <leader>ccs :call ReekCodeSmell('%')<cr>
autocmd FileType ruby nnoremap <buffer> <leader>av :call OpenAlternateFile()<cr>

"===============================================================================
" Elixir
"===============================================================================
autocmd FileType elixir nnoremap <buffer> <leader>x <esc>:terminal time elixir %<cr>
autocmd FileType elixir nnoremap <buffer> <leader>cs :call ElixirFixCs('%')<cr>

"===============================================================================
" Javascript
"===============================================================================
autocmd FileType javascript nnoremap <buffer> <leader>x <esc>:terminal time node %<cr>
autocmd FileType javascript nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType javascript nnoremap <buffer> <leader>js :call PrettifyJson()<cr>
autocmd FileType json nnoremap <buffer> <leader>cs :call PrettifyJson()<cr>

"===============================================================================
" css
"===============================================================================
autocmd FileType css nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType sass nnoremap <buffer> <leader>cs :call Prettier()<cr>
autocmd FileType scss nnoremap <buffer> <leader>cs :call Prettier()<cr>

"===============================================================================
" html
"===============================================================================
autocmd FileType html nnoremap <buffer> <leader>cs :call Prettier()<cr>

"===============================================================================
" C
"===============================================================================
autocmd FileType c nnoremap <buffer> <leader>x <esc>:call CompileAndRunCurrentCFile()<cr>

"===============================================================================
" BASH
"===============================================================================
autocmd FileType sh nnoremap <buffer> <leader>x <esc>:terminal ./%<cr>
autocmd FileType zsh nnoremap <buffer> <leader>x <esc>:terminal ./%<cr>

"===============================================================================
" Allow overriding these settings:
"===============================================================================
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(".project.vim")
  source .project.vim
endif

if filereadable(".project.lua")
  luafile .project.lua
endif

if filereadable(".editor/project.vim")
  source .editor/project.vim
endif

