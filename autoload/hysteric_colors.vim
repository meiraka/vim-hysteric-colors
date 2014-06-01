
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

" generate int 25 level mono color. 0 is darkest color if in 'dark' background mode.
function! hysteric_colors#Mono25(level)
  if &background ==# 'dark'
    if a:level <= 0
      return 232
    elseif a:level >= 24
      return 231
    else
      return 231 + a:level
    endif
  else
    if a:level <= 0
      return 231
    elseif a:level >= 24
      return 232
    else
      return 255 - a:level
    endif
  endif
endfunction

" generate int 6 level RGB color.
function! hysteric_colors#RGB6(r, g, b)
    if &background ==# 'dark'
        return 16 + a:r * 6 * 6 + a:g * 6 + a:b
    else
        function! s:max(ar)
            let m = 0
            for i in a:ar
                if m < i
                    let m = i
                endif
            endfor
            return m
        endfunction

        let m = s:max([a:r, a:g, a:b])
        let rm = 5 - m
        let di =  (rm * 1.0) / (m * 1.0)
        let ret = 0
        return 16 + float2nr(a:r * 6 * 6 * di) + float2nr(a:g * 6 * di) + float2nr(a:b * di)
    endif
endfunction
