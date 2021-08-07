call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox' 
Plug 'mbbill/undotree'


Plug 'lervag/vimtex'		 " Latex
Plug 'vimwiki/vimwiki'		 " vimwiki

Plug 'preservim/tagbar' 

Plug 'SirVer/ultisnips'

Plug 'tpope/vim-fugitive' " git plugin
Plug 'airblade/vim-gitgutter' 


Plug 'justinmk/vim-sneak' "naviagation
Plug 'wellle/targets.vim' " better text objects
Plug 'mhinz/vim-startify' "start page
Plug 'yinflying/matlab.vim'

Plug 'BrandonRoehl/auto-omni'
call plug#end()
set nocompatible
filetype plugin on
syntax on

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap  
set nu 			   "line no
set clipboard=unnamedplus  " sys cipboard
set hlsearch		   " higlight search
set incsearch          " incremental search
set ignorecase 
set smartcase           " case sensitive if upper keys 
set relativenumber
"set scrolloff=8
set autochdir
set timeoutlen=1000 ttimeoutlen=0 " Fix delay on escape  
set noswapfile " diable swap file
set nobackup " disalbe bacup file

set undodir=~/.config/nvim/undodir     " folder for undoo tree
set undofile                   " folder for undoo tree
let mapleader = " "
let maplocalleader = "," 

set laststatus=2	   " lightline

" Color-scheme
let g:gruvbox_guisp_fallback = "bg"     " spellcheker marking
set background=dark
colorscheme gruvbox 

" ========================= matlab =========================
source $VIMRUNTIME/macros/matchit.vim
filetype indent on
autocmd BufEnter *.m compiler mlint


au BufRead,BufNewFile *.m set filetype=matlab

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype matlab
   \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif

" ========================= Octave =========================
" Octave
"au BufRead,BufNewFile *.m set filetype=octave
"
"" Use keywords from Octave syntax language file for autocomplete
"if has("autocmd") && exists("+omnifunc")
"   autocmd Filetype octave
"   \ if &omnifunc == "" |
"   \ setlocal omnifunc=syntaxcomplete#Complete |
"   \ endif
"endif

" ========================= Latex =========================
" Latex specific settings
autocmd BufNewFile,BufRead *.tex 
   \ set textwidth=79 |
   \ setlocal spell spelllang=en,nb



" Latex settings
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
"let conceallevel=1
"let g:tex_conceal='abdmg'
"

" ========================= Markdown =========================
autocmd BufNewFile,BufRead *.md
   \ set textwidth=79 |

autocmd BufNewFile,BufRead *.tsv 
    \ set shiftwidth=20 | 
    \ set softtabstop=20 | 
    \ set tabstop=20 

" ========================= Vimwiki =========================
" Get ultisnips to work with vimwiki
let g:vimwiki_table_mappings = 0
" markdown as dfault syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" vimwiki colorscheme
hi VimwikiHeader1 ctermfg=10 cterm=Bold
hi VimwikiHeader2 ctermfg=15 cterm=Bold
hi VimwikiHeader3 ctermfg=12 cterm=Bold
hi VimwikiHeader4 ctermfg=15 cterm=Bold
"hi VimwikiHeader5 ctermfg=9 cterm=Bold
"hi VimwikiHeader6 ctermfg=3 cterm=Bold

hi VimwikiHeader5 ctermfg=9 cterm=Bold
hi VimwikiHeader6 ctermfg=4 cterm=Bold
hi VimwikiPre ctermfg=3

"hi markdownH1 ctermfg=5
"hi markdownH2 guifg=#317849 gui=bold
" ========================= Calcurse =========================
" Load markdown in calcurse
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown



" ========================= YouCompleteMe =========================
" ycm settings
set completeopt-=preview                " Hides preview window
let g:ycm_add_pewview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" enable ycm for markdown files
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" enable ycm for latex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" ========================= Ultisnips =========================
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ========================= Startify =========================
" Vim startify
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'w': '~/vimwiki/index.md'}
            \, {'p': '/home/jensjp/vimwiki/Plan/index.md' }
            \, {'m': '/home/jensjp/Sync/FAM/Master/index.md'}
            \ ]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_files_number = 10 
let g:startify_change_to_dir = 0 " autochdir is enabled, not needed
let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

"========================= Etc =========================
" Sneak settings
let g:sneak#use_ic_scs = 1 " case insensitive

" Gitgutter settings
let g:gitgutter_map_keys = 0

" Tagbar
nnoremap <leader>t  :TagbarToggle<CR>
let g:tagbar_position = 'topleft vertical' 
let g:tagbar_width = 50

"================================================== 
" Terminal
"==================================================
autocmd TermOpen term://*:ranger setlocal nonumber norelativenumber " remove line numbering from ranger 
"autocmd TermClose term://*:ranger :q
autocmd TermOpen term://*:tig setlocal nonumber norelativenumber " remove line numbering from ranger 
"autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermOpen term://* startinsert " automatic insert mode when terminal is opened
autocmd BufWinEnter,WinEnter term://* startinsert " automitc insert 



tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


tnoremap <C-h> <left>
tnoremap <C-j> <down>
tnoremap <C-k> <up>
tnoremap <C-l> <right>

tnoremap <C-x> <del>
tnoremap <C-space>n <C-\><C-n>
tnoremap <C-space>l <C-\><C-n>:tabprevious<CR>


nnoremap <leader>x :call chansend(4, "./"@%)

"Use |jobwait()| to check if the terminal job has finished: >
"    let running = jobwait([&channel], 0)[0] == -1
"
"
"    use chansend() instead of jobsend()
"
"
"echo b:terminal_job_id
"
"==================================================
" Keybindings
"==================================================
nnoremap Q !!$SHELL<CR>
nnoremap <bar> !!genius <CR>

nnoremap <leader>s :terminal curl cht.sh/bash/

nnoremap <leader>e :e % <CR>:redraw!<CR> " reload file
" ranger
nnoremap <leader>f :terminal ranger<CR>

" run shell script 
nnoremap <leader>x :call chansend(4, "./" . @% . "\n")

"Exit search
nnoremap <silent> <esc><esc> :noh<return><esc>

" enable spell checker
nnoremap <F10> :set nospell<CR>
nnoremap <F11> :set spell spelllang=en,nb<CR>

" source .vimrc
nnoremap <F12> :source $MYVIMRC<CR>

" Quick fix list
nnoremap <leader>c :copen<CR>
nnoremap <C-c> :cn<CR>
nnoremap <C-x> :cp<CR>


" vimgrep
nnoremap <leader>/ :vimgrep /<c-r>//g ./*<CR>
" Emmet key
"let g:user_emmet_leader_key='<C-F>'
"

" Auto closing bracets
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

"========================= better mappings =========================
" consitenscy
nnoremap Y y$

" keeping it centered
nnoremap n nzz
nnoremap N Nzz
nnoremap J mxJ`x

" set undo breakpoints for , and . 
inoremap , ,<C-g>u
inoremap . .<C-g>u

" set jumplist mark if momvent bigger than 5 (coutn) lines
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"==================================================
" fzf
"==================================================
" fzf mappings
nnoremap <leader>p :Files<CR>
nnoremap <leader>r :Rg!<CR>
nnoremap <leader>g :BLines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <localleader>f :GFiles<CR>

" Use GFiles if inside git repository
"silent! !git rev-parse --is-inside-work-tree
"if v:shell_error == 0
"    nnoremap <leader>p :GFiles<CR>
"else
"    noremap <leader>p :Files<CR>
"endif
"

"========================= Github mappings =========================
" Git fugitive mappings
nnoremap <localleader>g :Git<CR>
nnoremap <localleader>s :Git status<CR>
nnoremap <localleader>p :Git push<CR>
nnoremap <localleader>c :Git commit<CR>
nnoremap <localleader>a :Git add %<CR>
nnoremap <localleader>u :Git add -u<CR>
nnoremap <localleader>h :Git log<CR>
nnoremap <localleader>d :Gdiffsplit<CR>
nnoremap <localleader>r :G reflog<CR>  

" github terminal interface
nnoremap <localleader>t :terminal tig<CR>

"========================= Etc =========================
" Undo tree
nnoremap <silent> <leader>u  :UndotreeToggle<CR>


" Tagbar
nnoremap <leader>t  :TagbarToggle<CR>


" vim sneak
nmap ø <Plug>Sneak_s
nmap Ø <Plug>Sneak_S
" visual-mode
xmap ø <Plug>Sneak_s
xmap Ø <Plug>Sneak_S
" operator-pending-mode
omap ø <Plug>Sneak_s
omap Ø <Plug>Sneak_S
