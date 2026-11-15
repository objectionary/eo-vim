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

function! s:syntax_group(text, column) abort
  enew!
  try
    call setline(1, a:text)
    call s:source('./syntax/eo.vim')
    return synIDattr(synID(1, a:column, 1), 'name')
  finally
    bwipeout!
  endtry
endfunction

function s:suite.lowercase_booleans()
  for value in ['true', 'false']
    for column in range(3, 2 + strlen(value))
      call s:assert.equals(s:syntax_group('  ' . value, column), 'eoBoolean')
    endfor
  endfor
  call s:assert.equals(synIDtrans(hlID('eoBoolean')), synIDtrans(hlID('Boolean')))
endfunction

function s:suite.boolean_names_are_case_sensitive()
  for name in ['TRUE', 'FALSE', 'True', 'False', 'trueValue', 'falsehood', 'untrue', 'is_false']
    call s:assert.equals(s:syntax_group(name, 1), 'eoDefaultName')
  endfor
endfunction

function s:suite.booleans_in_strings_and_comments()
  for column in [2, 7]
    call s:assert.equals(s:syntax_group('"true false"', column), 'eoString')
  endfor
  for column in [3, 8]
    call s:assert.equals(s:syntax_group('# true false', column), 'eoComment')
  endfor
endfunction
