"
" CONFIG
"
lua << EOF
require('gen').setup({
  model = "qwen2.5-coder:14b", -- The default model to use.
  -- model = "qwen2.5-coder:32b", -- more powerfull but much slower
  quit_map = "q", -- set keymap to close the response window
  retry_map = "<c-r>", -- set keymap to re-send the current prompt
  accept_map = "<c-space>", -- set keymap to replace the previous selection with the last result
  host = "localhost", -- The host running the Ollama service.
  port = "11434", -- The port on which the Ollama service is listening.
  display_mode = "horizontal-split", -- The display mode. Can be "float" or "split" or "horizontal-split".
  show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
  show_model = false, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = false, -- Never closes the window automatically.
  file = false, -- Write the payload to a temporary file to keep the command short.
  hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
  -- Make sure that my ollama instance is running
  init = function(options) pcall(io.popen, "sudo systemctl start ollama") end,
  -- Function to initialize Ollama
  command = function(options)
      local body = {model = options.model, stream = true}
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a command string.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  result_filetype = "markdown", -- Configure filetype of the result buffer
  debug = false, -- Prints errors and the command which is run.
  -- These are my custom prompts
  prompts = {
    ask = { prompt = "Regarding the following text, $input:\n$text" },
    chat = { prompt = "$input" },
    generate = {
      prompt = "Take a look at this code: $text \nNow generate code that satisfy this request: $input. Only output the result in format ```$filetype\n...\n```",
      extract = "```$filetype\n(.-)```"
      },
    refactor = {
      prompt = "Refactor the following code:\n```$filetype\n$text\n```\nFollow these instructions: $input. Only output the result in format ```$filetype\n...\n```",
      extract = "```$filetype\n(.-)```"
    },
    docs = {
      prompt = "Given this code: $text \nGenerate proper documentation using reStructuredText inside the comment. Only output the result in format ```$filetype\n...\n```",
      extract = "```$filetype\n(.-)```"
    },
    review = {
      prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
      extract = "```$filetype\n(.-)```"
    },
    explain = {
      prompt = "Explain the following code:\n```$filetype\n$text\n```. Don't explain line by line, but summarize directly what it's doing."
    },
    llama = {
      prompt = "$text\n$input",
      model = "llama3.2-vision:11b"
    },
    think = {
      prompt = "$input",
      model = "deepseek-r1:14b"
    },
    think_with_context = {
      prompt = "Given the following code:\n```$filetype\n$text\n```\n$input",
      model = "deepseek-r1:14b"
    },
    think_deeper = {
      prompt = "$input",
      model = "deepseek-r1:32b"
    },
    think_deeper_with_context = {
      prompt = "Given the following code:\n```$filetype\n$text\n```\n$input",
      model = "deepseek-r1:32b"
    }
  }
})
EOF

"
" MAPS
"
nnoremap <leader>l? :Gen<CR>
vnoremap <leader>l? :Gen<CR>
nnoremap <leader>ll :Gen ask<CR>
vnoremap <leader>ll :Gen ask<CR>
nnoremap <leader>la :Gen ask<CR>
vnoremap <leader>la :Gen ask<CR>
vnoremap <leader>lr :Gen refactor<CR>
vnoremap <leader>lR :Gen review<CR>
nnoremap <leader>lg :Gen generate<CR>
nnoremap <leader>lc :Gen chat<CR>
nnoremap <leader>ld :Gen docs<CR>
vnoremap <leader>ld :Gen docs<CR>
nnoremap <leader>le :Gen explain<CR>
vnoremap <leader>le :Gen explain<CR>
nnoremap <leader>lt :Gen think_with_context<CR>
vnoremap <leader>lt :Gen think_with_context<CR>
