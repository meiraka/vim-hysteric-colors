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
call hysteric_colors#Applys(s:background, s:neutral_light,
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

" state
call hysteric_colors#Applys("NONE", s:positive_light,
\                           "Statement",
\                           "cppCast")
call hysteric_colors#Applys("NONE", s:accent,
\                           "Operator",
\                           "cppAccess")
call hysteric_colors#Applys("NONE", s:positive,
\                           "Conditional",
\                           "Repeat",
\                           "Label",
\                           "Exception",
\                           "Keyword")

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
call hysteric_colors#Applys("NONE", s:positive_light,
\                           "Include")


" Special
call hysteric_colors#Applys("NONE", s:negative,
\                           "SpecialChar")
call hysteric_colors#Apply("SpecialChar", "NONE", s:negative_dark)

"Other
call hysteric_colors#Apply("Error", s:negative_dark, s:neutral_light)


"User Interface
" Inactive
call hysteric_colors#Applys("NONE", s:positive_dark,
\                           "LineNr")
" Active
call hysteric_colors#Applys(s:neutral_dark, "NONE",
\                           "CursorLineNr")
"Menu
call hysteric_colors#Apply("PMenuSbar", s:neutral_light, s:neutral_light)
call hysteric_colors#Apply("PMenuSel",  s:positive_dark, s:neutral_light)
call hysteric_colors#Apply("PMenu",     s:neutral_light, s:negative_dark)
call hysteric_colors#Apply("WildMenu",  s:negative_dark, s:neutral_light)

"Search
call hysteric_colors#Apply("Question",  "NONE", s:negative)
call hysteric_colors#Apply("Search",    s:negative, s:neutral_dark)
call hysteric_colors#Apply("IncSearch", s:negative, s:neutral_dark)

"Split
call hysteric_colors#Apply("VertSplit",     s:neutral, s:neutral)

call hysteric_colors#Apply("StatusLineNC",    "NONE",         s:neutral_light)
call hysteric_colors#Apply("StatusLine",      "NONE",         s:negative_light)

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
call hysteric_colors#Applys(s:neutral_light,
\                           s:negative_dark,
\                           "DiffDelete")

call hysteric_colors#Apply("Directory", "NONE", s:negative_light)

endif
