" require version 7.0 or later.
if v:version >= 700

"set background=dark
if &background ==# 'dark' || &background ==# 'light'
    "ok
else
    set background = dark
endif
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "tricolore"
let g:base_background = 'dark'

" Pallet
let s:positive = "#425290"
let s:positive_dark = "#12124a"
let s:positive_light = "#bfbfe0"
let s:negative = "#b2020"
let s:negative_dark = "#7a1010"
let s:negative_light = "#cf8080"
let s:neutral = "#909090"
let s:neutral_dark = "#202020"
let s:neutral_light = "#f0f0f0"

" Normal texts.
call hysteric_colors#Applys("NONE", s:neutral_light,
\                           "Normal",
\                           "Folded")

" values
call hysteric_colors#Applys("NONE", s:positive_light,
\                           "Constant",
\                           "Boolean",
\                           "Float",
\                           "Number")
call hysteric_colors#Applys("NONE", s:negative_light,
\                           "Character",
\                           "String")
call hysteric_colors#Apply("Function", "NONE", s:positive)
call hysteric_colors#Applys("NONE", s:neutral,
\                           "Identifier")

" keywords
call hysteric_colors#Applys("NONE", s:positive_dark,
\                           "Keywords")
" state
call hysteric_colors#Applys("NONE", s:positive_dark,
\                           "Statement")
call hysteric_colors#Applys("NONE", s:negative,
\                           "Operator")
call hysteric_colors#Applys("NONE", s:positive,
\                           "Conditional",
\                           "Repeat",
\                           "Label",
\                           "Exception")

call hysteric_colors#Apply("Title", s:positive_light, s:positive_dark)

" type
call hysteric_colors#Apply("Type",
\                          "NONE", s:negative_light)
call hysteric_colors#Apply("StorageClass",
\                          "NONE", s:positive_light)
call hysteric_colors#Apply("Typedef",
\                          "NONE", s:negative)

" bracket pair
call hysteric_colors#Apply("MatchParen", s:positive_dark, s:positive_light)

" comments
call hysteric_colors#Apply("Comment", s:neutral, s:positive_light)
call hysteric_colors#Apply("SpecialComment", s:neutral_dark, s:positive_light)
call hysteric_colors#Apply("Todo", s:neutral, s:negative_light)


"PreProcessor
call hysteric_colors#Applys("NONE", s:negative_dark,
\                           "PreProc",
\                           "Define",
\                           "PreCondit")
call hysteric_colors#Applys("NONE", s:positive_dark,
\                           "Include")


" Special
call hysteric_colors#Applys("NONE", s:negative,
\                           "SpecialChar")
call hysteric_colors#Apply("SpecialChar", "NONE", s:negative_dark)

"Other
call hysteric_colors#Apply("Error", s:negative_dark, s:neutral_light)


"User Interface
"Menu
call hysteric_colors#Apply("PMenuSbar", s:neutral_light, s:neutral_light)
call hysteric_colors#Apply("PMenuSel",  s:positive_dark, s:neutral_light)
call hysteric_colors#Apply("PMenu",     s:neutral_light, s:negative_dark)
call hysteric_colors#Apply("WildMenu",  s:negative_dark, s:neutral_light)

"Search
call hysteric_colors#Apply("Question",        "NONE",         hysteric_colors#RGB6(3, 0, 0))
call hysteric_colors#Apply("Search",          hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(2))
call hysteric_colors#Apply("IncSearch",       hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(2))

"Split
call hysteric_colors#Apply("VertSplit",     hysteric_colors#Mono25(2),      hysteric_colors#Mono25(2))

call hysteric_colors#Apply("StatusLineNC",    "NONE",         hysteric_colors#Mono25(21))
call hysteric_colors#Apply("StatusLine",      "NONE",         hysteric_colors#RGB6(4, 0, 0))

"VimDiff
call hysteric_colors#Applys(s:positive_light,
\                           s:positive,
\                           "DiffAdd")
call hysteric_colors#Applys(s:positive_light,
\                           s:positive_dark,
\                           "DiffChange")
call hysteric_colors#Applys(s:positive,
\                           s:positive_dark,
\                           "DiffText")
call hysteric_colors#Applys(hysteric_colors#Mono25(24),
\                           s:negative_dark,
\                           "DiffDelete")

call hysteric_colors#Apply("Directory",       "NONE",         hysteric_colors#RGB6(4, 0, 0))

endif
