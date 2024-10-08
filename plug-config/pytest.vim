"
" KEYMAPS
"
" launch <T>est <S>uite
nnoremap <leader>ts     :w\|Pytest<CR>
" launch <T>est <F>ile
nnoremap <leader>tf     :w\|PytestFile<CR>
" launch <T>est <N>earest
nnoremap <leader>tn     :w\|PytestNearest<CR><CR>
nnoremap <leader>t<leader>     :w\|PytestNearest<CR><CR>
" launch <T>est <R>epeat
nnoremap <leader>tr     :w\|PytestLast<CR>
" relaunch <T>est last failed (<X>)
nnoremap <leader>tx     :w\|PytestLastFailed<CR>
" <T>oggle <T>est results
nnoremap <leader>tt     :w\|PytestToggleError<CR>
" open <T>est <O>utput
nnoremap <leader>to     :w\|PytestOutput<CR>
" launch <T>est <C>lear
nnoremap <leader>tc     :w\|PytestClear<CR>

" Mappings useful for navigating the quickfix window (even with only one
" entry)
nnoremap ]q :<C-R>=len(getqflist())==1?"cc":"cn"<CR><CR>
nnoremap [q :<C-R>=len(getqflist())==1?"cc":"cp"<CR><CR>

" let g:pytest_xml_file="/tmp/junit.xml"
" let g:pytest_airline_section="b"
" let g:pytest_airline_icon="PT"
" let g:pytest_airline_separator_icons=[')', '(']
