
let g:projectionist_heuristics = {}

" A modern python poetry project with tests
let python_poetry = {
      \ "pyproject.toml": {
      \ "src/*.py": {"alternate": "tests/{dirname}/test_{basename}.py"},
      \ "tests/**/test_*.py": {"type": "test", "alternate": "src/{}.py"},
      \ },
      \ "Makefile": {
      \ "src/*.c": {"alternate": "src/include/{basename}.h"},
      \ "src/libs/*.c": {"alternate": "src/include/{basename}.h"},
      \ "src/include/*.h": {"type": "header", "alternate": ["src/{}.c", "src/libs/{}.c"]},
      \ },
      \ }
call extend(g:projectionist_heuristics, python_poetry)

"
" KEYBINDS
"
nnoremap <A-8> :A<CR>
