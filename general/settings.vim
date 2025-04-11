" Default shell
set shell=/bin/bash

" Theme
colorscheme zenburn
" tweaks to the visual background color
hi Visual        guibg=#2f2f2f  ctermbg=235
hi VisualNOS     guibg=#2f2f2f  ctermbg=235
" LSP hints colors
hi DiagnosticHint guifg=#6a828a ctermfg=255

" Python 2 & 3 envs
let g:python3_host_prog = '/home/cik/.virtualenvs/neovim/bin/python'                                                         
let g:python_host_prog = '/home/cik/.virtualenvs/neovim2/bin/python'

" Editor settings
set clipboard+=unnamedplus 			      " Use the system clipboard
set hidden					                  " Allows to open and then close a file without having to write on it
set ruler					                    " Show cursor line and column in status
set tabstop=2 					              " Show tab as 2 spaces
set shiftwidth=2				              " Number of spaces uses for indenting
set softtabstop=2				              " Number of spaces to use when inserting tab
set expandtab                  	      " Convert tabs into spaces
set scrolloff=5                       " Keep n line above/below the cursor when scrolling
set cursorline                        " Hightlight the cursor line
set noshowmode                        " Don't show the current mode (the bar will do this)
set backspace=eol,start,indent        " Backspace behaviour
set whichwrap+=<,>,h,l                " Allows these keys to change line when at the end/at the start
set autoindent                        " copy indent from previous line
set colorcolumn=120                   " Show vertical line at position 120
set mouse=a                           " 'cause why the hell not

" Search related
set ignorecase                        " Ignore casing
set smartcase                         " Don't ignore uppercase
set incsearch                         " Show matches when searching
set hlsearch                          " Keep highlights after searches
set showmatch                         " Highlith for a second the matching delimiter, like brackets

" Better backup, swap and undos storage
set directory=~/.vim/dirs/tmp         " directory to place swap files in
set backupdir=~/.vim/dirs/backups     " where to put backup files
set backup                            " make backup files
set undodir=~/.vim/dirs/undodir       " undo directory
set undofile                          " persistent undos - undo after you re-open the file

" Allows plugins by filetype
filetype plugin on
filetype indent on

" Autocompletion of files and commands behaves like zsh
set wildmenu
set wildmode=full
set wildignore+=*.so,*.pyc,*.png,*.jpg,*.gif
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Jump automatically to the last cursor position in a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
