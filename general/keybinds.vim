let mapleader = ","

nmap \ <leader>
nmap \\ <leader><leader>
vmap \ <leader>
vmap \\ <leader><leader>

inoremap jk <Esc>
inoremap jj <Esc>

cmap w!! w !sudo tee > /dev/null %

" I am too lazy to take my hands from shift
command! WQ wq
command! Wq wq
command! W w

" Use cltl-a and ctrl-k in command mode
cnoremap <C-A> <Home>
cnoremap <C-k> <C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>

"
" Navigation
"
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

nnoremap gg mpgg
nnoremap G mpG

"
" Windows managing
"
nnoremap <silent><Leader>v :vsplit\|:Startify<cr>
nnoremap <silent><Leader>h :sp\|:Startify<cr>
nnoremap <silent><Leader>1 :only<CR>
nnoremap <silent><Leader>0 <C-w>c
nnoremap <C-w>1 :only<CR>
nnoremap <C-w>2 :sp\|:Startify<cr>
nnoremap <C-w>3 :vsplit\|:Startify<cr>
nnoremap <C-w>0 <C-w>c
nmap <leader>2 <C-w>2
nmap <leader>3 <C-w>3

nnoremap <A-Q> :qa<CR>
nnoremap Q :Sayonara<CR>
cnoreabbrev wq w<bar>Sayonara
cnoreabbrev q Sayonara
cnoreabbrev Sayonara! :Sayonara<CR>s

" I hate the command window
nnoremap <leader>: q:
nnoremap q: :q

"
" Text morphing
"
" Simple replace
vnoremap <leader>R y:%s/<C-r><C-r>"//gic<Left><Left><Left><Left>
nnoremap <leader>R viwy:%s/<C-r><C-r>"//gic<Left><Left><Left><Left>

" better indentation change
vnoremap > >gv
vnoremap < <gv

" Move lines and vlines
nnoremap <m-k> :m .-2<CR>==
nnoremap <m-j> :m .+1<CR>==
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
