" This allows to deploy the config in arbitrary folders
let prefix = "$HOME/.config/nvim/"

" Load plugins
execute "source " . prefix . "vim-plug/plugins.vim"

" Specify this here so that plugins can know about my leader
let mapleader = ","

" Plugins' config files + my settings and keybinds
let config_files = [
      "\ --------- PLUGINS ---------
      \ "plug-config/quickscope.vim",
      \ "plug-config/rnvimr.vim",
      \ "plug-config/nerdcommenter.vim",
      \ "plug-config/barbar.vim",
      \ "plug-config/airline.vim",
      \ "plug-config/indentline.vim",
      \ "plug-config/easymotion.vim",
      \ "plug-config/far.vim",
      \ "plug-config/surround.vim",
      \ "plug-config/fzf.vim",
      \ "plug-config/codi.vim",
      \ "plug-config/coc.vim",
      \ "plug-config/snippets.vim",
      \ "plug-config/test.vim",
      \ "plug-config/pytest-vim-compiler.vim",
      \ "plug-config/grammarous.vim",
      \ "plug-config/markdown.vim",
      \ "plug-config/markdown.vim",
      \ "plug-config/devdocs.vim",
      \ "plug-config/pytest.vim",
      \ "plug-config/projectionist.vim",
      \ "plug-config/debugger.vim",
      \ "plug-config/treesitter.vim",
      "\ --------- SETTINGS ---------
      \ "general/settings.vim",
      \ "general/keybinds.vim",
      \]

for config_file in config_files
  execute  "source " . prefix . config_file
endfor
