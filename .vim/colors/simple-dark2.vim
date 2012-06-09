set background=dark
highlight clear
if exists( "syntax_on" )
    syntax reset
endif
let g:colors_name="simple-dark2"

highlight SpecialKey     term=bold ctermfg=240 guifg=#585858
highlight NonText        term=bold ctermfg=240 guifg=#585858
highlight Directory      term=bold cterm=bold ctermfg=152 gui=bold guifg=#afd7d7
highlight ErrorMsg       term=standout ctermfg=210 guifg=#ff8787
highlight IncSearch      term=reverse ctermfg=235 ctermbg=123 guifg=bg guibg=#87ffff
highlight Search         term=reverse ctermfg=235 ctermbg=221 guifg=bg guibg=#ffd75f
highlight MoreMsg        term=bold ctermfg=123 guifg=#87ffff
highlight ModeMsg        term=bold ctermfg=251 guifg=fg
highlight LineNr         term=underline ctermfg=238 ctermbg=233 guifg=#444444 guibg=#121212
highlight Question       term=standout ctermfg=251 guifg=fg
highlight StatusLine     term=bold,reverse ctermfg=233 ctermbg=249 guifg=#121212 guibg=#b2b2b2
highlight StatusLineNC   term=reverse ctermfg=233 ctermbg=243 guifg=#121212 guibg=#767676
highlight VertSplit      term=reverse ctermfg=245 ctermbg=249 guifg=#8a8a8a guibg=#b2b2b2
highlight Title          term=bold cterm=bold ctermfg=187 gui=bold guifg=#d7d7af
highlight Visual         term=reverse ctermbg=24 guibg=#005f87
highlight VisualNOS      term=bold,underline cterm=underline ctermfg=251 gui=underline guifg=fg
highlight WarningMsg     term=standout ctermfg=180 guifg=#d7af87
highlight WildMenu       term=standout ctermbg=24 guibg=#005f87
highlight Folded         term=standout ctermfg=251 ctermbg=240 guifg=fg guibg=#585858
highlight FoldColumn     term=standout ctermfg=251 ctermbg=240 guifg=fg guibg=#585858
highlight DiffAdd        term=bold ctermfg=251 ctermbg=22 guifg=fg guibg=#405040
highlight DiffChange     term=bold ctermfg=251 ctermbg=58 guifg=fg guibg=#605040
highlight DiffDelete     term=bold ctermfg=251 ctermbg=52 guifg=fg guibg=#504040
highlight DiffText       term=reverse cterm=bold ctermfg=220 ctermbg=58 gui=bold guifg=#e0b050 guibg=#605040
highlight SignColumn     term=standout ctermfg=145 guifg=#afafaf
highlight Conceal        ctermfg=7 ctermbg=8 guifg=LightGrey guibg=DarkGrey
highlight SpellBad       term=reverse cterm=undercurl ctermfg=251 ctermbg=160 gui=undercurl guisp=#ee0000
highlight SpellCap       term=reverse cterm=undercurl ctermfg=235 ctermbg=226 gui=undercurl guisp=#eeee00
highlight SpellRare      term=reverse cterm=undercurl ctermfg=235 ctermbg=214 gui=undercurl guisp=#ffa500
highlight SpellLocal     term=underline cterm=undercurl ctermfg=235 ctermbg=214 gui=undercurl guisp=#ffa500
highlight Pmenu          ctermfg=233 ctermbg=249 guifg=#121212 guibg=#b2b2b2
highlight PmenuSel       ctermfg=251 ctermbg=240 guifg=fg guibg=#585858
highlight PmenuSbar      ctermfg=233 ctermbg=251 guifg=#121212 guibg=#c6c6c6
highlight PmenuThumb     ctermfg=251 ctermbg=243 guifg=fg guibg=#767676
highlight TabLine        term=underline ctermfg=233 ctermbg=249 guifg=#121212 guibg=#b2b2b2
highlight TabLineSel     term=bold cterm=bold ctermfg=251 ctermbg=240 gui=bold guifg=fg guibg=#585858
highlight TabLineFill    term=reverse ctermfg=233 ctermbg=249 guifg=#121212 guibg=#b2b2b2
highlight CursorColumn   term=reverse ctermbg=238 guibg=#444444
highlight CursorLine     term=underline ctermbg=238 guibg=#111111
highlight ColorColumn    term=reverse ctermbg=236 guibg=#303030
highlight Cursor         ctermfg=235 ctermbg=251 guifg=bg guibg=fg
highlight lCursor        guifg=bg guibg=fg
highlight MatchParen     term=reverse cterm=bold ctermfg=251 ctermbg=66 gui=bold guifg=fg guibg=#5f8787
highlight Normal         ctermfg=251 ctermbg=235 guifg=#c6c6c6 guibg=#000000
highlight Comment        term=bold ctermfg=245 guifg=#8a8a8a
highlight Constant       term=underline ctermfg=187 guifg=#d7d7af
highlight Special        term=bold ctermfg=187 guifg=#d7d7af
highlight Identifier     term=underline cterm=bold ctermfg=251 gui=bold guifg=fg
highlight Statement      term=bold cterm=bold ctermfg=110 gui=bold guifg=#87afd7
highlight PreProc        term=underline cterm=bold ctermfg=187 gui=bold guifg=#d7d7af
highlight Type           term=underline cterm=bold ctermfg=152 gui=bold guifg=#afd7d7
highlight Underlined     term=underline cterm=underline ctermfg=251 gui=underline guifg=fg
highlight Ignore         ctermfg=235 guifg=bg
highlight Error          term=reverse ctermfg=210 guifg=#ff8787
highlight Todo           term=standout cterm=bold ctermfg=187 gui=bold guifg=#d7d7af
highlight String         guifg=#cceeff
highlight Number         guifg=#dd66bb
highlight TagListFileName ctermfg=15 ctermbg=8 guifg=white guibg=Grey
highlight csString       guifg=#dd66bb
highlight CursorIM       ctermfg=235 ctermbg=251 guifg=bg guibg=fg
