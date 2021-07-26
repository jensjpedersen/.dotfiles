nnoremap <leader>s :!curl cht.sh/python/

" Run python
nnoremap <leader>x :w<CR>:!python %<CR>

"nnoremap <leader>j :w<CR>:silent !echo "python %" > /tmp/vimpipe <CR>:redraw!<CR>
"nnoremap <leader>c :w<CR>:silent !echo "clear" > /tmp/vimpipe <CR>:redraw!<CR>
"nnoremap <leader>k :w<CR>:RunSilent kill $(pgrep -f "python %") <CR>

"vimux mappings
nnoremap <Leader>vp :w<CR>:VimuxPromptCommand<CR>
nnoremap <Leader>vl :w<CR>:VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vk :VimuxInterruptRunner<CR>
nnoremap <leader>vj :w<CR>:VimuxRunCommand("python " . bufname("%"))<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>
nnoremap <Leader>vc :VimuxClearTerminalScreen<CR>

"go to def
nnoremap <silent> <Leader>d  :YcmCompleter GoTo<CR>
