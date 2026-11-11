let s:suite = themis#suite('Test for my plugin')
let s:assert = themis#helper('assert')

" Checking correct running of syntax highlighting script
function! s:source(path) abort
  try
    execute ':source' fnameescape(a:path)
  catch /^Vim\%((\a\+)\)\=:E121:/
    " NOTE: workaround for `E121: Undefined variable: path`
    execute ':source' fnameescape(a:path)
  endtry
endfunction

call s:source('./syntax/eo.vim')
call s:source('./ftdetect/eo.vim')
" These are trial tests for checking CI working
" They will be expanded in the future contributions
" You are welcome to add them
function s:suite.my_test_1()
  call s:assert.equals(3, 1 + 2)
endfunction

function s:suite.my_test_2()
  call s:assert.equals(8, 2 * 4)
endfunction

function s:suite.my_test_3()
  call s:assert.equals(4, 10 - 6)
endfunction

function s:suite.syntax_keeps_keyword_group_of_colorscheme()
  highlight Keyword ctermfg=Red
  let before = synIDattr(synIDtrans(hlID('Keyword')), 'fg', 'cterm')
  unlet! b:current_syntax
  call s:source('./syntax/eo.vim')
  call s:assert.equals(synIDattr(synIDtrans(hlID('Keyword')), 'fg', 'cterm'), before)
endfunction

function s:suite.syntax_keeps_string_group_of_colorscheme()
  highlight String ctermfg=Cyan
  let before = synIDattr(synIDtrans(hlID('String')), 'fg', 'cterm')
  unlet! b:current_syntax
  call s:source('./syntax/eo.vim')
  call s:assert.equals(synIDattr(synIDtrans(hlID('String')), 'fg', 'cterm'), before)
endfunction

function s:suite.syntax_keeps_number_group_of_colorscheme()
  highlight Number ctermfg=Yellow
  let before = synIDattr(synIDtrans(hlID('Number')), 'fg', 'cterm')
  unlet! b:current_syntax
  call s:source('./syntax/eo.vim')
  call s:assert.equals(synIDattr(synIDtrans(hlID('Number')), 'fg', 'cterm'), before)
endfunction
