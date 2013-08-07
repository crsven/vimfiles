let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"
let VimuxResetSequence = "q C-u C-l"

if exists('$TMUX')
  " Test commands for various filetypes
  autocmd FileType coffee map <Leader>ts :call RunVimTmuxCommand("bundle exec jasmine-headless-webkit ".bufname("%")."\n")<CR>
  autocmd FileType coffee map <Leader>ta :call RunVimTmuxCommand("bundle exec jasmine-headless-webkit\n")<CR>
  autocmd FileType javascript map <Leader>ts :call RunVimTmuxCommand("bundle exec jasmine-headless-webkit ".bufname("%")."\n")<CR>
  autocmd FileType javascript map <Leader>ta :call RunVimTmuxCommand("bundle exec jasmine-headless-webkit\n")<CR>
  autocmd FileType ruby map <leader>ts :RunRubyFocusedTest<CR>
  autocmd FileType ruby map <leader>tf :RunAllRubyTests<CR>
  autocmd FileType ruby map <leader>ta :call RunVimTmuxCommand("bundle exec rspec\n")<CR>
  autocmd FileType cucumber map <Leader>ts :RunFocusedCuke<CR>
  autocmd FileType cucumber map <Leader>ta :RunAllCukes<CR>
  autocmd FileType cucumber nmap <Leader>tf :call RunVimTmuxCommand("bundle exec cucumber ".bufname("%")."\n")<CR>

  " Get current Cane status
  map <Leader>tc :call RunVimTmuxCommand("bundle exec cane --abc-max 1 --abc-glob ".bufname("%")."\n")<CR>

  " Re-run last command
  map <leader>tr :VimuxRunLastCommand<CR>

  " Close pane
  map <leader>cp :VimuxCloseRunner<CR>

  " Prompt command
  map <leader>vp :VimuxPromptCommand<CR>

  " Run last command with debugger once
  "autocmd FileType ruby map <leader>wtf Orequire 'ruby-debug'; debugger;<ESC>:w<CR>:VimuxRunLastCommand<CR>dd :sleep 8<CR> :w<CR>
  autocmd FileType ruby map <leader>wtf :call VimuxRerunWithDebugger()<CR>

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
