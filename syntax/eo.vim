" Vim plugin file
" Language:    Eolang 
" Maintainer:  
" Last Change: 19/08/2022
" Version:     0.0.0
" URL:         

" Checking for rewriting
    if exists("b:current_syntax")
        finish
    endif
    
    " Match language specific keywords
    syntax keyword eoKeyMetas contained alias package rt version home junit unit architect
    syntax keyword eoBoolean TRUE FALSE 
    
    " Match String
    syntax region eoString start=/\v"/ skip=/\v\\./ end=/\v"/ fold contains=@Spell
    
    " Match Metas
    syntax match eoMetas "\v\+.*$" contains=eoKeyMetas
    
    " Match Comment
    syntax keyword todoComment contained TODO FIXME NOTE
    syntax match   eoComment "\v#.*$" contains=todoComment
    
    " Match dot-notation attributes
    syntax match eoDotName "\v\.[a-zA-Z_][a-zA-Z0-9_||\-]*" contains=eoOperator 
    syntax match eoDotName "\v.*\.\s|\v.*\.\n" contains=eoMetas,eoString,eoComment
    
    " Name of objects
    syntax match eoDefaultName  "[a-zA-Z_][a-zA-Z0-9_||\-]*" contains=eoDotName 
    syntax match eoAbstractName "\v\[.*$" contains=eoOperator
    
    " Special attributes
    syntax match eoKeyword "\v\&"
    syntax match eoKeyword "\v\@"
    syntax match eoKeyword "\v\$"
    syntax match eoKeyword "\v\^"
    
    " Operators
    syntax match eoOperator "\v\*"
    syntax match eoOperator "\v/"
    syntax match eoOperator "\v\?"
    syntax match eoOperator "\v\>"
    syntax match eoOperator "\v\<"
    syntax match eoOperator "\v\:"
    syntax match eoOperator "\v\="
    syntax match eoOperator "\v\*\="
    syntax match eoOperator "\v/\="
    syntax match eoOperator "\v\+\="
    syntax match eoOperator "\v-\="
    
    " TODO: other types //optional
    syntax match eoInteger "[1-9][0-9]*" 
    syntax match eoFloat   "\v<\d+\.\d+>" 
    syntax match eoBinary  "\v[0-9A-F][0-9A-F]\-[\-0-9A-F]*"
     
    
    
    
    
    " +|+|+|+|+|+|+|+ Set highlight +|+|+|+|+|+|+|+ "
    
    highlight Keyword ctermfg=LightGreen guifg=LightGreen gui=bold cterm=bold
    hi def link eoKeyword Keyword
    
    highlight String ctermfg=Magenta guifg=Magenta
    hi def link eoString  String
    hi def link eoComment Comment
    
    highlight DotName ctermfg=LightBlue guifg=LightBlue
    hi def link eoDotName DotName
    
    highlight AbstractName ctermfg=Green guifg=Green guifg=LightYellow gui=bold cterm=bold
    highlight ObjectName ctermfg=LightYellow guifg=LightYellow 
    hi def link eoDefaultName  ObjectName
    hi def link eoAbstractName AbstractName 
    
    highlight Define ctermfg=LightRed guifg=LightRed
    hi def link eoKeyMetas Define
    hi def link eoMetas Statement
    
    " highlight default
    hi def link eoOperator  NONE
    hi def link eoBoolean   Boolean
    hi def link todoComment Todo 

    highlight Number ctermfg=LightGreen guifg=LightGreen
    hi def link eoBinary  Boolean
    hi def link eoInteger Number
    hi def link eoFloat   Number 
    
    " +|+|+|+|+|+|+|+ End highlight +|+|+|+|+|+|+|+ "
let b:current_syntax="eo"
