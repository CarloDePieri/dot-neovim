"
" Custom intepreters, if needed
"
" let g:codi#interpreters = {
      " \ 'python': {
          " \ 'bin': 'python',
          " \ 'prompt': '^\(>>>\|\.\.\.\) ',
          " \ },
      " \ }


" pair filetypes with certain interpreter
let g:codi#aliases = {
      \ '*.py': 'python',
      \ '*.js': 'javascript'
      \ }

" Aesthetic
augroup codi_colors
  autocmd!
  autocmd ColorScheme * highlight CodiVirtualText guifg='#e84f4f' gui=bold ctermfg=1 cterm=bold
augroup END
