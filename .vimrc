"set defaults
set nocompatible
set encoding=utf-8
set ts=4 sts=4 sw=4 expandtab
set lbr
set autoindent
set smartindent
set preserveindent
set nowrap
set ic
set showcmd
set showmatch
set ignorecase
set smartcase
set ruler
set nocompatible
set splitright splitbelow
set scrolloff=1
set hidden
set backspace=indent,eol,start
set cpoptions+=$
set t_Co=256
set iskeyword-=\.
set iskeyword-=\(
set iskeyword-=\)

set nobackup
set nowritebackup
set noswapfile

set number

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set lazyredraw       " Don't update the display while executing macros
set wildmenu         " Make the command-line completion better
set synmaxcol=2048   " Syntax coloring lines that are too long just slows down the world
set mousehide        " Hide the mouse pointer while typing
set history=100      " Keep some stuff in the history
set virtualedit=all  " Allow the cursor to go in to invalid places
set diffopt+=iwhite  " Add ignorance of whitespace to diff
set autoread         " Automatically read a file that has changed on disk
set browsedir=buffer " Maki GUI File Open use current directory

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds

" syntax
syntax enable
syntax on

" pathogen
call pathogen#infect()
filetype plugin indent on

" quick esc
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
nnoremap <silent> <F10> :call <SID>SynStack()<CR>
nnoremap <silent> <F12> <c-]>
nnoremap <silent> <C-k><C-r> g]

" disable keys
map <left>  :echo "no!"<cr>
map <right> :echo "no!"<cr>
map <up>    :echo "no!"<cr>
map <down>  :echo "no!"<cr>
inoremap <esc> <nop>
nnoremap <c-n> <nop>
nnoremap <c-p> <nop>
nnoremap <CR> :noh<CR><CR>

" Moving around through wrapped lines
vmap <C-j> gj
vmap <C-k> gk
vmap <C-4> g$
vmap <C-6> g^
vmap <C-0> g^
nmap <C-j> gj
nmap <C-k> gk
nmap <C-4> g$
nmap <C-6> g^
nmap <C-0> g^

" leader mappings
let mapleader = " "
let maplocalleader = "\\"

" Wipe out all buffers
nmap <silent> <leader>bwa :1,9000bwipeout<cr>

" window focusing
noremap <leader>h :wincmd h<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>

" window moving
noremap <leader>H :wincmd H<CR>
noremap <leader>L :wincmd L<CR>
noremap <leader>J :wincmd J<CR>
noremap <leader>K :wincmd K<CR>

" window resizing
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize -10<CR>
noremap <silent> <C-F11> :resize +10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>

" nudge screen up/down w/ cursor in center
nnoremap zk kzz
nnoremap zj jzz

" Better comand-line editing
cnoremap <C-j> <left>
cnoremap <C-k> <right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" use sane regexes
nnoremap / /\v
vnoremap / /\v

" Underline the current line
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

" Insert blank lines without going into insert mode
nnoremap gt o<ESC>k
nnoremap gT O<ESC>j

" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" open .vimrc window
nnoremap <leader>vv :vsp $MYVIMRC<cr>

" switch to alternate file
nnoremap <leader><leader> <c-^>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" Load matchit plugin
so ~/.vim/plugin/matchit.vim

if has("gui_running")
    " set gui options
    set guioptions=egt
    set cursorline
    set background=light
    set clipboard=unnamed
    if has('win32')
        set guifont=Monaco-js:h9:cANSI
    else
        set guifont=Monaco 11
    endif
else
    set nocursorline
    set background=dark
endif

colorscheme railscasts

if has("statusline") && !&cp
    set laststatus=2  " always show the status bar

    " Start the status line
    set statusline=%f\ %m\ %r

    " Finish the statusline
    set statusline+=#%n  
    set statusline+=\ C%v
    set statusline+=\ L%l/%L[%p%%]
endif

if has("autocmd")
  au BufEnter * silent! lcd %:p:h    " make working directory always the same as the file you are editing
  au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved
  au VimEnter * set vb t_vb=         " Stop beeping and flashing!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif     " Jump to last known location in file

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal ai comments=n:> spell

  au BufNewFile,BufRead *.cshtml setlocal filetype=html
  au BufNewFile,BufRead *.build set ft=xml
  au BufNewFile,BufRead *.json setlocal ft=javascript

  au FileType cs set commentstring=//%s   " use single-line comments for .cs
  au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m " Quickfix mode: command line msbuild error format 

  " check for changes on disk and prompt you to reload | fires after you move the cursor and then let it sit still for updatetime | milliseconds. (Default 4 seconds.)
  au CursorHold <buffer> checktime
  au FileChangedShell * echo "Warning: File changed on disk" " another check for file updates
endif

command! -nargs=* Wrap set wrap linebreak nolist " soft wrapping text
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" exec "set path=".escape(escape(expand("%:p:h"), ' '), '\ ') 

" CamelCaseMotion
map <silent> <A-w> <Plug>CamelCaseMotion_w
map <silent> <A-b> <Plug>CamelCaseMotion_b
omap <silent> i<A-w> <Plug>CamelCaseMotion_iw
xmap <silent> i<A-w> <Plug>CamelCaseMotion_iw
omap <silent> i<A-b> <Plug>CamelCaseMotiojn_ib
xmap <silent> i<A-b> <Plug>CamelCaseMotion_ib
