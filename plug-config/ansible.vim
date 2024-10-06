" ansible configuration
"
" Use :CocConfig to configure parameters of coc-ansible

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }


au BufRead,BufNewFile ~/dev/ansible/**/*.yml set filetype=yaml.ansible

" augroup ansible_vim_fthosts
  " autocmd!
  " autocmd BufNewFile,BufRead *.yml setfiletype yaml.ansible
" augroup END
