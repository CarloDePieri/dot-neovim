nmap s ysiw

"
" Special surrounds
"

" Surround a word like this "{{ word }}" . This is a jinja 2 template
nmap sj ysiw{vf}S"lvf}S}w
nmap dsj ds{ds}ds"
vmap sj d:normal! i"{{  }}"<CR>hhhhp

" Surround with < or >
nmap s< ysiw<>lxi <esc>f<xxi <esc>b
nmap s> ysiw<>lxf<xxb
nmap ds> F<xf>xb
nmap ds< F<xxf>xhxb
