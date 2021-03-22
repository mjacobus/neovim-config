nnoremap <leader>cs :call LintCss()<cr>

function! LintCss()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction
