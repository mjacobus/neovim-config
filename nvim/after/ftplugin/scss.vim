nnoremap <leader>cs :call RunLinters()<cr>

function! RunLinters()
  call ClearEchoAndExecute('prettify_json %')
endfunction
