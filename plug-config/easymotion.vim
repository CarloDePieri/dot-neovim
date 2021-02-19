"
" Settings
"
let g:EasyMotion_smartcase = 1              " Ignore casing
let g:EasyMotion_enter_jump_first = 1       " Jump to the first match with enter / space

"
" Mappings
"
" Replace vim search
nmap  / <Plug>(easymotion-sn)
omap  / <Plug>(easymotion-sn)
nmap  ? <Plug>(easymotion-sn)
" My preferred jump shortcut
map  <space> <Plug>(easymotion-sn)
" Keep n and N compatible
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" 2char, but jumps over windows
nmap <M-space> <Plug>(easymotion-overwin-f2)
