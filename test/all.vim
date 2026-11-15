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

function! s:syntax_at(text, column) abort
  new
  try
    call setline(1, a:text)
    call s:source('./syntax/eo.vim')
    return synID(1, a:column, 1)
  finally
    bwipeout!
  endtry
endfunction

function! s:suite.zero_is_a_number() abort
  let id = s:syntax_at('0 > zero', 1)
  call s:assert.equals(synIDattr(id, 'name'), 'eoInteger')
  call s:assert.equals(synIDattr(synIDtrans(id), 'name'), 'Number')
endfunction

function! s:suite.integer_literals() abort
  for literal in ['0', '1', '10', '100', '-0', '-10']
    let first = literal[0] ==# '-' ? 2 : 1
    for column in range(first, strlen(literal))
      let id = s:syntax_at(literal, column)
      call s:assert.equals(synIDattr(id, 'name'), 'eoInteger', literal)
    endfor
  endfor
endfunction

function! s:suite.zero_in_other_syntax_groups() abort
  for [text, column, group] in [
        \ ['item0', 5, 'eoDefaultName'],
        \ ['0.5', 1, 'eoFloat'],
        \ ['"0"', 2, 'eoString'],
        \ ['# 0', 3, 'eoComment']]
    let id = s:syntax_at(text, column)
    call s:assert.equals(synIDattr(id, 'name'), group, text)
  endfor
endfunction
