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
call hysteric_colors#applys("NONE", hysteric#termcolor#mono25(21),
\                  "Nornal",
\                  "Folded")

" values
call hysteric_colors#applys("NONE", hysteric#termcolor#mono25(24),
\                  "Constant",
\                  "String",
\                  "Float",
\                  "Number")

call hysteric_colors#apply("Boolean",         "NONE",         hysteric#termcolor#rgb6(4, 0, 0))

call hysteric_colors#apply("Identifier",      "NONE",         hysteric#termcolor#mono25(16))
call hysteric_colors#apply("Function",        "NONE",         hysteric#termcolor#rgb6(3, 0, 0))
" state
call hysteric_colors#apply("Statement",       "NONE",         hysteric#termcolor#mono25(14))
call hysteric_colors#apply("Conditional",     "NONE",         hysteric#termcolor#rgb6(4, 0, 0))
call hysteric_colors#apply("Operator",        "NONE",         hysteric#termcolor#rgb6(3, 0, 0))
call hysteric_colors#apply("Repeat",          "NONE",         hysteric#termcolor#mono25(10))
call hysteric_colors#apply("Label",           "NONE",         hysteric#termcolor#mono25(12))
call hysteric_colors#apply("Title",           "NONE",         hysteric#termcolor#mono25(12))
call hysteric_colors#apply("Exception",       "NONE",         hysteric#termcolor#rgb6(2, 0, 0))

" type
call hysteric_colors#apply("Type",            "NONE",         hysteric#termcolor#rgb6(3, 0, 0))
call hysteric_colors#apply("Typedef",         "NONE",         hysteric#termcolor#rgb6(3, 0, 0))

"pair
call hysteric_colors#apply("MatchParen",      hysteric#termcolor#rgb6(3, 0, 0), hysteric#termcolor#mono25(7))

" comments
call hysteric_colors#apply("Comment",         hysteric#termcolor#mono25(7),      hysteric#termcolor#mono25(14))
call hysteric_colors#apply("SpecialComment",  "None",         hysteric#termcolor#rgb6(5, 0, 1))
call hysteric_colors#apply("Todo",            hysteric#termcolor#mono25(14),     hysteric#termcolor#mono25(2))


" defined wellknown labels
"PreProcessor
call hysteric_colors#apply("PreProc",         "NONE",         hysteric#termcolor#mono25(10))
call hysteric_colors#apply("PreCondit",       "NONE",         hysteric#termcolor#mono25(14))

call hysteric_colors#applys("NONE", hysteric#termcolor#rgb6(4, 0, 0),
\                  "Include",
\                  "Define",
\                  "Macro",
\                  "Keyword")

" Special
call hysteric_colors#apply("Special",         "NONE",         hysteric#termcolor#rgb6(4, 0, 0))
call hysteric_colors#apply("SpecialChar",     "NONE",         hysteric#termcolor#rgb6(5, 0, 2))

"Other
call hysteric_colors#apply("Error",           hysteric#termcolor#rgb6(4, 1, 1), hysteric#termcolor#mono25(22))


"User Interface
"Menu
call hysteric_colors#apply("PMenuSbar",       hysteric#termcolor#mono25(24),     hysteric#termcolor#mono25(2))
call hysteric_colors#apply("PMenuSel",        hysteric#termcolor#mono25(24),     hysteric#termcolor#rgb6(2, 0, 0))
call hysteric_colors#apply("PMenu",           hysteric#termcolor#mono25(24),     hysteric#termcolor#mono25(2))
call hysteric_colors#apply("WildMenu",        hysteric#termcolor#mono25(21),     hysteric#termcolor#mono25(2))

"Search
call hysteric_colors#apply("Question",        "NONE",         hysteric#termcolor#rgb6(3, 0, 0))
call hysteric_colors#apply("Search",          hysteric#termcolor#rgb6(2, 0, 0), hysteric#termcolor#mono25(2))
call hysteric_colors#apply("IncSearch",       hysteric#termcolor#rgb6(2, 0, 0), hysteric#termcolor#mono25(2))

"Split
call hysteric_colors#apply("VertSplit",     hysteric#termcolor#mono25(2),      hysteric#termcolor#mono25(2))

call hysteric_colors#apply("StatusLineNC",    "NONE",         hysteric#termcolor#mono25(21))
call hysteric_colors#apply("StatusLine",      "NONE",         hysteric#termcolor#rgb6(4, 0, 0))

"VimDiff
call hysteric_colors#apply("DiffAdd",         hysteric#termcolor#rgb6(2, 0, 0), hysteric#termcolor#mono25(2))
call hysteric_colors#apply("DiffDelete",      hysteric#termcolor#mono25(2), hysteric#termcolor#rgb6(2, 0, 0))
call hysteric_colors#apply("DiffChange",      hysteric#termcolor#rgb6(2, 0, 0), hysteric#termcolor#mono25(24))
call hysteric_colors#apply("DiffText",        hysteric#termcolor#rgb6(2, 0, 0), hysteric#termcolor#mono25(20))

call hysteric_colors#apply("Directory",       "NONE",         hysteric#termcolor#rgb6(4, 0, 0))

endif
