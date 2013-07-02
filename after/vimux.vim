if exists('$TMUX')
  autocmd FileType coffee map <Leader>ts :call RunVimTmuxCommand("clear; bundle exec jasmine-headless-webkit ".bufname("%")."\n")<CR>
  autocmd FileType coffee map <Leader>ta :call RunVimTmuxCommand("clear; bundle exec jasmine-headless-webkit\n")<CR>
  autocmd FileType javascript map <Leader>ts :call RunVimTmuxCommand("clear; bundle exec jasmine-headless-webkit ".bufname("%")."\n")<CR>
  autocmd FileType javascript map <Leader>ta :call RunVimTmuxCommand("clear; bundle exec jasmine-headless-webkit\n")<CR>
  autocmd FileType ruby map <leader>ts :RunRubyFocusedTest<CR>
  autocmd FileType ruby map <leader>tf :RunAllRubyTests<CR>
  autocmd FileType ruby map <leader>ta :call RunVimTmuxCommand("clear; bundle exec rspec\n")<CR>
  autocmd FileType cucumber map <Leader>ts :RunFocusedCuke<CR>
  autocmd FileType cucumber map <Leader>ta :RunAllCukes<CR>
  autocmd FileType cucumber nmap <Leader>tf :call RunVimTmuxCommand("clear; bundle exec cucumber ".bufname("%")."\n")<CR>
endif

" Run test with debugger once
autocmd FileType ruby map <leader>wtf Orequire 'ruby-debug'; debugger;<ESC> :w<CR> :RunRubyFocusedTest<CR>kdd :sleep 2<CR> :w<CR>

" Re-run last command
map <leader>tr :call RunVimTmuxCommand("clear; !!\n")<CR>

" Close pane
map <leader>cp :CloseVimTmuxPanes<CR>

" Prompt command
map <leader>vp :VimuxPromptCommand<CR>

let g:VimuxHeight = "30"
