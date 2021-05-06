"
"
" ADAPTERS
"
" :VimspectorInstall will install these
let g:vimspector_install_gadgets = [ 'debugpy' ]


"
" MAPPINGS
"
let g:vimspector_enable_mappings = 'MINE'  " This reset vimspector mappings

nmap <F3>                 <Plug>VimspectorStop
nmap <F4>                 <Plug>VimspectorRestart

nmap <F5>                 <Plug>VimspectorContinue
nmap <leader><F5>         :VimspectorReset<CR>

nmap <F6>                 <Plug>VimspectorPause

nmap <F9>                 <Plug>VimspectorToggleBreakpoint
nmap <leader><F9>         <Plug>VimspectorToggleConditionalBreakpoint

nmap <F8>                 <Plug>VimspectorRunToCursor
nmap <leader><F8>         <Plug>VimspectorAddFunctionBreakpoint

nmap <F10>                <Plug>VimspectorStepOver
nmap <F11>                <Plug>VimspectorStepInto
nmap <F12>                <Plug>VimspectorStepOut


command! -bar  
      \ VimspectorLaunch
      \ call vimspector#Launch()



" Example of .vimspector.json
"
" {
"   "configurations": {
"     "Tests: Launch": {
"       "adapter": "debugpy",
"       "breakpoints": {
"         "exception": {
"           "raised": "",
"           "caught": "",
"           "uncaught": "Y"
"         }
"       },
"       "configuration": {
"         "name": "Tests: Launch",
"         "type": "python",
"         "request": "launch",
"         "cwd": "/home/cik/scratch",
"         "python": "/home/cik/scratch/.venv/bin/python",
"         "stopOnEntry": true,
"         "debugOptions": [],
"         "program": "/home/cik/scratch/.venv/bin/pytest"
"       }
"     }
"   }
" }
