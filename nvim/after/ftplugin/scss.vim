nnoremap <leader>cs :call LintScss()<cr>

function! LintScss()
  call ClearEchoAndExecute('prettify_json %')
endfunction
