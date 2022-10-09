setl efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
noremap <buffer> <leader>m  :w<cr>:make<cr>:cwindow<cr>
noremap <buffer> <leader>mm :!clear;echo;echo <c-r>=expand('%!r')<cr> \| xargs java<cr>
