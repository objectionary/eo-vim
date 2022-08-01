" Vim plugin file
" Language:    Eolang 
" Maintainer:  
" Last Change: 01/08/2022
" Version:     0.0.0
" URL:         

" Checking for rewriting
if exists("b:current_syntax")
    finish
endif

" Match language specific keywords
syntax keyword eoKeyMetas contained alias package

" Match String
syntax region eoString start=/\v"/ skip=/\v\\./ end=/\v"/ fold contains=@Spell

" Match metas
syntax match eoMetas "\v\+.*$" contains=eoKeyMetas

" Match Comment
syntax keyword todoComment contained TODO FIXME NOTE
syntax match   eoComment "\v#.*$" contains=todoComment

" Match dot-notation
syntax match   eoDotName "\v\..*\s|\v\..*\n" contains=eoImpl

" Name of objects
syntax match  eoName      "[a-zA-Z_][a-zA-Z0-9_]*" contains=eoDotName "\v[a-zA-Z_$][a-zA-Z_$0-9]* contains=eoDotName 
"syntax region eoArguments start=/\v\[/ end=/\v\]/
syntax match eoArguments "\v\[.*$"

" TODO: highlight names of abstract objects ^[_$a-z][\\w$]*$  
"syntax match  eoAbstractName "\>\s.*$" transparent contains=eoOperator
"syntax region eoAbstractName start=/\v\>/ end=/^[_$a-z][\\w$]*$/ contains=eoName

"syntax match eoKeyword "\v\["
"syntax match eoKeyword "\v\]"
"syntax match eoOperator "\v\+"

" Special attributes
syntax match eoKeyword "\v\&"
syntax match eoKeyword "\v\@"
syntax match eoKeyword "\v\$"
syntax match eoKeyword "\v\^"

" Operators
syntax match eoOperator "\v\*"
syntax match eoOperator "\v/"
syntax match eoOperator "\v-"
syntax match eoOperator "\v\?"
syntax match eoImpl     "\v\>"
syntax match eoOperator "\v\<"
syntax match eoOperator "\v\:"

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



" +|+|+|+|+|+|+|+ Set highlight +|+|+|+|+|+|+|+ "

highlight Error ctermfg=DarkRed guifg=DarkRed
hi def link eoAbstractName Error

hi def link eoKeyword Keyword
hi def link eoString  String
hi def link eoComment Comment
highlight Function ctermfg=LightBlue guifg=LightBlue
hi def link eoDotName Function

highlight Operator ctermfg=DarkGreen guifg=DarkGreen
hi def link eoOperator Operator

highlight Number ctermfg=Green guifg=Green
hi def link eoInteger Number
hi def link eoFloat   Number
hi def link eoNumber  Number

highlight Arguments ctermfg=LightYellow guifg=LightYellow
hi def link eoName      Arguments
hi def link eoArguments Number

highlight Define ctermfg=LightRed guifg=LightRed
hi def link eoKeyMetas Define
hi def link eoMetas Number

highlight Repeat ctermfg=LightMagenta guifg=LightMagenta
hi def link eoImpl Repeat

hi def link todoComment Todo 

" +|+|+|+|+|+|+|+ End highlight +|+|+|+|+|+|+|+ "
let b:current_syntax="eo"