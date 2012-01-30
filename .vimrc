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
"
" swp files are annoying. Let's hope vim doesn't crash
set nobackup
set nowritebackup
set noswapfile

" make tilde an operator
"set tildeop

" do not store global and local values in a session
set ssop-=options
" do not store folds
set ssop-=folds 

" Don't update the display while executing macros
set lazyredraw
" Make the command-line completion better
set wildmenu

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
" Hide the mouse pointer while typing
set mousehide
" Keep some stuff in the history
set history=100
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" Allow the cursor to go in to "invalid" places
set virtualedit=all
" Add ignorance of whitespace to diff
set diffopt+=iwhite
" Automatically read a file that has changed on disk
set autoread

" Maki GUI File Open use current directory
set browsedir=buffer

set number
"
" sometimes causes performance issues
" set relativenumber

syntax enable
syntax on

" pathogen
call pathogen#infect()
filetype plugin indent on

" mappings
nnoremap <CR> :noh<CR><CR>
inoremap jk <esc>

" disable cursor keys in normal mode
map <left>  :echo "no!"<cr>
map <right> :echo "no!"<cr>
map <up>    :echo "no!"<cr>
map <down>  :echo "no!"<cr>

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

" disable esc, ctrl-n, ctrl-p
inoremap <esc> <nop>
nnoremap <c-n> <nop>
nnoremap <c-p> <nop>

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

" Make Y behave like other capitals
map Y y$

" use sane regexes
" nnoremap / /\v
" vnoremap / /\v

" quick-macro mapping
nnoremap <leader>a @a

" quick ls
nnoremap <leader>ls :ls<CR>

" Underline the current line with '='
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>

" Underline the current line with '-'
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> <leader>sw :execute ":resize " . line('$')<cr>

" Insert blank lines without going into insert mode
nnoremap t o<ESC>k
nnoremap T O<ESC>j

" go to middle of line
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>


" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Digraphs
" Alpha
imap <c-l><c-a> <c-k>a*
" Beta
imap <c-l><c-b> <c-k>b*
" Gamma
imap <c-l><c-g> <c-k>g*
" Delta
imap <c-l><c-d> <c-k>d*
" Epslion
imap <c-l><c-e> <c-k>e*
" Lambda
imap <c-l><c-l> <c-k>l*
" Eta
imap <c-l><c-y> <c-k>y*
" Theta
imap <c-l><c-h> <c-k>h*
" Mu
imap <c-l><c-m> <c-k>m*
" Rho
imap <c-l><c-r> <c-k>r*
" Pi
imap <c-l><c-p> <c-k>p*
" Phi
imap <c-l><c-f> <c-k>f*

" Fix constant spelling mistakes
iab teh       the
iab Teh       The

" open .vimrc window
nnoremap <leader>vv :vsp $MYVIMRC<cr>

" switch to alternate file
nnoremap <leader><leader> <c-^>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Hide common hidden files
let g:netrw_list_hide = '.*\.py[co]$,\.git$,\.swp$'

" Load matchit plugin
so ~/.vim/plugin/matchit.vim

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
  "
  " Add fugitive
  set statusline+=%{fugitive#statusline()}

  " Add taglist
  set statusline+=[%{Tlist_Get_Tagname_By_Line()}]
endif

set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)

" Execute python file being edited
if has('win32')
    function! ReadPyResults_shell()
        exe join(['w | !c:\Python27\python.exe ', expand('%:p')])
    endfunction
    function! ReadPyResults_buffer()
        exe join(['w | new | setl bt=nofile | r !c:\Python27\python.exe ', expand('%:p')])
    endfunction
else
    function! ReadPyResults_shell()
        exe join(['w | !/usr/bin/env python ', expand('%:p')], '')
    endfunction
    function! ReadPyResults_buffer()
        exe join(['w | new | setl bt=nofile | r !/usr/bin/env python ', expand('%:p')], '')
    endfunction
endif
"
" Execute ruby file being edited
if has('win32')
    noh
    function! ReadRbResults_shell()
        exe join(['w | !c:\Ruby193\bin\ruby.exe ', expand('%:p')])
    endfunction
    function! ReadRbResults_buffer()
        exe join(['w | new | setl bt=nofile | r !c:\Ruby193\bin\ruby.exe ', expand('%:p')])
    endfunction
else
    function! ReadRbResults_shell()
        exe join(['w | !/usr/bin/env ruby ', expand('%:p')], '')
    endfunction
    function! ReadRbResults_buffer()
        exe join(['w | new | setl bt=nofile | r !/usr/bin/env ruby', expand('%:p')], '')
    endfunction
endif



if has("autocmd")
  au VimEnter * set vb t_vb= " Stop beeping and flashing!

  " Jump to last known location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " fugitive: go up a level to the parent 
  au User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

  " Auto-clean fugitive buffers
  au BufReadPost fugitive://* set bufhidden=delete

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal ai comments=n:> spell

  au BufNewFile,BufRead *.cshtml setlocal filetype=html
  au BufNewFile,BufRead *.build set ft=xml
  au BufNewFile,BufRead *.json setlocal ft=javascript

  " Mapping to execute python file being edited (<leader> doesn't work here?)
  au BufNewFile,BufRead *.py :nnoremap <buffer><silent> <leader>pe :call ReadPyResults_buffer()<CR>
  au BufNewFile,BufRead *.py :nnoremap <buffer><silent> <leader>pE :call ReadPyResults_shell()<CR>

  " Mapping to execute ruby file being edited (<leader> doesn't work here?)
  au BufNewFile,BufRead *.rb :nnoremap <buffer><silent> <leader>pe :call ReadRbResults_buffer()<CR>
  au BufNewFile,BufRead *.rb :nnoremap <buffer><silent> <leader>pE :call ReadRbResults_shell()<CR>

  " use single-line comments for .cs
  au FileType cs set commentstring=//%s
  " au FileType cs syn match csFuncDef "\v(public|private|protected|internal|(protected internal)\s+)*"

   " Quickfix mode: command line msbuild error format 
  au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m

  " Folding
  " au FileType cs set foldmethod=marker 
  " au FileType cs set foldmarker={,} 
  " au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',) 
  " au FileType cs set foldlevelstart=20 

  " check for changes on disk and prompt you to reload
  "  fires after you move the cursor and then let it sit still for updatetime
  "  milliseconds. (Default 4 seconds.)
  au CursorHold <buffer> checktime

  " another check for file updates
  au FileChangedShell * echo "Warning: File changed on disk"

  au FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

  " set syntax omni complete only when no other omni completion is set up by the filetype plugin
  " au Syntax * if &omnifunc == "" 
  "                 \ | setl omnifunc=syntaxcomplete#Complete 
  "                 \ | endif
endif

" function! ConvertUrlsToMarkdown()
"     %s/\v((https|http):\/\/\S*\)/[\1](\1)/g
" endfunction

" soft wrapping text
command! -nargs=* Wrap set wrap linebreak nolist

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

function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" tabularize plugin mappings
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

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
nnoremap <silent> <F8> :cwin <bar> cn<CR>
nnoremap <silent> <S-F8> :cwin <bar> cp<CR>
nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <silent> <F10> :call <SID>SynStack()<CR>
nnoremap <silent> <F12> <c-]>
nnoremap <silent> <C-k><C-r> g]

" quick session
if has('win32')
    nnoremap <leader>ssmk :mksession! ~/session_win32.vim<cr>
    nnoremap <leader>ssld :so ~/session_win32.vim<cr>
else
    nnoremap <leader>ssmk :mksession! ~/session_unix.vim<cr>
    nnoremap <leader>ssld :so ~/session_unix.vim<cr>
endif

" dbext options
if has('win32')
    let g:dbext_default_SQLSRV_bin='sqlcmd'
    let g:dbext_default_SQLSRV_cmd_options='-w 10000 -r -b'
endif

" set dev path
command! Work call Work()
function! Work()
    if has('win32')
        set path=C:\am\WellRight\Dev\Current\**
        cd C:\am\WellRight\Dev\Current
        command! Make make WellRight\WellRight.Web\Web.Public.csproj
        nnoremap <silent> <leader>vs :!devenv /edit "%:p"<CR>

        " dbext options
        let g:dbext_default_profile = 'localSQLServer'
        let g:dbext_default_profile_localSQLServer ='type=SQLSRV:integratedlogin=1:dbname=Wellright_Local'
    else
        set path=/cd/c/am/WellRight/Dev/Current/**
        cd /cd/c/am/WellRight/Dev/Current
        command! Make make WellRight/WellRight.Web/Web.Public.csproj

        " dbext options
        let g:dbext_default_profile = 'localODBC'
        let g:dbext_default_profile_localODBC = 'type=ODBC:user=vim:passwd=dbext:dbname=Wellright_Local'
    endif
    set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ /property:RunCodeAnalysis=false\ /property:configuration=debug
endfunction

" call Work()
cd ~

" set dict path
command! Dict call Dict()
function! Dict()
    if has('win32')
        set dictionary=C:\cygwin\usr\share\dict\words
    else
        set dictionary=/usr/share/dict/words
    endif
endfunction

command! JoinGo normal V/^go$kJ/goj

" cut/paste for vim in cygwin (not gvim)
if has('win32')
    noh
else
    nnoremap <silent> <leader>pc :call Getclip()<CR>
    vnoremap <silent> <leader>yc :call Putclip(visualmode(), 1)<CR>
    nnoremap <silent> <leader>yc :call Putclip('n', 1)<CR>

    function! Getclip()
        let reg_save = @@
        let @@ = system('getclip')
        setlocal paste
        exe 'normal p'
        setlocal nopaste
        let @@ = reg_save
    endfunction
    function! Putclip(type, ...) range
        let sel_save = &selection
        let &selection = "inclusive"
        let reg_save = @@
        if a:type == 'n'
            silent exe a:firstline . "," . a:lastline . "y"
        elseif a:type == 'c'
            silent exe a:1 . "," . a:2 . "y"
        else
            silent exe "normal! `<" . a:type .
            "`>y"
        endif
        call system('putclip', @@)
        let &selection = sel_save
        let @@ = reg_save
    endfunction
endif

if has("gui_running")
    " set gui options
    set guioptions=aegt
    set cursorline
    set background=light

    colorscheme github

    "set gui font
    if has('win32')
        set guifont=Bitstream\ Vera\ Sans\ Mono
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    endif
    
else
    set nocursorline
    set background=dark

    " arrows keys don't work on 256 color term while inserting? disabling..
    nnoremap OD <nop>
    nnoremap OA <nop>
    nnoremap OC <nop>
    nnoremap OB <nop>
    inoremap OD <nop>
    inoremap OA <nop>
    inoremap OC <nop>
    inoremap OB <nop>
    vnoremap OD <nop>
    vnoremap OA <nop>
    vnoremap OC <nop>
    vnoremap OB <nop>

    colorscheme github
endif

" let Tlist_Process_File_Always = 1
" let Tlist_Show_One_File = 1
" " Use tab for auto completion
" function! SuperTab()
"     if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
"         return "\<Tab>"
"     else
"         return "\<C-n>"
"     endif
" endfunction
" imap <Tab> <C-R>=SuperTab()<CR>

" disable slow unimpaired.vim commands: prev/next file in tree
nnoremap ]o <nop>
nnoremap [o <nop>
