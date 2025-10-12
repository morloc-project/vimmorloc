" Vim syntax file
" Language: morloc
" Maintainer: Zebulun Arendsee
" -----------------------------------------------------------------------------



" =============================================================================
"                             P R E A M B L E
" -----------------------------------------------------------------------------
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "loc"



" =============================================================================
"                             K E Y W O R D S
" -----------------------------------------------------------------------------


syn keyword reserved where
syn keyword reserved module
syn keyword reserved from
syn keyword reserved as
syn keyword reserved source
syn keyword reserved export
syn keyword reserved True
syn keyword reserved False

" -----------------------------------------------------------------------------
hi def link reserved Keyword


" =============================================================================
"                               S T R I N G S
" -----------------------------------------------------------------------------


" Interpolation regions inside strings
syn match s_escape_special contained /\\[nrtbfv0'"#\\]/ 
syn match s_escape_unicode contained /\\u[0-9a-fA-F]\{4}/
syn match s_escape_unicode contained /\\U[0-9a-fA-F]\{8}/
syn match s_escape_hex contained /\\x[0-9a-fA-F]\{1,2}/

" #{expression} is interpolation - contains everything except the string delimiters
syn region s_interpolation contained matchgroup=s_interp_delim start=/#{/ skip=/\\#{/ end=/}/ 
      \ contains=TOP

" Main string region - double-quoted strings
syn region s_string start=/"/ skip=/\\./ end=/"/ 
      \ contains=s_escape_special,s_escape_unicode,s_escape_hex,s_interpolation,s_interp_literal

" Main string region - multiline strings double quotes
syn region s_string start=/"""/ skip=/\\./ end=/"""/ 
      \ contains=s_escape_special,s_escape_unicode,s_escape_hex,s_interpolation,s_interp_literal

" Main string region - multiline strings single quotes
syn region s_string start=/'''/ skip=/\\./ end=/'''/ 
      \ contains=s_escape_special,s_escape_unicode,s_escape_hex,s_interpolation,s_interp_literal

" Highlighting groups
hi def link s_string String
hi def link s_raw_string String
hi def link s_escape_special SpecialChar
hi def link s_escape_unicode SpecialChar
hi def link s_escape_hex SpecialChar
hi def link s_interp_literal Error
hi def link s_interp_delim Delimiter
hi def link s_interpolation Identifier

" =============================================================================
"                           P R I M A T I V E S
" -----------------------------------------------------------------------------

syn match s_num '\([a-zA-Z_]\)\@<!\<[0-9]\+\>\([a-zA-Z_]\)\@!'
syn match s_dbl '\([a-zA-Z_]\)\@<!\<[0-9]\+\.[0-9]\+\>\([a-zA-Z_]\)\@!'

" syn match s_num '\v(\h)@<!-?(\d*\.\d+|\d+)(\h)\@!'
"                  -------                -------
"                  negative look behind   negative look ahead
" -----------------------------------------------------------------------------
hi def link s_num      Number
hi def link s_dbl      Number
hi def link s_string   String
hi def link s_execute  String

" =============================================================================
"                            O P E R A T O R S
" -----------------------------------------------------------------------------
syn match operator /=/
syn match operator /::/
syn match operator /:/
syn match operator /,/
syn match operator /(/
syn match operator /)/
syn match operator /\[/
syn match operator /\]/
syn match operator /{/
syn match operator /}/
syn match operator /->/
syn match operator /=>/

" operators allowed in constraints
syn match operator />/
syn match operator /</
syn match operator />=/
syn match operator /<=/
syn match operator /+/
syn match operator / - /
syn match operator /\//
syn match operator /\/\// " integer division
syn match operator /%/ " modulus
syn match operator /^/ " exponentiation

syn match operator /;/
syn match operator /@/

" -----------------------------------------------------------------------------
hi def link operator Operator



" =============================================================================
"                          M I S C E L L A N I A
" -----------------------------------------------------------------------------
syn match s_varlabel '\w\+:'
syn match s_varlabel '<\w\+>'
" -----------------------------------------------------------------------------
hi def link s_varlabel Special



" =============================================================================
"                             C O M M E N T S
" -----------------------------------------------------------------------------
" define todo highlighting
syn match s_todo /\(TODO\|NOTE\|FIXME\):/ contained
syn keyword s_todo XXX contained
syn match s_tag /\(Author\|Email\|Github\|Bugs\|Website\|Maintainer\|Description\):/ contained
syn match s_tag /\(arg\|short\|long\|metavar\|group\|maybe-text-file\|example\):/ contained

" define comments
" syn match comment '\/\/.*$' contains=tag
" syn region comment start='\/\*' end='\*\/' contains=tag
syn match s_comment '--.*' contains=s_todo,s_tag
syn region s_comment start="{-" end="-}" contains=s_todo,s_tag

" =============================================================================
"                               E R R O R S
" -----------------------------------------------------------------------------
syn match s_error '^#'

syn match reserved '\<table\>'
syn match reserved '\<import\>'
syn match reserved '\<type\>'
syn match reserved '\<instance\>'
syn match reserved '\<class\>'
syn match reserved '\<object\>'
syn match reserved '\<record\>'

" -----------------------------------------------------------------------------
hi def link s_comment  Comment
hi def link s_todo     Todo
hi def link s_tag      SpecialComment
hi def link s_error    Error
