"
" SETTINGS
"
let g:far#enable_undo=1     " Enable undos
let g:far#source="rg"       " Use ripgrep as backend
let g:far#glob_mode = 'rg'  " Use rg and its glob mode to select files

let g:far#default_file_mask = '*'

set lazyredraw              " improve scrolling performance when navigating through large results
set ignorecase smartcase    " ignore case only when the pattern contains no capital letters

"
" MAPPINGS
"
nnoremap <silent> <leader>/ :Farf<cr>
nnoremap <silent> <leader>? viw:Farf<cr>
vnoremap <silent> <leader>/ :Farf<cr>

nnoremap <silent> <leader>. viw:Farrh<cr>
vnoremap <silent> <leader>. :Farrh<cr>
nnoremap <silent> <leader>> viw:Farr<cr>
vnoremap <silent> <leader>> :Farr<cr>
" nnoremap <leader>. :*/<c-r>=expand("%:t")<cr><home>Far <c-r>=expand("<cword>")<cr>  <left>
" vnoremap <leader>. y:*/<c-r>=expand("%:t")<cr><home>Far <c-r>0  <left>

command! -complete=customlist,far#FarArgsComplete -nargs=* -range=-1 Farr
      \  let g:far#default_file_mask = '*' |
      \  call FarModePrompt(<count>,<line1>,<line2>,1,<q-args>)

command! -complete=customlist,far#FarArgsComplete -nargs=* -range=-1 Farrh
      \  let g:far#default_file_mask = '*/'.expand('%:t') |
      \  call FarModePrompt(<count>,<line1>,<line2>,1,<q-args>) |
      \  let g:far#default_file_mask = '*'

" FAR MAPPINGS              EXPLANATION
" ---------------------------------------------------------------------------------------------------------------------
" exclude                   Exclude item under the cursor.
" include                   Include item under the cursor.
" toggle_exclude            Toggle item exclusion under the cursor.
" stoggle_exclude           Smartly toggle item exclusion under the cursor: exclude all items when all are excluded, 
"                             otherwise exclude all items.
" exclude_all               Exclude all items.
" include_all               Include all items.
" toggle_exclude_all        Toggle exclusion for all items.
" stoggle_exclude_all       Smartly toggle exclusion for all items: include all items when all are excluded, 
"                             otherwise exclude all items.
" jump_to_source            Jump to the source code of the item under the cursor.  See |far-jump|
" open_preview              Open preview window (if not) and scroll to the item under the cursor.  See |far-preview|
" close_preview             Close preview window.  See |far-preview|
" preview_scroll_up         Scroll preview window up (if open).  See |far-preview|, |g:far#preview_window_scroll_step|
" preview_scroll_down       Scroll preview window down (if open).  See |far-preview|, 
"                             |g:far#preview_window_scroll_step|
" expand                    Expand node under the cursor.
" collapse                  Collapse node under the cursor.
" toggle_expand             Toggle node expanding under the cursor.
" stoggle_expand_all        Smartly toggle exclusion for all nodes: expand all nodes when all are collapsed, otherwise 
"                             collapse all nodes.
" expand_all                Expand all nodes.
" collapse_all              Collapse all nodes.
" toggle_expand_all         Toggle exclusion for all nodes.
" replace_do                Execute |:Fardo|<CR>, to replace all included items.
" replace_undo              Execute |:Farundo|<CR>, to undo the last replacement by |:Fardo|.
" replace_undo_all          Execute |:Farundo| --all=1<CR>, to undo all replacements by |:Fardo|.  For param '--all=' 
"                             see |farundo-params|.
" quit                      Close searching result buffer and its preview buffer (if exists)
"
let g:far#mapping = {
      \ 'exclude' : ["x"],
      \ 'include' : ["i"],
      \ 'toggle_exclude' : ["t"],
      \ 'stoggle_exclude' : ["f"],
      \ 'exclude_all' : ["X"],
      \ 'include_all' : ["I"],
      \ 'toggle_exclude_all' : ["T"],
      \ 'stoggle_exclude_all' : ["F"],
      \ 'jump_to_source' : ["<CR>"],
      \ 'open_preview' : ["p"],
      \ 'close_preview' : ["P"],
      \ 'preview_scroll_up' : ["J"],
      \ 'preview_scroll_down' : ["K"],
      \ 'expand' : ["zo"],
      \ 'collapse' : ["zc"],
      \ 'toggle_expand' : ["za", "<tab>"],
      \ 'stoggle_expand_all' : ["zs", "<s-tab>"],
      \ 'expand_all' : ["zr"],
      \ 'collapse_all' : ["zm"],
      \ 'toggle_expand_all' : ["zA"],
      \ 'replace_do' : ["s"],
      \ 'replace_undo' : ["u"],
      \ 'replace_undo_all' : ["U"],
      \ 'quit' : ["q"]
      \}

" PROMPT MAPPINGS
" ----------------------------------------------------------------------
" The sub-dictionary has two keys: 'key' is used to set key mappings and
" 'prompt' is displayed in the mode status bar of |Farr| and |Farf|.
"
let g:far#prompt_mapping = {
      \ 'quit'           : { 'key' : '<esc>', 'prompt' : 'Esc' },
      \ 'regex'          : { 'key' : '<c-x>', 'prompt' : '^X'  },
      \ 'case_sensitive' : { 'key' : '<c-a>', 'prompt' : '^A'  },
      \ 'word'           : { 'key' : '<c-w>', 'prompt' : "^W"  },
      \ 'substitute'     : { 'key' : '<c-f>', 'prompt' : '^F'  },
      \ }
