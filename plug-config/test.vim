" Set the right compiler for pytest
augroup vimrc_python
  au!
  au FileType python compiler! pytest
augroup END


" let test#strategy = {
  " \ 'nearest': 'dispatch',
  " \ 'file':    'dispatch',
  " \ 'suite':   'dispatch',
" \}
" let test#python#pytest#options = {
  " \ 'nearest': '--vim-quickfix',
  " \ 'file':    '--format documentation',
  " \ 'suite':   '--tag ~slow',
" \}
" let test#python#runner = 'pytest'
" " let g:dispatch_compilers = {}
" " let g:dispatch_compilers['pytest'] = 'pytest'
" "
" function! EchoStrategy(cmd)
  " echo 'It works! Command for running tests: ' . a:cmd
" endfunction

" let g:test#custom_strategies = {'echo': function('EchoStrategy')}
" let g:test#strategy = 'echo'
