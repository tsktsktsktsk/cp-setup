let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/programming/cp
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +68 main.cpp
badd +1 input.txt
badd +1 output.txt
badd +1 templates/init.cpp
argglobal
%argdel
$argadd ~/programming/cp/
edit main.cpp
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 76 + 67) / 135)
exe '2resize ' . ((&lines * 13 + 14) / 28)
exe 'vert 2resize ' . ((&columns * 58 + 67) / 135)
exe '3resize ' . ((&lines * 12 + 14) / 28)
exe 'vert 3resize ' . ((&columns * 58 + 67) / 135)
argglobal
balt templates/init.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 41 - ((17 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 41
normal! 04|
lcd ~/programming/cp
wincmd w
argglobal
if bufexists(fnamemodify("~/programming/cp/input.txt", ":p")) | buffer ~/programming/cp/input.txt | else | edit ~/programming/cp/input.txt | endif
if &buftype ==# 'terminal'
  silent file ~/programming/cp/input.txt
endif
balt ~/programming/cp/templates/init.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/programming/cp
wincmd w
argglobal
if bufexists(fnamemodify("~/programming/cp/output.txt", ":p")) | buffer ~/programming/cp/output.txt | else | edit ~/programming/cp/output.txt | endif
if &buftype ==# 'terminal'
  silent file ~/programming/cp/output.txt
endif
balt ~/programming/cp/main.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/programming/cp
wincmd w
exe 'vert 1resize ' . ((&columns * 76 + 67) / 135)
exe '2resize ' . ((&lines * 13 + 14) / 28)
exe 'vert 2resize ' . ((&columns * 58 + 67) / 135)
exe '3resize ' . ((&lines * 12 + 14) / 28)
exe 'vert 3resize ' . ((&columns * 58 + 67) / 135)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
