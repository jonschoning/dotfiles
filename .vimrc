""" Setup Vundle BEGIN (https://github.com/gmarik/vundle) """
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-characterize'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/ctrlp.vim' 
Bundle 'wlangstroth/vim-racket'
" vimscripts on vim.org
Bundle 'Gist.vim'
Bundle 'WebAPI.vim'
Bundle 'matchit.zip'

filetype plugin indent on     " required!
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""" Setup Vundle END """

"set defaults
set autoindent
set backspace=indent,eol,start
set cpoptions+=$
set encoding=utf-8
set hidden
set ic
set iskeyword-=\(
set iskeyword-=\)
set iskeyword-=\.
set preserveindent
set ruler
set scrolloff=1
set showcmd
set smartindent
set splitright splitbelow
set ts=4 sts=4 sw=4 expandtab
set modelines=0
set ttyfast
set noesckeys
set timeoutlen=500

" long line handling
set nowrap
set lbr

set nobackup
set nowritebackup
set noswapfile

set number

set autoread         " Automatically read a file that has changed on disk
set browsedir=buffer " Maki GUI File Open use current directory
set diffopt+=iwhite  " Add ignorance of whitespace to diff
set history=100      " Keep some stuff in the history
set lazyredraw       " Don't update the display while executing macros
set mousehide        " Hide the mouse pointer while typing
set ssop-=folds      " do not store folds
set ssop-=options    " do not store global and local values in a session
set synmaxcol=500    " Syntax coloring lines that are too long just slows down the world
set virtualedit=all  " Allow the cursor to go in to invalid places
set wildmenu         " Make the command-line completion better
set wildmode=list:longest " Make the command-line completion show a list

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds

" searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set gdefault
set showmatch
set smartcase
nnoremap <tab> %
vnoremap <tab> %

" syntax
syntax enable
syntax on


" quick esc/:
inoremap jk <esc>

" quickly switch between popular (and unpopular) tab modes
nmap \t :set expandab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpadtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" function key mappings
nnoremap <silent> <F1> :bn<CR>
nnoremap <silent> <S-F1> :bp<CR>
nnoremap <silent> <F2> :%y*<CR>
nnoremap <silent> <S-F2> :normal ggdG"*PGgg<CR>
nnoremap <silent> <C-F2> :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <C-S-F2> :setlocal nospell<CR>
nnoremap <silent> <F4> :bd<CR>
nnoremap <silent> <S-F4> :bd!<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <S-F5> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
nnoremap <silent> <F8> :cwin <bar> cn<CR>
nnoremap <silent> <S-F8> :cwin <bar> cp<CR>
nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <silent> <F10> :RainbowParenthesesToggle<CR>

nnoremap <silent> <F12> <c-]>
nnoremap <silent> <C-k><C-r> g]

" Moving around through wrapped lines
vmap <M-j> gj
vmap <M-k> gk
vmap <M-4> g$
vmap <M-6> g^
vmap <M-0> g^
nmap <M-j> gj
nmap <M-k> gk
nmap <M-4> g$
nmap <M-6> g^
nmap <M-0> g^

" leader mappings
let mapleader = " "
let maplocalleader = "\\"

" Wipe out all buffers
nmap <silent> <leader>bwa :1,9000bwipeout<cr>

" window focusing
noremap <space>h :wincmd h<CR>
noremap <space>l :wincmd l<CR>
noremap <space>j :wincmd j<CR>
noremap <space>k :wincmd k<CR>

" window moving
noremap <space>H :wincmd H<CR>
noremap <space>L :wincmd L<CR>
noremap <space>J :wincmd J<CR>
noremap <space>K :wincmd K<CR>

" window resizing
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize -10<CR>
noremap <silent> <C-F11> :resize +10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>

" nudge screen up/down w/ cursor in center
nnoremap zk kzz
nnoremap zj jzz

" Emacs-style movement keys on command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Underline the current line
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

" Insert blank lines without going into insert mode
nnoremap gt o<ESC>k
nnoremap gT O<ESC>j

" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>


" open .vimrc window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" only
nnoremap <leader><leader> :on<cr>

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Quick wrap paragraph
nnoremap <leader>q gqip

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Quick open vertical split
nnoremap <leader>w <C-w>v<C-w>l

" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" quick cmd
nnoremap <leader>; :

command! -nargs=* Wrap set wrap lbr nolist " soft wrapping text
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" exec "set path=".escape(escape(expand("%:p:h"), ' '), '\ ')

if has("autocmd")
  au BufEnter * silent! lcd %:p:h    " make working directory always the same as the file you are editing
  au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved
  au VimEnter * set vb t_vb=         " Stop beeping and flashing!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif     " Jump to last known location in file

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal ai comments=n:> spell

  au BufNewFile,BufRead *.cshtml setlocal filetype=html
  au BufNewFile,BufRead *.build set ft=xml
  au BufNewFile,BufRead *.targets set ft=xml
  au BufNewFile,BufRead *.xaml set ft=xml
  au BufNewFile,BufRead *.json setlocal ft=javascript

  au FileType cs set commentstring=//%s   " use single-line comments for .cs
  au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m " Quickfix mode: command line msbuild error format

  " check for changes on disk and prompt you to reload | fires after you move the cursor and then let it sit still for updatetime | milliseconds. (Default 4 seconds.)
  au CursorHold <buffer> checktime
  au FileChangedShell * echo "Warning: File changed on disk" " another check for file updates

  au VimEnter * RainbowParenthesesToggle
endif

if has("statusline") && !&cp
    set laststatus=2  " always show the status bar

    " Start the status line
    set statusline=%f\ %m\ %r

    " Finish the statusline
    set statusline+=#%n
    set statusline+=\ C%v
    set statusline+=\ L%l/%L[%p%%]
endif

if has("gui_running")
    " set gui options
    set guioptions=egt
    set cursorline
    set background=light
    " set clipboard=unnamed
    if has('win32')
        set guifont=Monaco-js:h9:cANSI
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
    endif

    " Disable all blinking:
    set guicursor+=a:blinkon0
else
    set nocursorline
    set background=dark
endif
if has("gui_running") || $TERM == "xterm" || $TERM == "xterm-color || $TERM == xterm-color-256"
    set t_Co=256
    colorscheme herald
endif
