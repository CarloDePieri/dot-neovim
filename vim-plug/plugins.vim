call plug#begin('~/.vim/plugged')

" Aesthetic
Plug 'jnurmine/Zenburn'                                   " color scheme
Plug 'vim-airline/vim-airline'                            " airline
Plug 'vim-airline/vim-airline-themes'                     " airline themes
Plug 'ryanoasis/vim-devicons'                             " Icons
Plug 'kyazdani42/nvim-web-devicons'                       " More icons

" Fzf
Plug 'junegunn/fzf', {'dir': '~/.vim/plugged/fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Functionality
Plug 'mhinz/vim-startify'                                 " A fancy start page for vim
Plug 'kevinhwang91/rnvimr'                                " Ranger integration. Needs yay -S python-pynvim ueberzug
Plug 'romgrk/barbar.nvim'                                 " Tabs
Plug 'brooth/far.vim'                                     " Search and replace
Plug 'Yggdroot/indentLine'                                " Show indent as vertical lines
Plug 'kshenoy/vim-signature'                              " Show marks in the gutter
Plug 'airblade/vim-gitgutter'                             " Git diff icons in gutter
Plug 'vim-scripts/restore_view.vim'                       " Restore file pointer on file open
Plug 'airblade/vim-rooter'                                " auto change dir to project root
Plug 'Konfekt/vim-CtrlXA'                                 " Use ctrl-X/A to toggle values
Plug 'metakirby5/codi.vim'                                " REPL
Plug 'neoclide/coc.nvim', {'branch': 'release'}           " Autocompletion
Plug 'SirVer/ultisnips'                                   " Snippet engine (needs coc-ultisnips coc extension)
Plug 'honza/vim-snippets'                                 " Snippets
Plug 'tpope/vim-dispatch'                                 " job async dispatcher, used primarily for tests
Plug 'reinh/vim-makegreen'                                " Run sync make with visual feedback
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }           " Intelligently close windows


" Movement
Plug 'unblevable/quick-scope'                             " Show char when using f, t, etc
Plug 'easymotion/vim-easymotion'                          " Fast jumping
Plug 'romainl/vim-cool'                                   " Disable hlsearch when done searching \ no more :noh

" Morph code
Plug 'tpope/vim-repeat'                                   " Allows . to work with certain surround commands
Plug 'tpope/vim-surround'                                 " Surround
Plug 'scrooloose/nerdcommenter'                           " Easy comment code
Plug 'jiangmiao/auto-pairs'                               " Autopair

" Language specific
Plug 'kevinoid/vim-jsonc'                                 " Json with comments
Plug 'cespare/vim-toml'                                   " toml syntax highlights
Plug 'CarloDePieri/pytest-vim-compiler'                   " Pytest :compiler
Plug 'rhysd/vim-grammarous'                               " English grammar
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " Markdown browser preview

" Vim
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

call plug#end()


" TODO
"
" snippets
" supertab
"
" https://github.com/tpope/vim-projectionist              project structure
"                                                           and alternate files
"
" https://github.com/alvan/vim-closetag
"
" https://github.com/puremourning/vimspector              debugger
" https://github.com/vim-test/vim-test                    test runner
"
" https://github.com/pearofducks/ansible-vim
" https://github.com/Glench/Vim-Jinja2-Syntax
"
"
" TODO MAYBE
" Something like tagbar
" chadtree
" goyo + limelight
" vim grammarous
"
