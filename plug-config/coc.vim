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
" coc-sh            Intellisense for bash
" coc-markdownlint  Linting for markdown
" coc-yaml          Intellisense for yaml
" coc-css           Css autocompletion
" coc-toml          Toml support
" coc-ultisnips     Provide ultisnips source
"
" HOW TO CHANGE PYTHON SEVERITY
" https://github.com/microsoft/pyright/blob/master/docs/configuration.md#type-check-diagnostics-settings
"
"""

let g:coc_global_extensions = [
      \"coc-pyright",
      \"coc-json",
      \"coc-browser",
      \"coc-sh",
      \"coc-markdownlint",
      \"coc-yaml",
      \"coc-css",
      \"coc-toml",
      \"coc-ultisnips"
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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Jump between errors and warnings
nmap <silent> <leader>E <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> to navigate autocompletion lists
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
endif








"
" MULTICURSOR MODE
"
" Keep hitting Alt+m for jumping and selecting next word
nmap <expr> <silent> <M-m> <SID>select_current_word()
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

