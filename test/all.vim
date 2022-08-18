let s:suite = themis#suite('Test for my plugin')
let s:assert = themis#helper('assert')

" The function name(my_test_1) will be a test name.
function s:suite.my_test_1()
  call s:assert.equals(3, 1 + 2)
endfunction

function s:suite.my_test_2()
  call s:assert.equals(8, 2 * 4)
endfunction

function s:suite.my_fail_test()
	  call s:assert.fail('this will fail')
	endfunction
