" Trigger quickscope when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Customize first and second character occurrence colors
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=196 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=208 cterm=underline
augroup END

" Disable quickscope in certain windows
let g:qs_buftype_blacklist = ['terminal', 'nofile']
