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

let g:colors_name = "hysteria"
let g:base_background = 'dark'

" Normal texts.
call hysteric_colors#Applys("NONE", hysteric_colors#Mono25(21),
\                  "Nornal",
\                  "Folded")

" values
call hysteric_colors#Applys("NONE", hysteric_colors#Mono25(24),
\                  "Constant",
\                  "String",
\                  "Float",
\                  "Number")

call hysteric_colors#Apply("Boolean",         "NONE",         hysteric_colors#RGB6(4, 0, 0))

call hysteric_colors#Apply("Identifier",      "NONE",         hysteric_colors#Mono25(16))
call hysteric_colors#Apply("Function",        "NONE",         hysteric_colors#RGB6(3, 0, 0))
" state
call hysteric_colors#Apply("Statement",       "NONE",         hysteric_colors#Mono25(14))
call hysteric_colors#Apply("Conditional",     "NONE",         hysteric_colors#RGB6(4, 0, 0))
call hysteric_colors#Apply("Operator",        "NONE",         hysteric_colors#RGB6(3, 0, 0))
call hysteric_colors#Apply("Repeat",          "NONE",         hysteric_colors#Mono25(10))
call hysteric_colors#Apply("Label",           "NONE",         hysteric_colors#Mono25(12))
call hysteric_colors#Apply("Title",           "NONE",         hysteric_colors#Mono25(12))
call hysteric_colors#Apply("Exception",       "NONE",         hysteric_colors#RGB6(2, 0, 0))

" type
call hysteric_colors#Apply("Type",            "NONE",         hysteric_colors#RGB6(3, 0, 0))
call hysteric_colors#Apply("Typedef",         "NONE",         hysteric_colors#RGB6(3, 0, 0))

"pair
call hysteric_colors#Apply("MatchParen",      hysteric_colors#RGB6(3, 0, 0), hysteric_colors#Mono25(7))

" comments
call hysteric_colors#Apply("Comment",         hysteric_colors#Mono25(7),      hysteric_colors#Mono25(14))
call hysteric_colors#Apply("SpecialComment",  "None",         hysteric_colors#RGB6(5, 0, 1))
call hysteric_colors#Apply("Todo",            hysteric_colors#Mono25(14),     hysteric_colors#Mono25(2))


" defined wellknown labels
"PreProcessor
call hysteric_colors#Apply("PreProc",         "NONE",         hysteric_colors#Mono25(10))
call hysteric_colors#Apply("PreCondit",       "NONE",         hysteric_colors#Mono25(14))

call hysteric_colors#Applys("NONE", hysteric_colors#RGB6(4, 0, 0),
\                  "Include",
\                  "Define",
\                  "Macro",
\                  "Keyword")

" Special
call hysteric_colors#Apply("Special",         "NONE",         hysteric_colors#RGB6(4, 0, 0))
call hysteric_colors#Apply("SpecialChar",     "NONE",         hysteric_colors#RGB6(5, 0, 2))

"Other
call hysteric_colors#Apply("Error",           hysteric_colors#RGB6(4, 1, 1), hysteric_colors#Mono25(22))


"User Interface
"Menu
call hysteric_colors#Apply("PMenuSbar",       hysteric_colors#Mono25(24),     hysteric_colors#Mono25(2))
call hysteric_colors#Apply("PMenuSel",        hysteric_colors#Mono25(24),     hysteric_colors#RGB6(2, 0, 0))
call hysteric_colors#Apply("PMenu",           hysteric_colors#Mono25(24),     hysteric_colors#Mono25(2))
call hysteric_colors#Apply("WildMenu",        hysteric_colors#Mono25(21),     hysteric_colors#Mono25(2))

"Search
call hysteric_colors#Apply("Question",        "NONE",         hysteric_colors#RGB6(3, 0, 0))
call hysteric_colors#Apply("Search",          hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(2))
call hysteric_colors#Apply("IncSearch",       hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(2))

"Split
call hysteric_colors#Apply("VertSplit",     hysteric_colors#Mono25(2),      hysteric_colors#Mono25(2))

call hysteric_colors#Apply("StatusLineNC",    "NONE",         hysteric_colors#Mono25(21))
call hysteric_colors#Apply("StatusLine",      "NONE",         hysteric_colors#RGB6(4, 0, 0))

"VimDiff
call hysteric_colors#Apply("DiffAdd",         hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(2))
call hysteric_colors#Apply("DiffDelete",      hysteric_colors#Mono25(2), hysteric_colors#RGB6(2, 0, 0))
call hysteric_colors#Apply("DiffChange",      hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(24))
call hysteric_colors#Apply("DiffText",        hysteric_colors#RGB6(2, 0, 0), hysteric_colors#Mono25(20))

call hysteric_colors#Apply("Directory",       "NONE",         hysteric_colors#RGB6(4, 0, 0))

endif