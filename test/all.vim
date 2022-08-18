let s:suite = themis#suite('Test for my plugin')
let s:assert = themis#helper('assert')

" Checking correct running of syntax highlighting script
function s:source()
  execute ':source ./syntax/eo.vim'
endfunction

" These are trial tests for checking CI working
" They will be expand in the future contributes
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
