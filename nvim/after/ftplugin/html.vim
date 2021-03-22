nnoremap <leader>cs :call RunLinters()<cr>

function! RunLinters()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction
