lua << EOF
local dap, dapui = require("dap"), require("dapui")

-- debugger adapter configurations
dap.adapters.gdb = {
  type = "executable",
  command = "/usr/bin/gdb",
  args = { "--interpreter=dap",  "--quiet", "--eval-command", "set print pretty on" }
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Launch and stop",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}

-- estetics of debugger signs
vim.cmd("hi DapBreakpoint guifg=#fa4848")
vim.cmd("hi DapLogPoint guifg=#61afef")
vim.cmd("hi DapStopped guifg=#98c379")
vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- open dapui automatically
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- config the dapui layout
dapui.setup {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.35,
        },
        {
          id = "watches",
          size = 0.25,
        },
        {
          id = "breakpoints",
          size = 0.15,
        },
        {
          id = "stacks",
          size = 0.25,
        },
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "repl",
          size = 1,
        },
      },
      position = "bottom",
      size = 10,
    },
  },
}
EOF


" Debug maps
nmap <F4> :lua require'dap'.terminate()<CR>

nmap <F5> :lua require'dap'.continue()<CR>
nmap <leader><F5> :lua require'dap'.restart()<CR>

nmap <F6> :lua require'dap'.run_to_cursor()<CR>
nmap <F7> :lua require'dap'.step_over()<CR>
nmap <F8> :lua require'dap'.step_into()<CR>
nmap <leader><F8> :lua require'dap'.step_out()<CR>

nmap <F9> :lua require'dap'.toggle_breakpoint()<CR>
nmap <leader><F9> :lua require'dap'.set_breakpoint('')<left><left>

" evaluate whats under the cursor and show the result (for a more permanent
" usage, usa a watch expression)
nnoremap <leader>dd :lua require'dapui'.eval()<cr>
vnoremap <leader>dd <Cmd>lua require'dapui'.eval()<CR>
