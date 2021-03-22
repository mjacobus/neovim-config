nnoremap <leader>x <esc>:terminal time node %<cr>
nnoremap <leader>cs :call LintJavascript()<cr>
nnoremap <leader>js :call LintJson()<cr>

function! LintJavascript()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction

function! LintJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction
