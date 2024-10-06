let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
require'barbar'.setup {
  -- Enable/disable animations
  animation = false,
  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false
}
EOF

" Set colors
augroup barbar_colors
  autocmd!
  autocmd ColorScheme * highlight BufferCurrent guifg='#af0000' gui=bold ctermfg=9 cterm=bold
  autocmd ColorScheme * highlight BufferCurrentMod guifg='#af0000' gui=bold ctermfg=9 cterm=bold
  autocmd ColorScheme * highlight BufferCurrentTarget guifg='#b6f1f' gui=bold ctermfg=196 cterm=bold
augroup END

augroup rc
au!
au TermOpen * setlocal nobuflisted
augroup END

"
" MAPPINGS
"
" Magic buffer-picking mode
nnoremap <silent>    <A-SPACE>  :BufferPick<CR>
" Move to previous/next
nnoremap <silent>    <A-,>      :BufferPrevious<CR>
nnoremap <silent>    <A-.>      :BufferNext<CR>
" Re-order to previous/next     
nnoremap <silent>    <A-<>      :BufferMovePrevious<CR>
nnoremap <silent>    <A->>      :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1>      :BufferGoto 1<CR>
nnoremap <silent>    <A-2>      :BufferGoto 2<CR>
nnoremap <silent>    <A-3>      :BufferGoto 3<CR>
nnoremap <silent>    <A-4>      :BufferGoto 4<CR>
nnoremap <silent>    <A-5>      :BufferGoto 5<CR>
nnoremap <silent>    <A-6>      :BufferGoto 6<CR>
nnoremap <silent>    <A-7>      :BufferGoto 7<CR>
nnoremap <silent>    <A-0>      :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c>      :BufferClose<CR>
