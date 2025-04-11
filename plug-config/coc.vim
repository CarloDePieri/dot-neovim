"
" DEPENDS ON
" 
" watchman - for workspace file monitoring (like from aur/watchman-bin)
"
" Python
" rope - python library for code action like variable extraction
" autopep - formatting
"
" HOW TO EXTENSIONS
"
" List extensions
" :CocList extensions
"
" Install extensions
" :CocInstall coc-json
"
" Configuration file is in .config/coc/extensions     
" 
" CURRENTYL INSTALLED EXTENSIONS
"
" coc-pyright           Intellisense for python
" coc-json              Intellisense for json
" coc-browser           Use the browser as autocompletion source
" coc-sh                Intellisense for bash
" coc-markdownlint      Linting for markdown
" coc-yaml              Intellisense for yaml
" coc-css               Css autocompletion
" coc-toml              Toml support
" coc-ultisnips         Provide ultisnips source
" coc-clangd            Intellisense for c/c++
"
" HOW TO CHANGE PYTHON SEVERITY
" https://github.com/microsoft/pyright/blob/master/docs/configuration.md#type-check-diagnostics-settings
"
"""

let g:coc_global_extensions = [
      \"coc-pyright",
      \"coc-json",
      \"coc-sh",
      \"coc-browser",
      \"coc-markdownlint",
      \"coc-css",
      \"coc-toml",
      \"coc-clangd",
      \"coc-ultisnips",
      \"coc-yaml",
      \"@yaegassy/coc-ansible",
      \"@yaegassy/coc-intelephense"
      \]

"
" SETTINGS
"

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes







"
" AESTHETICS
"
" TODO NOT WORKING Background for multicursor and renames
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2 ctermbg=2

" Fix selected item background in completion menu
autocmd VimEnter,ColorScheme * hi! link CocMenuSel PMenuSel
autocmd VimEnter,ColorScheme * hi! link CocSearch Identifier






"
" COMMANDS
"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

augroup coc_group
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end







"
" MAPPINGS
"

" Highlight the symbol and its references when holding the cursor. TODO shortcut?
autocmd CursorHold * silent call CocActionAsync('highlight')

" Jump between errors and warnings
nmap <silent> <leader>E <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> to navigate autocompletion lists
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" format selected code
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Apply code action to the current selection
nmap <leader>a  <Plug>(coc-codeaction)

" Remap keys for applying codeAction to the current buffer.
vmap <leader>ac  <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>al <Plug>(coc-codelens-action)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" List errors, symbols, outline
"
" Show commands.
nnoremap <silent><nowait> <leader>le :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>ls :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>lo :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>lc  :<C-u>CocList commands<cr>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


"
" MULTICURSOR MODE
"
" Keep hitting Alt+m for jumping and selecting next word
nnoremap <expr> <silent> <M-m> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
" Hit Alt+, to toggle the current word selection (usefull to skip occurence)
nmap <silent> <M-,> <Plug>(coc-cursors-word)

" Rename symbol with multicursor
nnoremap <silent> <leader>R :call CocActionAsync('runCommand', 'document.renameCurrentWord'):nohlsearch<cr>
