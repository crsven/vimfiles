let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"
let VimuxResetSequence = "q C-u C-l"

let g:VimuxSporkCommand = ""

if exists('$TMUX')
  " Test commands for various filetypes
  autocmd FileType coffee map <Leader>ts :call VimuxRunCommand("bundle exec rake spec:javascript SPEC=".bufname("%")."\n")<CR>
  autocmd FileType coffee map <Leader>ta :call VimuxRunCommand("bundle exec rake spec:javascript\n")<CR>
  "autocmd FileType javascript map <Leader>ts :call VimuxRunCommand("bundle exec rake spec:javascript SPEC=".bufname("%")."\n")<CR>
  "autocmd FileType javascript map <Leader>ts :call VimuxRunJasmineSpec()<CR>
  "autocmd FileType javascript map <Leader>ts :call VimuxRunJestTest()<CR>
  autocmd FileType javascript map <Leader>ts :call VimuxRunKonachaSpec()<CR>
  "autocmd FileType javascript map <Leader>ts :call VimuxRunCommand("rake spec:javascript SPEC=".bufname("%")."\n")<CR>
  "autocmd FileType javascript map <Leader>ta :call VimuxRunCommand("rake spec:javascript\n")<CR>
  autocmd FileType javascript map <Leader>ta :call VimuxRunCommand("rake konacha:run\n")<CR>
  "autocmd FileType javascript map <Leader>ta :call VimuxRunCommand("npm test\n")<CR>
  autocmd FileType ruby map <leader>ts :RunRubyFocusedTest<CR>
  "autocmd FileType ruby map <Leader>ts :call VimuxRunCommand("bundle exec rspec ".bufname("%")."\n")<CR>
  "autocmd FileType ruby map <Leader>ts :call VimuxRunCommand("bundle exec rescue rspec ".bufname("%").":".line('.')."\n")<CR>
  autocmd FileType ruby map <leader>tf :RunAllRubyTests<CR>
  autocmd FileType ruby map <leader>ta :call VimuxRunCommand("bundle exec rspec\n")<CR>
  autocmd FileType cucumber map <Leader>ts :RunFocusedCuke<CR>
  autocmd FileType cucumber map <Leader>ta :RunAllCukes<CR>
  autocmd FileType cucumber nmap <Leader>tf :call VimuxRunCommand("bundle exec cucumber ".bufname("%")."\n")<CR>

  " Get current Cane status
  map <Leader>tc :call VimuxRunCommand("bundle exec cane --style-measure 80 --style-glob ".bufname("%")." --abc-max 1 --abc-glob ".bufname("%")."\n")<CR>

  " Rebuild Mavn
  map <Leader>bm :call VimuxRunCommand("mvn package -Dmaven.test.skip=true")<CR>
  map <Leader>cm :call VimuxRunCommand("mvn install -Dmaven.test.skip=true")<CR>

  " Re-run last command
  map <leader>tr :VimuxRunLastCommand<CR>

  " Close pane
  map <leader>cp :VimuxCloseRunner<CR>

  " Prompt command
  map <leader>vp :VimuxPromptCommand<CR>

  " Run last command with debugger once
  "autocmd FileType ruby map <leader>wtf Orequire 'ruby-debug'; debugger;<ESC>:w<CR>:VimuxRunLastCommand<CR>dd :sleep 8<CR> :w<CR>
  autocmd FileType ruby map <leader>wtf :call VimuxRerunWithDebugger()<CR>

  function! VimuxRunJestTest()
    call VimuxRunCommand("npm test -- ".bufname("%")."\n")
  endfunction

  function! VimuxRerunWithDebugger()
    call append(line(".")-1, "")
    let debugCommand = _VimuxOption("g:VimuxDebugCommand", "debugger")
    call setline(line(".")-1, debugCommand)
    write
    call VimuxRunLastCommand()
    .-1d " Delete debug line above
    let s:fake=input("Press Enter to save once tests are running.") " Require user input
    write
    unlet s:fake
  endfunction

  function! VimuxRunKonachaSpec()
    call VimuxRunCommand("rake konacha:run SPEC=public/".expand("%:t:r")."\n")
  endfunction

  function! VimuxRunJasmineSpec()
    let specname = matchstr(getline(1), "['\"].*['\"]")
    call VimuxRunCommand("rake spec:javascript SPEC=".specname."\n")
  endfunction

  " Interact with currently running REPL
  " n for next
  " c for continue
  " e to return
  " p to prompt for command and send
  map <leader>dn :call VimuxSendText('n')<CR> :call VimuxSendKeys("Enter")<CR>
  map <leader>dc :call VimuxSendText('c')<CR> :call VimuxSendKeys("Enter")<CR>
  map <leader>de :call VimuxSendKeys("Enter")<CR>
  map <leader>dp :call VimuxSendPromptText()<CR>

  function! VimuxSendPromptText()
    let l:command = input(_VimuxOption("g:VimuxPromptString", "Text to send? "))
    call VimuxSendText(l:command)
    call VimuxSendKeys("Enter")
  endfunction
endif
