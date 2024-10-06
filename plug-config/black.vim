let g:black#settings = {
    \ 'fast': 1,
\}

augroup PythonAutoSave
  autocmd!
  autocmd BufWritePre *.py :silent exec ":Black"
augroup END
