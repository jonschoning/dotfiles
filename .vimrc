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
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'kien/ctrlp.vim' 
Bundle 'wincent/Command-T' 
Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'wlangstroth/vim-racket'
Bundle 'derekwyatt/vim-scala'
Bundle 'mikewest/vimroom'
Bundle 'mattn/zencoding-vim'
" Bundle 'vim-scripts/YankRing.vim'
" vimscripts on vim.org
Bundle 'Gist.vim'
Bundle 'WebAPI.vim'
Bundle 'matchit.zip'
Bundle 'hexHighlight.vim'
Bundle 'terryma/vim-multiple-cursors'

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

 " Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

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
set linespace=-2
set nojoinspaces

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
 
" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" quick esc/:
inoremap jk <esc>


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

" Save with CTRL+S
nnoremap <C-S> :w<CR>

" Moving through wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" leader mappings
let mapleader = " "
let maplocalleader = "\\"

" Wipe out all buffers
nmap <silent> <leader>bwa :1,9000bwipeout<cr>

" quickly switch between popular (and unpopular) tab modes
nnoremap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nnoremap <leader>M :set noexpadtab tabstop=8 soft=4 shiftwidth=4<CR>
nnoremap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Clear current serach 
nnoremap <silent> <leader>/ :let @/ = ""<CR>

" window focusing
noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>

" window moving
noremap <M-h> :wincmd H<CR>
noremap <M-l> :wincmd L<CR>
noremap <M-j> :wincmd J<CR>
noremap <M-k> :wincmd K<CR>

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

" Insert blank lines without going into insert mode
nnoremap gt o<ESC>k
nnoremap gT O<ESC>j

" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" open .vimrc window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w


" only
nnoremap <leader>o :on<cr>

 " Clean trailing whitespace
nnoremap <leader>W ::%s/\s\+$//<cr>:let @/=''<cr>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>ort<CR>:noh<CR>

" Sort CSS properties
nnoremap <leader><C-s> ?{<CR>jV/^\s*\}?$<CR>k:s

" pasting
noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
noremap <leader>P :silent! set paste<CR>"*P:set nopaste<CR>
"
" Select entire buffer
" nnoremap vaa ggvGg_
" nnoremap Vaa ggVG

" reselect the text that was just pasted
nnoremap <leader>V V`]

" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" quick cmd
nnoremap <leader>; :

command! -nargs=* Wrap set wrap lbr nolist " soft wrapping text
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" exec "set path=".escape(escape(expand("%:p:h"), ' '), '\ ')

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

 " By Tim Pope
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" mapping to open URL under cursor
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.duckduckgoog.com/?q=<cword><CR>

if has("autocmd")
  au BufEnter * silent! lcd %:p:h    " make working directory always the same as the file you are editing
  au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved
  au VimEnter * set vb t_vb=         " Stop beeping and flashing!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif     " Jump to last known location in file

  " Resize splits when the window is resized
  au VimResized * :wincmd =

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  " au FileType markdown setlocal ai comments=n:> spell

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
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
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
       set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

    " Disable all blinking:
    set guicursor+=a:blinkon0
else
    set nocursorline
    set background=dark
endif
if has("gui_running") || $TERM == "xterm" || $TERM == "xterm-color" || $TERM == "screen-color" || $TERM == "xterm-color-256" || $TERM == "screen-256color"
    set t_Co=256
    colorscheme badwolf
endif

let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 1
let g:Powerline_colorscheme = 'badwolf'

let g:EasyMotion_leader_key = '\'
