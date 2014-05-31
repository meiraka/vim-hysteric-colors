
" apply color to label
"TODO: Generates 256 color based 16, 24bit color
function! hysteric_colors#Apply (label, background, forguround)
  exec "hi " . a:label . " guifg=#000000 guisp=#000000 gui=NONE" . " ctermbg=" . a:background . " ctermfg=" . a:forguround " cterm=NONE"
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
