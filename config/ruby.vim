function! s:OpenTest()
  silent! execute 'vsp'
  silent! execute 'A'
endfunction
command! OT call s:OpenTest()
nnoremap <leader>ot :OT<CR>
