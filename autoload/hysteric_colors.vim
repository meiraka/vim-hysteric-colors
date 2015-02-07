
" apply color to label
" TODO Generates 256 color based 16, 24bit color
function! hysteric_colors#Apply (label, background, forground)

  " Returns hex color and term color list from hex color or term color
  function! s:get2typecolor(color)
    if a:color ==# "NONE"
      return ["NONE", "NONE"]
    elseif type(a:color) == 0
      return ["#000000", a:color]
    elseif type(a:color) == 1
      return [a:color, hysteric_colors#HexToTerm(a:color)]
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

" Converts 24bit color to term color.
function! hysteric_colors#HexToTerm (hexcolor)
  " Converts hex string to given positional notation.
  function! s:hex2(size, hex)
    let s:sized = float2nr(round(str2nr(a:hex, 16) * a:size / 256.0))
    if s:sized < a:size
      return s:sized
    else
      return a:size - 1
    endif
  endfunction

  let s:r6 = s:hex2(6, strpart(a:hexcolor, 1, 2))
  let s:g6 = s:hex2(6, strpart(a:hexcolor, 3, 2))
  let s:b6 = s:hex2(6, strpart(a:hexcolor, 5, 2))
  if s:r6 == s:g6 && s:g6 == s:b6
    " rgb color is rounded, returns mono color
    return hysteric_colors#Mono25((s:hex2(25, strpart(a:hexcolor, 1, 2))
\                                  + s:hex2(25, strpart(a:hexcolor, 3, 2))
\                                  + s:hex2(25, strpart(a:hexcolor, 5, 2)))
\                                 / 3)
  else
    return hysteric_colors#RGB6(s:r6, s:g6, s:b6)
  endif
endfunction

" apply color to multiple items
function! hysteric_colors#Applys (background, forground, ...)
  for label in a:000
    call hysteric_colors#Apply(label, a:background, a:forground)
  endfor
endfunction

" generate int 25 level mono color.
function! hysteric_colors#Mono25(level)
  if a:level <= 0
    return 232
  elseif a:level >= 24
    return 231
  else
    return 231 + a:level
  endif
endfunction

" generate int 6 level RGB color.
function! hysteric_colors#RGB6(r, g, b)
  return 16 + a:r * 6 * 6 + a:g * 6 + a:b
endfunction

" returns Color object(tuple of rgb, 24bit)
function! hysteric_colors#Color(hexcolor)
  let s:r = str2nr(strpart(a:hexcolor, 1, 2), 16)
  let s:g = str2nr(strpart(a:hexcolor, 3, 2), 16)
  let s:b = str2nr(strpart(a:hexcolor, 5, 2), 16)
  return [s:r, s:g, s:b]
endfunction

function! hysteric_colors#ColorToHex(color)
  let s:rs = printf("%02x", a:color[0])
  let s:gs = printf("%02x", a:color[1])
  let s:bs = printf("%02x", a:color[2])
  return "#" . s:rs . s:gs . s:bs
endfunction

" returns brightness
function! hysteric_colors#ColorBrightness(color)
  return max(a:color)
endfunction

" returns apply brightness
" 
" require 42 or birght value to change term color.
function! hysteric_colors#ColorAddBrightness(color, brightness)
  let [s:r, s:g, s:b] = a:color
  return [hysteric_colors#ColorPartRounding(s:r + a:brightness),
\         hysteric_colors#ColorPartRounding(s:g + a:brightness),
\         hysteric_colors#ColorPartRounding(s:b + a:brightness)]
endfunction

" rounding 24 bit color
function! hysteric_colors#ColorPartRounding(color_part)
  if a:color_part < 0
    return 0
  elseif 255 < a:color_part
    return 255
  else
    return a:color_part
  endif
endfunction
