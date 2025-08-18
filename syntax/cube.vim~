" Vim syntax file
" Language:	Cube Snytax File
" Maintainer:	David O'Brien
" URL:		https://github.com/odaiwai/cube.vim
" Last Change:  2025...

" Quit when syntax file already loaded
if exists('b:current_syntax')
    finish
endif

" Cube is case insenitive
syn case ignore

syntax match cubeSystemKW /\v^RUN.*$/
syntax match cubeSystemKW /\v^ENDRUN.*$/
syn region cubeBasicString start=/["']/ skip=/\\["']/ end=/["']/

syn match cubeDecimal		"\<0\+[1-7]\=\>"	 display
syn match cubeDecimal		"\<[1-9]\d*\>"		 display
syn match cubeFloat		"\<\d\+\.\d*\%(e[+-]\=\d\+\)\=\>" display
syn match cubeFloat		"\.\d\+\%(e[+-]\=\d\+\)\=\>"	  display
syn match cubeFloat		"\<\d\%(e[+-]\=\d\+\)\>"	  display

syn keyword cubeTodo		contained TODO FIXME XXX NOTE

" Conditionals
syntax keyword cubeConditional IF ELSE ENDIF contained
syntax region cubeConditionalRegion start="if" end="ENDIF" contains=cubeConditional

" Loops
syntax keyword cubeRepeat LOOP ENDLOOP JLOOP ENDJLOOP contained
syntax region cubeRepeatRegion start="\v(J)*LOOP" end="\vEND(J)*LOOP" contains=cubeRepeat

syntax match cubeFileSubKeywords "\v(MATI|MATO|RECO|DBI|LOOKUPI|ZDATI|PRINTO)\[[0-9]+\]" contained
syntax keyword cubeFileSubSubKeywords FIELDS FORM CFORM SORT AUTOMDARRAY AUTOARRAY
syntax keyword cubeFileSubKeywords RECI
syntax region cubeFileKeywordsRegion start='\vFILE[IO]' skip='\v,$' end='$' contains=cubeFileSubKeywords

" Match CubeVariables - long ones (10+ chars) can get truncated
syntax match cubeTempVariable "\v\s+(_[A-Za-z0-9_]+)[ \=\+\*\/\!]+"
syntax match cubeVariable "\v[ (^_]([A-Za-z0-9_]{1,10})[ \=\+\*\/\!]+"
syntax match cubeLongVariable "\v\s+([A-Za-z0-9_]{10,})[ \=+\*\/\!]+"

syntax keyword cubeDBKeywords DBISEEK
syntax match cubeInputDB_zonal "(DI|MI|ZI|RI|DBA)\.[0-9]+\."
syn match cubeArithmeticOperator "[-+*/\\^]"
" syn match cubeRelationalOperator "<>\|<=\|>=\|[><=]"
syn keyword cubeLogicalOperator	 not and or == != =
syntax match cubeScenarioKey "\v\{.{-}\}"
syntax match cubeComment "\v;.*$" contains=cubeTodo,@Spell

syntax region cubeMultiLineComment start='\v\/\*' end='\v\*\/' contains=cubeComment

" Lookup stanzas
syntax keyword cubeLookup LOOKUP LOOKUPI NAME FAIL LIST RESULT contained
syntax match cubeLookup "\vLOOKUP\[[0-9]+\]\=" contained
syntax region cubeLookupRegion start='LOOKUP' skip=',$' end='$' contains=cubeLookup

" Print file Errors
syntax match cubePrintError "\vF\([0-9_]+\)\: .*$"
syntax match cubePrintWarning "\vrW\([0-9_]+\)\: .*$"
syntax region cubePrintErrorRegion start='F\([0-9_]+\)\: ' skip=',' end='$' contains=cubePrintError

syntax match cubeReference "(RO|ZI|RI|DI|MI)\.[0-9]+"

" hi def link cubeScenarioKey Constant
hi def link cubeSystemKW Statement
hi def link cubeFileKeywords Statement
hi def link cubeFileSubKeywords Identifier
hi def link cubeFileSubSubKeywords Identifier
hi def link cubeDecimal Number
hi def link cubeFloat Number
hi def link cubeDBKeywords Label
hi def link cubeConditional Conditional
hi def link cubeLookup Conditional
hi def link cubeRepeat Repeat
hi def link cubeScenarioKey Error
hi def link cubeComment Comment
hi def link cubeBasicString String
hi def link cubeSingleComment Comment
hi def link cubeVariable Identifier
hi def link cubeLongVariable Error
hi def link cubeTempVariable Comment
hi def link cubeMuiltiLine Identifier
hi def link cubeComment Comment
hi def link cubePrintError Error
hi def link cubePrintWarning Todo

let b:current_syntax = 'cube'
