" Converts 24bit color to term color.
function! hysteric#termcolor#from_hex(hexcolor)
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
    return hysteric#termcolor#mono25((s:hex2(25, strpart(a:hexcolor, 1, 2))
\                                  + s:hex2(25, strpart(a:hexcolor, 3, 2))
\                                  + s:hex2(25, strpart(a:hexcolor, 5, 2)))
\                                 / 3)
  else
    return hysteric#termcolor#rgb6(s:r6, s:g6, s:b6)
  endif
endfunction

" generate int 25 level mono color.
function! hysteric#termcolor#mono25(level)
  if a:level <= 0
    return 232
  elseif a:level >= 24
    return 231
  else
    return 231 + a:level
  endif
endfunction

" generate int 6 level RGB color.
function! hysteric#termcolor#rgb6(r, g, b)
  return 16 + a:r * 6 * 6 + a:g * 6 + a:b
endfunction

