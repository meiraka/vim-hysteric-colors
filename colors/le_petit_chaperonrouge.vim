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

function! s:lighter(hexcolor)
  return hysteric#hexcolor#add_brightness(a:hexcolor, 6)
endfunction

function! s:darker(hexcolor)
  return hysteric#hexcolor#add_brightness(a:hexcolor, -6)
endfunction

if &background ==# 'light'
  function! s:lighter(hexcolor)
    return hysteric#hexcolor#add_brightness(a:hexcolor, -6)
  endfunction
  
  function! s:darker(hexcolor)
    return hysteric#hexcolor#add_brightness(a:hexcolor, 6)
  endfunction

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


call hysteric_colors#applys("NONE", s:positive,
\                           "Function")
call hysteric_colors#applys("NONE", s:neutral,
\                           "Identifier")

" state
call hysteric_colors#applys("NONE", s:positive_light,
\                           "Statement",
\                           "cppCast")
call hysteric_colors#applys("NONE", s:accent,
\                           "Operator")
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
\                          "NONE", s:lighter(s:accent))

" bracket pair
call hysteric_colors#apply("MatchParen", s:positive_dark, s:positive_light)

" comments TODO:
call hysteric_colors#apply("Comment", s:neutral, s:neutral_light)
call hysteric_colors#apply("SpecialComment", s:negative_dark, s:positive_light)
call hysteric_colors#apply("Todo", s:negative_dark, s:neutral_light)


"PreProcessor
call hysteric_colors#applys("NONE", s:negative_dark,
\                           "PreProc",
\                           "Define",
\                           "PreCondit")
call hysteric_colors#applys("NONE", s:positive_light,
\                           "Include")


" Special
call hysteric_colors#applys("NONE", s:accent,
\                           "Special",
\                           "SpecialChar")
call hysteric_colors#apply("SpecialChar", "NONE", s:negative_dark)

"Other
call hysteric_colors#apply("Error", s:negative_dark, s:negative_light)


"User Interface
" Inactive
call hysteric_colors#applys(s:lighter(s:neutral_dark), "NONE",
\                           "CursorLine")   
call hysteric_colors#applys("NONE", s:positive_dark,
\                           "LineNr")
" Active
call hysteric_colors#applys(s:neutral_dark, "NONE",
\                           "CursorLineNr")
"Menu
call hysteric_colors#apply("PMenuSbar", s:positive_dark, s:positive)
call hysteric_colors#apply("PMenuSel",  s:positive, s:positive_dark)
call hysteric_colors#apply("PMenu",     s:positive_dark, s:positive)
call hysteric_colors#apply("WildMenu",  s:positive_dark, s:positive)

"Search
call hysteric_colors#apply("Question",  "NONE", s:negative)
call hysteric_colors#apply("Search",    s:negative, s:neutral_light)
call hysteric_colors#apply("IncSearch", s:negative, s:neutral_light)

"Split
call hysteric_colors#apply("VertSplit",     s:neutral_dark, s:neutral_dark)

call hysteric_colors#apply("StatusLineNC",    "NONE",         s:neutral_dark)
call hysteric_colors#apply("StatusLine",      "NONE",         s:negative_light)

"VimDiff
call hysteric_colors#applys(s:accent,
\                           s:positive,
\                           "DiffAdd")
call hysteric_colors#applys(s:negative_dark,
\                           s:negative_light,
\                           "DiffDelete")
call hysteric_colors#applys(s:positive_dark,
\                           s:positive,
\                           "DiffChange")
call hysteric_colors#applys(s:accent,
\                           s:neutral,
\                           "DiffText")

call hysteric_colors#apply("Directory", "NONE", s:negative_light)

endif
