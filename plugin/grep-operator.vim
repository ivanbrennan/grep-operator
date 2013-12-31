nnoremap <Leader>g :set operatorfunc=GrepOperator<CR>g@
vnoremap <Leader>g :<C-U>call GrepOperator(visualmode())<CR>

function! GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction
