syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" hi def cCustomFunc   guifg=#83a598
" hi def link cCustomClass Function

syn match    cCustomStructFunc     "\(->\)\@<=w\+\s*(\@=" contains=cCustomParen
hi def cCustomStructFunc   guifg=#83a598   gui=bold