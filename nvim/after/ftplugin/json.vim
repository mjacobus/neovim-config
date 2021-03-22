nnoremap <leader>cs :call LintJson()<cr>

function! LintJson()
  call ClearEchoAndExecute('prettify_json %')
endfunction
