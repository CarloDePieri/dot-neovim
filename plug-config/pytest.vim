"
" KEYMAPS
"
" launch <T>est <S>uite
nnoremap <leader>ts     :w\|Pytest<CR>
" launch <T>est <F>ile
nnoremap <leader>tf     :w\|PytestFile<CR>
" launch <T>est <N>earest
nnoremap <leader>tn     :w\|PytestNearest<CR>
nnoremap <leader>t<leader>     :w\|PytestNearest<CR>
" launch <T>est <R>epeat
nnoremap <leader>tr     :w\|PytestLast<CR>
" relaunch <T>est last failed (<X>)
nnoremap <leader>tx     :w\|PytestLastFailed<CR>
" <T>oggle <T>est results
nnoremap <leader>tt     :w\|PytestToggleError<CR>
" open <T>est <O>utput
nnoremap <leader>to     :w\|PytestOutput<CR>

" Mappings useful for navigating the quickfix windowa (even with only one
" entry)
nnoremap ]q :<C-R>=len(getqflist())==1?"cc":"cn"<CR><CR>
nnoremap [q :<C-R>=len(getqflist())==1?"cc":"cp"<CR><CR>
