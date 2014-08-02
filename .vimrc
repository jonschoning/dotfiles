set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" github
Bundle 'tpope/vim-fugitive'
Bundle 'goldfeld/vim-seek'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'wincent/Command-T'
Bundle 'airblade/vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'derekwyatt/vim-scala'
Bundle 'wting/rust.vim'
Bundle 'oscarh/vimerl'
Bundle 'elixir-lang/vim-elixir'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'

Bundle 'tpope/vim-projectionist.git'

Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-leiningen'

Bundle 'mxw/vim-jsx'


" Bundle 'mikewest/vimroom'
" Bundle 'bilalq/lite-dfm'
Bundle 'PProvost/vim-ps1'
" Bundle 'mattn/zencoding-vim'
" Bundle 'terryma/vim-multiple-cursors'
Bundle 'Shougo/vimproc.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/unite.vim'

Bundle 'Shougo/neocomplete.vim'

Bundle 'eagletmt/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'travitch/hasksyn'
Bundle 'Twinside/vim-haskellFold'
" Bundle 'Twinside/vim-haskellConceal'
" Bundle 'bitc/vim-hdevtools'

" Bundle 'raichoo/haskell-vim'
Bundle 'raichoo/purescript-vim'
Bundle 'idris-hackers/idris-vim'

Bundle "jnwhiteh/vim-golang"
" Bundle 'nosami/Omnisharp'
" Bundle 'vim-scripts/YankRing.vim'

" vim.org
Bundle 'Gist.vim'
Bundle 'WebAPI.vim'
Bundle 'matchit.zip'
Bundle 'hexHighlight.vim'
Bundle 'pig.vim'

Bundle 'majutsushi/tagbar'
" Bundle 'taglist.vim'

Bundle 'vim-scripts/clipbrd'
Bundle 'vim-scripts/genutils'
Bundle 'vim-scripts/autoclose--alves'
Bundle 'multvals.vim'


filetype plugin indent on
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" defaults
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
set ts=2 sts=2 sw=2 expandtab
set modelines=0
set ttyfast
set noesckeys

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

" encryption
set cryptmethod=blowfish

set nu
set rnu

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
set foldlevelstart=20
set linespace=0
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

" undo
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" quick esc/:
inoremap jk <esc>

" function keys
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
nnoremap <silent> <F9> :cwin <bar> cn<CR>
nnoremap <silent> <S-F9> :cwin <bar> cp<CR>
" nnoremap <silent> <F10> :TlistToggle<CR>
nnoremap <silent> <F10> :TagbarToggle<CR>
nnoremap <silent> <F11> :RainbowParenthesesToggle<CR>
nnoremap <silent> <F12> g<C-]>

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

" tab modes
" nnoremap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
" nnoremap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
" nnoremap <leader>M :set noexpadtab tabstop=8 soft=4 shiftwidth=4<CR>
" nnoremap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" clear serach
nnoremap <silent> <leader>/ :let @/ = ""<CR>

" focus windows
noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>

" move windows
noremap <M-h> :wincmd H<CR>
noremap <M-l> :wincmd L<CR>
noremap <M-j> :wincmd J<CR>
noremap <M-k> :wincmd K<CR>

" resize windows
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize -10<CR>
noremap <silent> <C-F11> :resize +10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>

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

" insert blank line
nnoremap gt o<ESC>k
nnoremap gT O<ESC>j

" directory for current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" split line (sister to [J]oin lines)
" the normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" clean trailing whitespace
nnoremap <leader>W ::%s/\s\+$//<cr>:let @/=''<cr>

" sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>ort<CR>:noh<CR>

" sort css
nnoremap <leader><C-s> ?{<CR>jV/^\s*\}?$<CR>k:s

" toggle `set list`
nnoremap <leader>i :set list!<CR>

" shift-less command
nnoremap <leader>; :

" soft wrapping text
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" open url under cursor
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
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.duckduckgoog.com/?q=<cword><CR>

if has("autocmd")
  au BufEnter * silent! lcd %:p:h    " make working directory always the same as the file you are editing
  au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved
  au VimEnter * set vb t_vb=         " Stop beeping and flashing!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif     " Jump to last known location in file

  " resize splits when the window is resized
  au VimResized * :wincmd =

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  " au FileType markdown setlocal ai comments=n:> spell

  au BufNewFile,BufRead *.cshtml setlocal filetype=html
  au BufNewFile,BufRead *.build set ft=xml
  au BufNewFile,BufRead *.targets set ft=xml
  au BufNewFile,BufRead *.xaml set ft=xml
  au BufNewFile,BufRead *.vssettings set ft=xml
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
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 

  " au FileType haskell nnoremap <buffer> <F10> :TagbarToggle<CR>

  " au FileType haskell nnoremap <buffer> <F12> :HdevtoolsType<CR>
  " au FileType haskell nnoremap <buffer> <silent> <S-F12> :HdevtoolsClear<CR>
  " au FileType haskell nnoremap <buffer> <silent> <C-F12> :HdevtoolsInfo<CR>

  au FileType haskell nnoremap <buffer> <F12> :GhcModType<CR>
  au FileType haskell nnoremap <buffer> <silent> <S-F12> :GhcModTypeClear<CR>
  " au FileType haskell nnoremap <buffer> <silent> <C-F12> :HdevtoolsInfo<CR>

  au FileType haskell ia <buffer> un undefined
  au FileType haskell set formatprg=xargs\ -0\ pointfree
  au FileType haskell setlocal omnifunc=necoghc#omnifunc
  au FileType haskell NeoCompleteEnable
	au FileType haskell inoremap <expr><Tab>  neocomplete#start_manual_complete()
  au FileType haskell compiler ghc
  " au FileType haskell set formatprg=pointful

  " Highlighting the current line & column in VIM
  " au WinLeave * set nocursorline nocursorcolumn
  " au WinEnter * set cursorline cursorcolumn
  " set cursorline cursorcolumn

  "use docx2txt.pl to allow VIm to view the text content of a .docx file directly.
  autocmd BufReadPre *.docx set ro
  autocmd BufReadPost *.docx %!docx2txt.pl 
endif


if has("statusline") && !&cp
    " always show the status bar
    set laststatus=2

    set statusline=%f\ %m\ %r
    set statusline+=#%n
    set statusline+=\ C%v
    set statusline+=\ L%l/%L[%p%%]
endif

if has("gui_running")
    " gui options
    set guioptions=egt
    set cursorline
    set background=light
    " set clipboard=unnamed
    if has('win32')
        set guifont=Monaco-js:h9:cANSI
    else
       set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

    " disable all blinking:
    set guicursor+=a:blinkon0
else
    set nocursorline
    set background=dark
endif
if has("gui_running") || $TERM == "xterm" || $TERM == "xterm-color" || $TERM == "screen-color" || $TERM == "xterm-color-256" || $TERM == "screen-256color" || $TERM == "putty-256color"
    set t_Co=256
    colorscheme badwolf
endif

let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 1
let g:Powerline_colorscheme = 'badwolf'

let g:EasyMotion_leader_key = '\'
let g:loaded_zipPlugin= 1
let g:loaded_zip      = 1  

" let g:syntastic_auto_loc_list=1
map <silent> <Leader>E :Errors<CR>
" map <Leader>S :SyntasticToggleMode<CR>
" let g:syntastic_haskell_checkers = ["ghc_mod","hlint"]
let g:syntastic_haskell_checkers = ["hlint"]
let g:haddock_browser="surf"
nnoremap <leader>pf :set formatprg=xargs\ -0\ pointfree<CR>
nnoremap <leader>pl :set formatprg=xargs\ -0\ pointful<CR>

if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif

" let g:ghcmod_ghc_options = ['-fdefer-type-errors']
