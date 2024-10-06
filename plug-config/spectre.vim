" Open search windows
nnoremap <leader>. <cmd>lua require("spectre").toggle()<CR>

" Search visual word
vnoremap <leader>/ <esc><cmd>lua require("spectre").open_visual()<CR>

" Search current word
nnoremap <leader>/ <cmd>lua require("spectre").open_visual({select_word=true})<CR>

" Search current word in current file
nnoremap <leader>? <cmd>lua require("spectre").open_file_search({select_word=true})<CR>
