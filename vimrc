set autoindent expandtab ignorecase modeline shiftwidth=4 showmatch wrapscan
set background=dark
highlight OverLength ctermbg=Red  ctermfg=White
match OverLength /\%>78v.\+/
highlight TrailWhiteSpace ctermbg=Red  ctermfg=White
match TrailWhiteSpace /\s\+$/
"
" via http://vim.wikia.com/wiki/Modeline_magic
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

filetype off
set runtimepath+=$GOROOT/misc/vim
filetype indent plugin on
syntax on

