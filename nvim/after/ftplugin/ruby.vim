" Ruby old style hashes to new style hashes
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>
nnoremap <leader>x <esc>:terminal time ruby %<cr>
nnoremap <leader>cs  :call RubocopFixCs('%')<cr>
nnoremap <leader>dcs :call RubocopFixCs('.')<cr>
nnoremap <leader>ccs :call ReekCodeSmell('%')<cr>
nnoremap <leader>av :call OpenAlternateFile()<cr>

function! OpenAlternateFile()
  " Need to update dotfiled
  let file = system('dotfiled ' . expand('%'))
  " let file = system('alternative_file ' . expand('%'))
  if !empty(file)
    execute "e " . file
  endif
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
