nnoremap <leader>x <esc>:terminal time elixir %<cr>
nnoremap <leader>cs :call ElixirFixCs('%')<cr>

function! ElixirFixCs(target)
  let cmd = 'mix format '
  call ClearEchoAndExecute(cmd)
endfunction
