" Load plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

" Specify this here so that plugins can know about my leader
let mapleader = ","

" Config plugins
source $HOME/.config/nvim/plug-config/quickscope.vim                              " Show char when using f, t, etc
source $HOME/.config/nvim/plug-config/rnvimr.vim                                  " Ranger integration.
source $HOME/.config/nvim/plug-config/nerdcommenter.vim                           " Comment code
source $HOME/.config/nvim/plug-config/barbar.vim                                  " Tabs
source $HOME/.config/nvim/plug-config/airline.vim                                 " Graphic bottom status bar
source $HOME/.config/nvim/plug-config/indentline.vim                              " Show indentetion vertical bars
source $HOME/.config/nvim/plug-config/easymotion.vim                              " Move quickly
source $HOME/.config/nvim/plug-config/far.vim                                     " Search and replace
source $HOME/.config/nvim/plug-config/surround.vim                                " Surround words with characters
source $HOME/.config/nvim/plug-config/fzf.vim                                     " Fzf inside vim!
source $HOME/.config/nvim/plug-config/codi.vim                                    " REPL
source $HOME/.config/nvim/plug-config/coc.vim                                     " Autocompletion

" General settings, functions and autocmd
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybinds.vim
