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
execute 'set runtimepath+=' . fnameescape(getcwd())
function! s:group(line, needle) abort
  enew!
  syntax enable
  set filetype=eo
  call setline(1, a:line)
  syntax sync fromstart
  return synIDattr(synID(1, stridx(a:line, a:needle) + 1, 1), 'name')
endfunction

function s:suite.colors_auto_name_marker()
  call s:assert.equals(s:group('42 >> x!', '>>'), 'eoAutoName')
endfunction

function s:suite.colors_test_marker()
  call s:assert.equals(s:group('true +> stops', '+>'), 'eoTest')
endfunction

function s:suite.colors_long_test_marker()
  call s:assert.equals(s:group('1.div 0 ++> stops', '++>'), 'eoTest')
endfunction

function s:suite.colors_long_test_marker_middle()
  call s:assert.equals(s:group('1.div 0 --> stops', '-'), 'eoTest')
endfunction

function s:suite.colors_binding_arrow_as_operator()
  call s:assert.equals(s:group('42 > x', '>'), 'eoOperator')
endfunction

function s:suite.keeps_marker_inside_string_plain()
  call s:assert.equals(s:group('"a +> b" > x', '+>'), 'eoString')
endfunction

function s:suite.keeps_marker_inside_comment_plain()
  call s:assert.equals(s:group('# a ++> b', '++>'), 'eoComment')
endfunction

function s:suite.keeps_marker_after_text_out_of_metas()
  call s:assert.not_equals(s:group('1.div 0 +> stops', '+>'), 'eoMetas')
endfunction

function s:suite.colors_line_leading_meta()
  call s:assert.equals(s:group('+alias org.eolang', 'org'), 'eoMetas')
endfunction

function s:suite.colors_meta_keyword()
  call s:assert.equals(s:group('+alias org.eolang', 'alias'), 'eoKeyMetas')
endfunction

function s:suite.colors_integer()
  call s:assert.equals(s:group('42', '4'), 'eoInteger')
endfunction

function s:suite.colors_string()
  call s:assert.equals(s:group('"hi"', 'h'), 'eoString')
endfunction
