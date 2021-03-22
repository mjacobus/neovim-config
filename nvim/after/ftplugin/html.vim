nnoremap <leader>cs :call LintHtml()<cr>

function! LintHtml()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction
