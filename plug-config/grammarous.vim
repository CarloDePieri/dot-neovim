"
" DEPENDENCIES
"
" Java 8+ for running LanguageTool (which is used for the actual analysis).

" MAPPINGS
" ---------------------------------------------------------------------
" q	            Quit the info window
" <CR>	        Move to the location of the error
" f	            Fix the error automatically
" r	            Remove the error without fix
" R	            Disable the grammar rule in the checked buffer
" n	            Move to the next error's location
" p	            Move to the previous error's location
" ?	            Show help of the mapping in info window

"
" SETTINGS
"

" This will use grammarous only in comments, markdown or vim-help files
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }

" This control additional rules
let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}
