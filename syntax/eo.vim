" Match language specific keywords
syntax keyword eoKeyword EOlang 

" Match String
syntax region eoString start=/\v"/ skip=/\v\\./ end=/\v"/

" Match Comment
syntax match eoComment "\v#.*$"

" Name of variable 
syntax match eoName "^[_$a-z][\\w$]*$"

" Operators
syntax match eoKeyword "\v\&"
syntax match eoKeyword "\v\["
syntax match eoKeyword "\v\]"
syntax match eoKeyword "\v\@"
syntax match eoKeyword "\v\$"
syntax match eoKeyword "\v\^"

syntax match eoOperator "\v\*"
syntax match eoOperator "\v/"
syntax match eoOperator "\v\+"
syntax match eoOperator "\v-"
syntax match eoOperator "\v\?"
syntax match eoOperator "\v\>"
syntax match eoOperator "\v\<"

syntax match eoOperator "\v\="

syntax match eoOperator "\v\*\="
syntax match eoOperator "\v/\="
syntax match eoOperator "\v\+\="
syntax match eoOperator "\v-\="

" Numbers
syntax match eoInteger "\v<\d+>" "\v[+-]?\d+|0x[a-f\d]+
syntax match eoFloat   "\v<\d+\.\d+>" "\v/[+-]?\d+(\.\d+)?/e(+|-)?\d+/

"syntax match eoExp "\v<\d*\.?\d+([Ee]-?)?\d+>"
"syntax match eoNumber "\v<0x\x+([Pp]-?)?\x+>"
"syntax match eoNumber "\v<0b[01]+>"
"syntax match eoNumber "\v<0o\o+>"

" Set highlight 
hi def link eoKeyword Keyword
hi def link eoString  String
hi def link eoComment Comment

highlight Operator ctermfg=Red guifg=Red
hi def link eoOperator Operator

highlight Number ctermfg=Green guifg=Green
hi def link eoInteger Number
hi def link eoFloat   Number
hi def link eoNumber  Number

hi def link eoName NONE