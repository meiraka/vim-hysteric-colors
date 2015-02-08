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
let s:accent = "#e3b970"
let s:positive = "#425290"
let s:positive_dark = "#12124a"
let s:positive_light = "#b6bff0"
let s:negative = "#b20200"
let s:negative_dark = "#7a1010"
let s:negative_light = "#cf8080"
let s:neutral = "#808080"
let s:neutral_dark = "#202020"
let s:neutral_light = "#F0F0F0"

if &background ==# 'light'
  let s:temp = s:positive_dark
  let s:positive_dark = s:positive_light
  let s:positive_light = s:temp

  let s:temp = s:negative_dark
  let s:negative_dark = s:negative_light
  let s:negative_light = s:temp

  let s:temp = s:neutral_dark
  let s:neutral_dark = s:neutral_light
  let s:neutral_light = s:temp
endif

if has('gui_running')
  let s:background = s:positive_dark
else
  let s:background = "NONE"
endif

" Normal texts.
call hysteric_colors#applys(s:background, s:neutral_light,
\                           "Normal",
\                           "Folded")

" values
call hysteric_colors#applys("NONE", s:positive_light,
\                           "Constant",
\                           "Boolean",
\                           "Float",
\                           "Number")
call hysteric_colors#applys("NONE", s:negative_light,
\                           "Character",
\                           "String")
call hysteric_colors#apply("Function", "NONE", s:positive)
call hysteric_colors#applys("NONE", s:neutral,
\                           "Identifier")

" state
call hysteric_colors#applys("NONE", s:positive_light,
\                           "Statement",
\                           "cppCast")
call hysteric_colors#applys("NONE", s:accent,
\                           "Operator",
\                           "cppAccess")
call hysteric_colors#applys("NONE", s:positive,
\                           "Conditional",
\                           "Repeat",
\                           "Label",
\                           "Exception",
\                           "Keyword")

call hysteric_colors#apply("Title", s:positive_light, s:positive_dark)

" type
call hysteric_colors#apply("Type",
\                          "NONE", s:negative_light)
call hysteric_colors#apply("StorageClass",
\                          "NONE", s:positive_light)
call hysteric_colors#apply("Typedef",
\                          "NONE", s:negative)

" bracket pair
call hysteric_colors#apply("MatchParen", s:positive_dark, s:positive_light)

" comments
call hysteric_colors#apply("Comment", s:neutral, s:positive_light)
call hysteric_colors#apply("SpecialComment", s:neutral_dark, s:positive_light)
call hysteric_colors#apply("Todo", s:neutral, s:negative_light)


"PreProcessor
call hysteric_colors#applys("NONE", s:negative_dark,
\                           "PreProc",
\                           "Define",
\                           "PreCondit")
call hysteric_colors#applys("NONE", s:positive_light,
\                           "Include")


" Special
call hysteric_colors#applys("NONE", s:negative,
\                           "SpecialChar")
call hysteric_colors#apply("SpecialChar", "NONE", s:negative_dark)

"Other
call hysteric_colors#apply("Error", s:negative_dark, s:neutral_light)


"User Interface
" Inactive
call hysteric_colors#applys("NONE", s:positive_dark,
\                           "LineNr")
" Active
call hysteric_colors#applys(s:neutral_dark, "NONE",
\                           "CursorLineNr")
"Menu
call hysteric_colors#apply("PMenuSbar", s:neutral_light, s:neutral_light)
call hysteric_colors#apply("PMenuSel",  s:positive_dark, s:neutral_light)
call hysteric_colors#apply("PMenu",     s:neutral_light, s:negative_dark)
call hysteric_colors#apply("WildMenu",  s:negative_dark, s:neutral_light)

"Search
call hysteric_colors#apply("Question",  "NONE", s:negative)
call hysteric_colors#apply("Search",    s:negative, s:neutral_dark)
call hysteric_colors#apply("IncSearch", s:negative, s:neutral_dark)

"Split
call hysteric_colors#apply("VertSplit",     s:neutral, s:neutral)

call hysteric_colors#apply("StatusLineNC",    "NONE",         s:neutral_light)
call hysteric_colors#apply("StatusLine",      "NONE",         s:negative_light)

"VimDiff
call hysteric_colors#applys(s:positive_light,
\                           s:positive,
\                           "DiffAdd")
call hysteric_colors#applys(s:positive_light,
\                           s:positive_dark,
\                           "DiffChange")
call hysteric_colors#applys(s:positive,
\                           s:positive_dark,
\                           "DiffText")
call hysteric_colors#applys(s:neutral_light,
\                           s:negative_dark,
\                           "DiffDelete")

call hysteric_colors#apply("Directory", "NONE", s:negative_light)

endif
