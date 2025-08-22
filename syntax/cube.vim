" Vim syntax file
" Language:	Cube Syntax File
" Maintainer:	David O'Brien
" URL:		https://github.com/odaiwai/cube
" Last Change:  2025/08/22

" Quit when syntax file already loaded
if exists('b:current_syntax')
    finish
endif

" Cube is case insenitive
syn case ignore

syntax match cubeSystemKeyword /\v^RUN.*$/ contains=cubeString
syntax match cubeSystemKeyword /\v^ENDRUN.*$/
" syntax region cubeMacroRegio
"	\ start="RUN" end="ENDRUN"
syntax match cubeScenarioKey /\v\{[A-z0-9_]{-}\}/
syntax match cubeComment /\v\zs\;.*$\ze/

syntax region cubeIgnoreRegion
	\ start=/\v\/\*/
  \ end=/\v\*\//
  \ contains=cubeComment

" Strings (allow for internal escapes for the quote chars.)
syn region cubeString
      \ start=/["']/
      \ skip=/\\["']/
      \ end=/["']/
      \ contains=cubeScenarioKey

" Numeric values
syn match cubeDecimal	"[1-9]+"	 display
syn match cubeDecimal	"[0-9]\d*"		 display
syn match cubeFloat		"\d\+\.\d*\%(e[+-]\=\d\+\)" display
syn match cubeFloat		"\.\d\+\%(e[+-]\=\d\+\)"	  display
syn match cubeFloat		"\d\%(e[+-]\=\d\+\)"	  display

syn keyword cubeTodo		contained TODO FIXME XXX NOTE

" Conditionals
syntax keyword cubeConditional IF ELSE ENDIF contained
syntax region cubeConditionalRegion
	\ start=/IF/
  \ end=/ENDIF/
  \ contains=cubeConditional

" Loops
syntax keyword cubeRepeat LOOP ENDLOOP JLOOP ENDJLOOP contained
syntax region cubeRepeatRegion
	\ start=/\v(J)*LOOP/
  \ end=/\vEND(J)*LOOP/
  \ contains=cubeRepeat

" FILI/O
syntax match cubeFileSubKeywords "\v(MATI|MATO|RECO|DBI|LOOKUPI|ZDATI|PRINTO)\[[0-9]+\]" contained
syntax keyword cubeFileSubKeywords RECI
syntax keyword cubeFileSubSubKeywords FIELDS FORM CFORM SORT AUTOMDARRAY AUTOARRAY
syntax region cubeFileIO
      \ start=/\vFILE[IO]/
      \ skip=/\v,$/
      \ end=/$/
      \ contains=cubeFileSubKeywords,cubeScenarioKey,cubeString

" Match CubeVariables - long ones (10+ chars) can get truncated
syntax match cubeTempVariable /\v\s+\zs_[A-Za-z0-9_]+\ze[ \=\+\*\/\!]+/
syntax match cubeVariable /\v\s+\zs[^_][A-Za-z0-9_]{1,10}\ze[ \=\+\*\/\!]+/ "contained=cubeStatement,cubeFileIO
syntax match cubeLongVariable /\v\s+([^_][A-Za-z0-9_]{10,})[ \=+\*\/\!]+/ "contained=cubeStatement,cubeFileIO

syntax keyword cubeDBKeywords DBISEEK
syntax match cubeInputDB_zonal "\v(DI|MI|ZI|RI|DBA)\.[0-9]+\."
syn match cubeArithmeticOperator "[-+*/\\^]"
" syn match cubeRelationalOperator "<>\|<=\|>=\|[><=]"
syn keyword cubeLogicalOperator	not and or == != =

" Lookup stanzas
syntax keyword cubeLookupKeyword LOOKUPI FAIL LIST contained
syntax keyword cubeLookupKeyword INTERPOLATE PRINT contained
syntax match cubeLookupName /\v\cNAME[ \=]+\zs[a-z0-9_]+\ze\s*,/ contained
syntax keyword cubeLookupKeyword NAME LOOKUP contained
syntax match cubeLookupKeyword /\v\c\zsLOOKUP[[0-9]+\]\ze[ \=]+/ contained
syntax match cubeLookupKeyword /\v\c\zsRESULT\ze[ \=]+/ contained
syntax match cubeLookupKeyword /\v\c(LOOKUP\[[0-9]+\]|RESULT)[ \=]+\zs[A-z0-9_]+\ze/ contained
syntax region cubeLookupRegion
      \ start=/LOOKUP/
      \ skip=/,$/
      \ end=/$/
      \ contains=cubeLookupKeyword,cubeComment,cubeLookupName

" Distribution Module
syntax keyword cubeDistributionKeyword Exclude Include SETPA contained
syntax keyword cubeDistributionKeyword FFACTORS KFACTORS LOS contained
syntax keyword cubeDistributionKeyword LOSRANGE PURPOSE contained
syntax match cubeDistributionKeyword /\v\c(P|A)\[[0-9]+\]\ze[ \=]+/ contained
syntax region cubeDistributionRegion
      \ start=/\v\c(SETPA|GRAVITY)/
      \ skip=/,$/
      \ end=/$/
      \ contains=cubeDistributionKeyword,cubeComment

" Matrix Module
syntax keyword cubeMatrixKeyword FREQUENCY BASEMW REPORT contained
syntax keyword cubeMatrixKeyword VALUEMW RANGE TITLE contained
syntax keyword cubeMatrixKeyword LOSRANGE PURPOSE contained
syntax match cubeMatrixKeyword /\v\c(P|A)\[[0-9]+\]\ze[ \=]+/ contained
syntax region cubeMatrixRegion
      \ start=/\v\c(FREQUENCY)/
      \ skip=/,$/
      \ end=/$/
      \ contains=cubeMatrixKeyword,cubeComment,cubeString


" Print file Errors
syntax match cubePrintError "\vF\([0-9_]+\)\: .*$"
syntax match cubePrintWarning "\vrW\([0-9_]+\)\: .*$"
syntax region cubePrintErrorRegion
      \ start=/F\([0-9_]+\)\: /
      \ skip='$'
      \ end=/\v[*]{2,}/
      \ contains=cubePrintError

syntax match cubeReference "\v(RO|ZI|RI|DI|MI)\.[0-9]+\."

" Highlighted not linked
hi def cubeFileIO ctermbg=grey guibg=#010101 ctermfg=white guifg=#c0c0c0
hi def cubeScenarioKey gui=bold ctermfg=blue guifg=#008787
hi def cubeIgnoreRegion ctermbg=grey gui=bold ctermfg=blue guifg=#808090 guibg=#404060
" Define the highlighting
hi def cubeSystemKeyword ctermfg=red guifg=#e00000 gui=bold
hi def link cubeFileKeywords Statement
hi def link cubeFileSubKeywords Identifier
hi def link cubeFileSubSubKeywords Identifier
hi def link cubeDecimal Number
hi def link cubeFloat Number
hi def link cubeDBKeywords Label
hi def link cubeConditional Conditional
hi def link cubeLookup Conditional
hi def link cubeMatrixRegion Conditional
hi def link cubeMatrixKeyword Identifier
hi def link cubeDistributionRegion Conditional
hi def link cubeDistributionKeyword Identifier
hi def link cubeLookupKeyword Identifier
hi def link cubeLookupName Identifier
hi def link cubeRepeat Repeat
hi def link cubeComment Comment
hi def link cubeString String
hi def link cubeVariable Identifier
hi def link cubeLongVariable Error
hi def link cubeTempVariable Comment
hi def link cubeMuiltiLine Identifier
hi def link cubePrintError Error
hi def link cubePrintWarning Todo

let b:current_syntax = 'cube'
