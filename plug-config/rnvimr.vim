" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Customize the initial layout to be bigger
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.9 * &columns)),
            \ 'height': float2nr(round(0.9 * &lines)),
            \ 'col': float2nr(round(0.05 * &columns)),
            \ 'row': float2nr(round(0.025 * &lines)),
            \ 'style': 'minimal'
            \ }

tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
nnoremap <silent> <M-z> :RnvimrToggle<CR>
tnoremap <silent> <M-z> <C-\><C-n>:RnvimrToggle<CR>
