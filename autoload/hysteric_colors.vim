
" apply color to label
" TODO Generates 256 color based 16, 24bit color
function! hysteric_colors#apply(label, background, forground)

  " Returns hex color and term color list from hex color or term color
  function! s:get2typecolor(color)
    if a:color ==# "NONE"
      return ["NONE", "NONE"]
    elseif type(a:color) == 0
      return ["#000000", a:color]
    elseif type(a:color) == 1
      return [a:color, hysteric#termcolor#from_hex(a:color)]
    else
      throw "unsupported color type: " . a:color
    endif
  endfunction

  let s:bg = s:get2typecolor(a:background)
  let s:fg = s:get2typecolor(a:forground)

  exec "hi " . a:label . 
\      " guifg=" . s:fg[0] . " guibg=" . s:bg[0] . " gui=NONE" . 
\      " ctermbg=" .s:bg[1] . " ctermfg=" . s:fg[1] " cterm=NONE"
endfunction

" apply color to multiple items
function! hysteric_colors#applys(background, forground, ...)
  for label in a:000
    call hysteric_colors#apply(label, a:background, a:forground)
  endfor
endfunction
