let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dragon
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +194 core/code/future/cloud/common/src/cmcmntrace.c
badd +36 core/code/future/fsap2/pthreads/utltrc.c
badd +194 core/code/future/syslog/src/cmslgcusmz.c
badd +97 core/code/future/inc/fssyslog.h
badd +608 core/code/future/syslog/src/syslog.c
badd +217 core/code/cameo/cdd/src/cmcddapi.c
badd +27 core/code/future/syslog/inc/slogdefs.h
badd +79 core/code/future/syslog/inc/slogtdfs.h
badd +676 core/code/future/syslog/src/cmsyslogset.c
argglobal
%argdel
$argadd core/code/future/syslog/src/syslog.c
edit core/code/future/cloud/common/src/cmcmntrace.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=2
setlocal nofen
let s:l = 212 - ((78 * winheight(0) + 61) / 122)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
212
normal! 0
lcd ~/dragon/core/code
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
