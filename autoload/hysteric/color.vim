" returns Color object(tuple of rgb, 24bit)
function! hysteric#color#from_hex(hexcolor)
  let s:r = str2nr(strpart(a:hexcolor, 1, 2), 16)
  let s:g = str2nr(strpart(a:hexcolor, 3, 2), 16)
  let s:b = str2nr(strpart(a:hexcolor, 5, 2), 16)
  return [s:r, s:g, s:b]
endfunction

" returns string hexed color like #FFFFFF
function! hysteric#color#to_hex(color)
  let s:rs = printf("%02x", a:color[0])
  let s:gs = printf("%02x", a:color[1])
  let s:bs = printf("%02x", a:color[2])
  return "#" . s:rs . s:gs . s:bs
endfunction

" returns brightness
function! hysteric#color#brightness(color)
  return max(a:color)
endfunction

" returns apply brightness
" 
" require 42 or birght value to change term color.
function! hysteric#color#add_brightness(color, brightness)
  let [s:r, s:g, s:b] = a:color
  return [hysteric#color#part_rounding(s:r + a:brightness),
\         hysteric#color#part_rounding(s:g + a:brightness),
\         hysteric#color#part_rounding(s:b + a:brightness)]
endfunction

" rounding 24 bit color
function! hysteric#color#part_rounding(color_part)
  if a:color_part < 0
    return 0
  elseif 255 < a:color_part
    return 255
  else
    return a:color_part
  endif
endfunction
