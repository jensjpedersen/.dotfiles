"       _                    
"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"(_)_/ |_|_| |_| |_|_|  \___|
"
"map pacman ctags - required for tagslist
"aur yc 
" auto install vim-plug
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
" error: line 7 - missing endif
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox' 
"Plug 'itchyny/lightline.vim'	 " Lightline
""Plug 'vim-airline/vim-airline'
""Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" super search
Plug 'junegunn/fzf.vim'					" super search
"Plug 'mbbill/undotree'
""Plug 'vifm/vifm.vim'
Plug 'lervag/vimtex'		 " Latex
Plug 'vimwiki/vimwiki'		 " vimwiki
"Plug 'vim-pandoc/vim-pandoc-syntax' " pandoc syntax
"Plug 'ervandew/supertab'    " supertab (make YCM compatible with UltiSnips)
"Plug 'preservim/tagbar' 
""Plug 'francoiscabrol/ranger.vim'
"" Track the engine.
Plug 'SirVer/ultisnips'
"Plug 'mattn/emmet-vim' " html
Plug 'tpope/vim-fugitive' " git plugin
Plug 'airblade/vim-gitgutter' 
Plug 'christoomey/vim-tmux-navigator' "Navigation between vim and tmux
Plug 'benmills/vimux' "vim tmux compatibility
"Plug 'justinmk/vim-sneak' "naviagation
"Plug 'wellle/targets.vim' " better text objects
Plug 'mhinz/vim-startify' "start page
"Plug 'preservim/nerdtree' 
"Plug 'dbeniamine/cheat.sh-vim' "cheat sheet"
"Plug 'blindFS/vim-taskwarrior' " task manegment
call plug#end()

set nocompatible
filetype plugin on
syntax on

" indenting
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"set textwidth=79

set wildmenu
set nowrap  
set nu 			   "line no
set clipboard=unnamedplus  " sys cipboard
set hlsearch		   " higlight search
set incsearch          " incremental search
set ignorecase 
set smartcase           " case sensitive if upper keys 
set relativenumber
set scrolloff=8
set autochdir


" backup
set noswapfile
set nobackup


set undodir=~/.vim/undodir     " folder for undoo tree
set undofile                   " folder for undoo tree

" Color-scheme
let g:gruvbox_guisp_fallback = "bg"     " spellcheker marking
set background=dark
colorscheme gruvbox 

set laststatus=2	   " lightline


" moved line due to error line 71, undo after test
set timeoutlen=1000 ttimeoutlen=0 " Fix delay on escape  

let mapleader = " "
let maplocalleader = "," 
"" syntax higligthing for ocatave and matlab



au BufRead,BufNewFile *.m set filetype=octave

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype octave
   \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif

" Latex specific settings
autocmd BufNewFile,BufRead *.tex 
   \ set textwidth=79 |
   \ setlocal spell spelllang=en,nb

autocmd BufNewFile,BufRead *.md
   \ set textwidth=79 |

autocmd BufNewFile,BufRead *.tsv 
    \ set shiftwidth=20 | 
    \ set softtabstop=20 | 
    \ set tabstop=20 

"" Enable pandoc syntax in vimwiki
"augroup pandoc_syntax
"  autocmd! FileType vimwiki set syntax=markdown.pandoc
"augroup END

" Load markdown in calcurse
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

" ========================= padoc-syntax settings =========================
"let g:pandoc#syntax#conceal#use=1
"let g:pandoc#syntax#conceal#urls = 1

" ========================= vimwiki settings =========================
" Get ultisnips to work with vimwiki
let g:vimwiki_table_mappings = 0
" markdown as dfault syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"nnoremap gtn <Plug>VimwikiNextTask "standard gnt - fucks with gn commands

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

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" enable ycm for latex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" Latex settings
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
"let conceallevel=1
"let g:tex_conceal='abdmg'

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
let g:startify_files_number = 5 
let g:startify_change_to_dir = 0 " autochdir is enabled, not needed
let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'



" Sneak settings
let g:sneak#use_ic_scs = 1 " case insensitive

" Gitgutter settings
let g:gitgutter_map_keys = 0



" ==================== Keybindings ================================
" Ranger file explorer 
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'

nnoremap Q !!$SHELL<CR>
nnoremap <bar> !!genius <CR>
nnoremap <leader>f :RunSilent ranger<CR>
nnoremap <localleader>t :RunSilent tig<CR>

nnoremap <leader>s :!curl cht.sh/bash/

nnoremap <leader>e :e % <CR>

" Markdown
"nmap <localleader>mm :w<CR>: RunSilent pandoc % -t latex -o %:r.pdf <CR>
"nmap <localleader>ms :w<CR>: RunSilent pandoc % -t beamer -o %:r.pdf <CR> " Make slide show
nmap <localleader>mm :w<CR>:! pandoc % -t latex -o %:r.pdf <CR>
nmap <localleader>ms :w<CR>:! pandoc % -t beamer -o %:r.pdf <CR> " Make slide show
nmap <localleader>mv :w<CR>: RunSilent mupdf %:r.pdf & <CR> 
nmap <localleader>mp :set filetype=pandoc<CR> 
nmap <localleader>mw :set filetype=vimwiki<CR> 

" QR-code
nmap <localleader>qr :w<CR>:! qrencode -r % -o %:r.png<CR>

" enable spell checker
nnoremap <F10> :set nospell<CR>
nnoremap <F11> :set spell spelllang=en,nb<CR>

" source .vimrc
nnoremap <F12> :source $MYVIMRC<CR>

" Emmet key
"let g:user_emmet_leader_key='<C-F>'

"Exit search
nnoremap <silent> <esc><esc> :noh<return><esc>
"
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

" Quick fix list
nnoremap <leader>c :copen<CR>
nnoremap <C-c> :cn<CR>
nnoremap <C-x> :cp<CR>

" vimgrep
nnoremap <leader>/ :vimgrep /<c-r>//g ./*<CR>


" vimwiki bindings
"nunmap <Space>wt 
nnoremap <Leader>wt :VimwikiTable 
"nnoremap <leader>b '' 

" Undo tree
nnoremap <silent> <leader>u  :UndotreeToggle<CR>

" NERD Tree
nnoremap <silent> <leader>a :NERDTreeToggle<CR>

" TaskWarrior
nnoremap <silent> <leader>q :TW<CR>

" Tagbar
nnoremap <leader>t  :TagbarToggle<CR>
let g:tagbar_position = 'topleft vertical' 
let g:tagbar_width = 50

" vim sneak
nmap ø <Plug>Sneak_s
nmap Ø <Plug>Sneak_S
" visual-mode
"xmap ø <Plug>Sneak_s
"xmap Ø <Plug>Sneak_S
" operator-pending-mode
omap ø <Plug>Sneak_s
omap Ø <Plug>Sneak_S


" Tab navigation
"nnoremap <leader>n :tabn<CR>
"nnoremap <C-W>N :tabp<CR>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""resize splits
"nnoremap <C-W-J> :resize -5<CR>
"nnoremap <C-W-K> :resize +5<CR>
"nnoremap <C-W-L> :vertical resize -5<CR>
"nnoremap <C-W-H> :vertical resize +5<CR>


" Auto closing bracets
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

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

