" TODO BROKEN

function! dispatch#complete(file, ...) abort
  if !dispatch#completed(a:file)
    let request = s:request(a:file)
    let request.completed = 1
    try
      let status = readfile(request.file . '.complete', 1)[0]
    catch
      let status = -1
      call writefile([-1], request.file . '.complete')
    endtry
    if has_key(request, 'aborted')
      let label = 'Aborted:'
      let barColor = 'red'
    elseif status > 0
      let label = 'Failure:'
      let barColor = 'red'
    elseif status == 0
      let label = 'Success:'
      let barColor = 'green'
    else
      let label = 'Complete:'
      let barColor = 'green'
    endif
    if !a:0
      silent doautocmd ShellCmdPost
    endif
    if !request.background && !get(request, 'aborted')
      call s:cwindow(request, 0, status, '', 'make')
      redraw!
    endif
    " echo label '!'.request.expanded s:postfix(request)
    let output = label . ' !'.request.expanded . ' ' . s:postfix(request)
    call s:Bar(barColor, output)
    if !a:0
      checktime
    endif
  endif
  return ''
endfunction

hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=white guibg=green
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red

function s:Bar(type, msg)
  if a:type == "red"
    echohl RedBar
  else
    echohl GreenBar
  endif
  echon a:msg repeat(" ", &columns - strlen(a:msg) - 1)
  echohl None
endfunction
