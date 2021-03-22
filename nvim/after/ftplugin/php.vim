setlocal ts=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal cindent
setlocal smartindent
setlocal autoindent
setlocal foldenable
setlocal foldmethod=syntax

nnoremap  <leader>x <esc>:terminal time php %<cr>
nnoremap  <leader>av <esc>:call PHPOpenAlternativeFile()<cr>
nnoremap <leader>cs  :call PhpFixCs('%')<cr>
nnoremap <leader>dcs :call PhpFixCs('.')<cr>
inoremap  <C-.> .
inoremap  ... ../
inoremap  .. ->
let s:keys = [
  \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  \ 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_'
  \ ]
for key in s:keys
  exe 'inoremap .' . key . ' ->' . key
endfor
inoremap ;; <esc>$a;

function! PHPUnit(args)
  let expected_config_file = fnamemodify('tests/phpunit.xml', ':p')
  let config_param = ''

  if filereadable(expected_config_file)
    let config_param = ' -c ' . expected_config_file
  endif

  let cmd = "phpunit " . config_param . " " . a:args
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! PHPUnitCurrentFile()
  " if file is test run file
  " else run test file
  let file = expand('%')
  let parts = split(file, 'Test')

  if len(parts) > 1
    :call PHPUnit("%")
  else
    :call PHPUnit(PHPUnitGetTestFileFor(file))
  endif
endfunction

function! PHPUnitGetTestFileFor(file)
  let file = fnamemodify(a:file, ':p')
  let test_file = split(file, ".php")[0] . 'Test.php'
  let test_file = substitute(test_file, "/src/", "/tests/", "")
  let test_file = substitute(test_file, "/lib/", "/tests/", "")
  let test_file = substitute(test_file, "/library/", "/tests/", "")
  let parts = split(test_file, "/tests/")

  let after_test_folder_parts = split(parts[1], "/")

  " prefix or not to prefix test to the folder ?
  let test_sufixed_folder = after_test_folder_parts[0] . 'Test'

  if isdirectory(parts[0] . '/tests/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  if isdirectory(parts[0] . '/test/' . test_sufixed_folder)
    let after_test_folder_parts[0] = test_sufixed_folder
  endif

  let parts[1] = join(after_test_folder_parts, "/")

  let test_file = join(parts, "/tests/")

  " sometimes the test folder is test instead of tests
  if !isdirectory(parts[0] . "/tests")
    let test_file = join(parts, "/test/")
  endif

  return  test_file
endfunction

function! PHPGetAternativeFile(file)
  let currentFile = a:file

  if !empty(matchstr(currentFile, 'test\(s\)\?\/*.*Test.php$'))
    let file = PHPGetTestedFileFor(currentFile)

    if !filereadable(file)
      return
    end
  else
    let file = PHPUnitGetTestFileFor(currentFile)
  endif

  return file
endfunction

function! PHPOpenVAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "vsplit " . file
  endif
endfunction

function! PHPOpenAlternativeFile()
  let file = PHPGetAternativeFile(expand("%"))
  if !empty(file)
    execute "e " . file
  endif
endfunction

function! PHPUnitCreateTestFile()
  let test_file = PHPUnitGetTestFileFor(expand("%"))
  execute "vsplit " . test_file
endfunction

function! PHPUnitAll()
  :call PHPUnit("")
endfunction

function! PHPUnitFocused()
  :call PHPUnit("--group=focus")
endfunction

function! PHPUnitZendModule()
  let module = ZendGetModuleName()
  let phpunit = 'phpunit'
  let vendorPhpunit = './vendor/bin/phpunit'

  if filereadable(vendorPhpunit)
    let phpunit = vendorPhpunit
  endif

  let cmd = phpunit . " -c module/" . module . "/tests/phpunit.xml"
  execute "! clear && echo '" . cmd . "' && " . cmd
endfunction

function! VOpenTestedFile()
  let test_file = PHPGetTestedFileFor(expand("%"))
  execute "vsplit " . test_file
endfunction

function! PHPGetTestedFileFor(test_file)
  let file = a:test_file
  let file = substitute(file, "/tests/", "/src/", "gI")
  let file = substitute(file, "/test/", "/src/", "gI")
  let file = substitute(file, "Test/", "/", "gI")
  let file = substitute(file, "Test.php", ".php", "gI")
  let file = substitute(file, "tests/", "src/", "gI")
  let file = substitute(file, "test/", "src/", "gI")

  if filereadable(file)
    return file
  endif

  let file = substitute(file, "/src/", "/lib/", "gI")

  if filereadable(file)
    return file
  endif


  let file = substitute(file, "/lib/", "/library/", "gI")

  if filereadable(file)
    return file
  endif

  echo "file not found: '" . file . "'"
endfunction

function! ZendGetModuleName()
  return split(split(expand('%'),'module/')[0], '/')[0]
endfunction

function! PhpFixCs(target)
  " let cmd = '~/.dotfiles/composer/vendor/bin/./php-cs-fixer fix'
  " let options = '--level=symfony --fixers=-concat_without_spaces,-return,unused_use,align_double_arrow,phpdoc_indent,-phpdoc_short_description'
  let options = ''
  let cmd = '~/.dotfiles/composer/vendor/bin/./bro-code fix'

  if filereadable('vendor/bin/php-cs-fixer')
    let cmd = './vendor/bin/php-cs-fixer fix'
  endif

  if filereadable('vendor/bin/bro-code')
    let cmd = './vendor/bin/bro-code fix'
  endif

  let full_command = cmd . " " . a:target . " " . options
  call ClearEchoAndExecute(full_command)
endfunction
