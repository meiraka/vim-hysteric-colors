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

let g:colors_name = "le_petit_chaperonrouge"

" Pallet
" green
let s:accent = "#94998a"
" red
let s:positive_dark = "#7f0906"
let s:positive = "#9f424b"
let s:positive_light = "#993745"
" brown
let s:neutral_dark = "#402020"
let s:neutral = "#806060"
let s:neutral_light = "#c0a0a0"
" red to white
let s:negative_dark = "#c10138"
let s:negative = "#81553d"
let s:negative_light = "#ffffff"

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
  let s:background = s:neutral_dark
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


call hysteric_colors#Applys("NONE", s:positive,
\                           "Function")
call hysteric_colors#Applys("NONE", s:neutral,
\                           "Identifier")

" state
call hysteric_colors#Applys("NONE", s:positive_light,
\                           "Statement",
\                           "cppCast")
call hysteric_colors#Applys("NONE", s:accent,
\                           "Operator")
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
\                          "NONE", s:accent)

" bracket pair
call hysteric_colors#Apply("MatchParen", s:positive_dark, s:positive_light)

" comments TODO:
call hysteric_colors#Apply("Comment", s:neutral, s:neutral_light)
call hysteric_colors#Apply("SpecialComment", s:negative_dark, s:positive_light)
call hysteric_colors#Apply("Todo", s:negative_dark, s:neutral_light)


"PreProcessor
call hysteric_colors#Applys("NONE", s:negative_dark,
\                           "PreProc",
\                           "Define",
\                           "PreCondit")
call hysteric_colors#Applys("NONE", s:positive_light,
\                           "Include")


" Special
call hysteric_colors#Applys("NONE", s:accent,
\                           "Special",
\                           "SpecialChar")
call hysteric_colors#Apply("SpecialChar", "NONE", s:negative_dark)

"Other
call hysteric_colors#Apply("Error", s:negative_dark, s:negative_light)


"User Interface
" Inactive
call hysteric_colors#Applys("NONE", s:positive_dark,
\                           "LineNr")
" Active
call hysteric_colors#Applys(s:neutral_dark, "NONE",
\                           "CursorLineNr")
"Menu
call hysteric_colors#Apply("PMenuSbar", s:positive_dark, s:positive)
call hysteric_colors#Apply("PMenuSel",  s:positive, s:positive_dark)
call hysteric_colors#Apply("PMenu",     s:positive_dark, s:positive)
call hysteric_colors#Apply("WildMenu",  s:positive_dark, s:positive)

"Search
call hysteric_colors#Apply("Question",  "NONE", s:negative)
call hysteric_colors#Apply("Search",    s:negative, s:neutral_light)
call hysteric_colors#Apply("IncSearch", s:negative, s:neutral_light)

"Split
call hysteric_colors#Apply("VertSplit",     s:neutral_dark, s:neutral_dark)

call hysteric_colors#Apply("StatusLineNC",    "NONE",         s:neutral_dark)
call hysteric_colors#Apply("StatusLine",      "NONE",         s:negative_light)

"VimDiff
call hysteric_colors#Applys(s:accent,
\                           s:positive,
\                           "DiffAdd")
call hysteric_colors#Applys(s:negative_dark,
\                           s:negative_light,
\                           "DiffDelete")
call hysteric_colors#Applys(s:positive_dark,
\                           s:positive,
\                           "DiffChange")
call hysteric_colors#Applys(s:accent,
\                           s:neutral,
\                           "DiffText")

call hysteric_colors#Apply("Directory", "NONE", s:negative_light)

endif
