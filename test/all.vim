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

function s:suite.ftdetect_keeps_filetype_set_earlier()
  enew!
  setfiletype conf
  doautocmd BufRead foo.eo
  call s:assert.equals(&filetype, 'conf')
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

function! s:syntax_group(text, column) abort
  return synIDattr(s:syntax_at(a:text, a:column), 'name')
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
