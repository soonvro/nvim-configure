syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" hi def cCustomFunc   guifg=#83a598
" hi def link cCustomClass Function

syn match    cCustomArrow       "->"
hi def       cCustomArrow       guifg=#d3869b
syn match    cCustomStructFunc  "\(->\)\@<=\w\+\n*\s*(\@=" contains=cCustomParen
hi def       cCustomStructFunc  guifg=#83a598 gui=bold
