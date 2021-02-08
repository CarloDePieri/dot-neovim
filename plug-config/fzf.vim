" Default command (use ripgrep and ~/.rgignore to filter my files)
let $FZF_DEFAULT_COMMAND = 'rg --files -L --hidden --ignore-file ~/.rgignore'
" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"
" Custom commands leveraging fzf
"
" MRUFzf : File aperti recentemente
command! -bang -nargs=* MRUFzf call fzf#vim#history(fzf#vim#with_preview())
" GFiles : Filter files under git source control
command! -bang -nargs=? -complete=dir GFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

"
" Mappings
"
" Open buffers list
" nnoremap <silent><Enter> :Buffers<cr>
nnoremap <F11> :Buffers<CR>
nnoremap <leader>b :Buffers<CR>
" List files in the cwd
nnoremap <leader>f :Files<CR>
" List files from ~
nnoremap <leader>F :Files ~<CR>
" List files under git
nnoremap <leader>G :GFiles<CR>
" List current marks
nnoremap <leader>m :Marks<CR>
" Git - list commits
nnoremap <C-g>l :Commits<CR>
" Git - list involving current file
nnoremap <C-g>L :BCommits<CR>
" Help 
"  - keybinds and mappings
nnoremap <leader>hk :Maps<CR>
"  - commands
nnoremap <leader>hc :Commands<CR>
"  - help & manuals
nnoremap <leader>hh :Helptags<CR>
