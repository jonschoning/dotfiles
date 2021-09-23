call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/camelcasemotion'
Plug 'vmchale/dhall-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/gist.vim'
Plug 'vim-scripts/webapi.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'lukerandall/haskellmode-vim', { 'for': [ 'haskell' ] }  
Plug 'vim-scripts/paredit.vim', { 'for': [ 'scheme', 'lisp', 'commonlisp' ] }
call plug#end()

set t_ti= t_te=
syntax on filetype plugin indent on

set background=dark

" defaults
set autoindent
set backspace=indent,eol,start
set cpoptions+=$
set hidden
set ic
set iskeyword-=\(
set iskeyword-=\)
set iskeyword-=\.
set iskeyword-=-
set preserveindent
set ruler
set scrolloff=1
set showcmd
set smartindent
set splitright splitbelow
set ts=2 sts=2 sw=2 expandtab
set modelines=0
set ttyfast
" set noesckeys
set hls
set cmdheight=1

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" long lines
set nowrap
set lbr

set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8 
set nu

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
set wildmode=list:longest,full " Make the command-line completion show a list
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=_build                           " Sphinx build dir
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store
set wildignore+=*.rdb                            " Redis database file
set wildignore+=*CACHE                           " django compressor cache

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
set foldlevelstart=20
set linespace=0
set nojoinspaces

set path+=**

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

" undo
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" quick esc/:
inoremap jk <esc>

nnoremap <silent> <F1> :bn<CR>
nnoremap <silent> <S-F1> :bp<CR>
nnoremap <silent> <F2> :%y*<CR>
nnoremap <silent> <S-F2> :normal ggdG"*PGgg<CR>
nnoremap <silent> <C-F2> :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <C-S-F2> :setlocal nospell<CR>
nnoremap <silent> <F4> :bd<CR>
nnoremap <silent> <S-F4> :bd!<CR>
nnoremap <silent> <F5> :UndotreeToggle<cr>

" save with ctrl+s
nnoremap <C-S> :w<CR>

" wrapped line navigation
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" leader
let mapleader = " "
let maplocalleader = "\\"

" list buffers
nnoremap <leader>l :ls<CR>

" delete buffer without losing the split window
nnoremap <leader>c :bp\|bd #<CR>

" wipe buffers
nnoremap <silent> <leader>bwa :1,9000bwipeout<cr>

" clear serach
nnoremap <silent> <leader>/ :let @/ = ""<CR>

" focus windows
"noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>
"noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>

" move windows
noremap <M-h> :wincmd H<CR>
noremap <M-l> :wincmd L<CR>
noremap <M-j> :wincmd J<CR>
noremap <M-k> :wincmd K<CR>

" resize windows
noremap <silent> <F9>  :vertical resize -10<CR>
noremap <silent> <F10> :resize -10<CR>
noremap <silent> <F11> :resize +10<CR>
noremap <silent> <F12> :vertical resize +10<CR>

" focus window (only)
nnoremap <leader>o :on<cr>

" Format text (instead of going to Ex mode!)
nnoremap Q gq 

" emacs-style movement in EX Mode
cnoremap <C-a>  <Home>
" cnoremap <C-b>  <Left>
" cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" clipboard paste
noremap <leader>p :silent! set paste<CR>"*P:set nopaste<CR>
noremap <leader>P :silent! set paste<CR>"+P:set nopaste<CR>

" clipboard yank
noremap <leader>y "*y
noremap <leader>Y "+y

" select pasted text
nnoremap <leader>V V`]

" repeat in visual mode
vnoremap . :norm.<CR>

" directory for current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" split line (sister to [J]oin lines)
" the normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" clean trailing whitespace
nnoremap <leader>W ::%s/\s\+$//<cr>:let @/=''<cr>

" toggle `set list`
nnoremap <leader>i :set list!<CR>

" shift-less command
nnoremap <leader>; :

" soft wrapping text
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1


if has("statusline") && !&cp
    set laststatus=2
    set statusline=%f\ %m\ %r
    set statusline+=#%n
    set statusline+=\ C%v
    set statusline+=\ L%l/%L[%p%%]
endif

colorscheme badwolf

if has("autocmd")
  augroup a1
    au!
    au BufEnter * silent! lcd %:p:h    " make working directory always the same as the file you are editing
    au VimEnter * set vb t_vb=         " Stop beeping and flashing!
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif     " Jump to last known location in file

    " check for changes on disk and prompt you to reload | fires after you move the cursor and then let it sit still for updatetime | milliseconds. (Default 4 seconds.)
    au CursorHold <buffer> checktime
    au FileChangedShell * echo "Warning: File changed on disk" " another check for file updates
  augroup end
endif

let g:deoplete#enable_at_startup=1

set tags=tags;/,codex.tags;/

" lambda λ
imap <C-l> <C-k>l*
" right arrow →
imap <C-f> <C-k>->
" left arrow ←k
imap <C-b> <C-k><-
