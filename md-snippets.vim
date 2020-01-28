"autocmd Filetype markdown map <leader>w yiWi[<esc>ea](<esc>pa)
autocmd filetype markdown inoremap <buffer> \f <esc>/<++><cr>:nohlsearch<cr>"_c4l
autocmd filetype markdown inoremap <buffer> \w <esc>/ <++><cr>:nohlsearch<cr>"_c5l<cr>
autocmd filetype markdown inoremap <buffer> \n ---<enter><enter>
autocmd filetype markdown inoremap <buffer> \b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> \s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> \i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> \d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> \c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> \m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> \p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> \a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> \1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> \2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> \3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> \4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> \l --------<Enter>
