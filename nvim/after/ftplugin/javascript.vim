nnoremap <leader>x <esc>:terminal time node %<cr>
nnoremap <leader>cs :call RunLinters()<cr>
nnoremap <leader>js :call RunJsonLinters()<cr>
nnoremap <leader>cs :call RunLinters()<cr>

function! RunLinters()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction

function! RunJsonLinters()
  call ClearEchoAndExecute('prettify_json %')
endfunction

