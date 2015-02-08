function! hysteric#hexcolor#add_brightness(hexcolor, brightness)
  let s:old = hysteric#color#from_hex(a:hexcolor)
  let s:new = hysteric#color#add_brightness(s:old, a:brightness)
  return hysteric#color#to_hex(s:new)
endfunction


