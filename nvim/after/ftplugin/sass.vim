nnoremap <leader>cs :call LintSass()<cr>

function! LintSass()
  call ClearEchoAndExecute('./node_modules/.bin/prettier --write %')
endfunction

