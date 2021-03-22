nnoremap <leader>x <esc>:terminal time elixir %<cr>
nnoremap <leader>cs :call LintElixir('%')<cr>

function! LintElixir(target)
  let cmd = 'mix format '
  call ClearEchoAndExecute(cmd)
endfunction
