" Vim color file

set background=light
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "github"

hi    Comment         guifg=#999988  gui=italic

hi    Boolean         gui=bold
hi    Character       guifg=#dd1144
hi    Constant        guifg=#008080
hi    Float           guifg=#009999
hi    Number          guifg=#009999
hi    RubySymbol      guifg=#990073
hi    String          guifg=#dd1144

hi    Function        guifg=#990000  gui=bold
hi    Identifier      guifg=#008080

hi    Conditional     guifg=#000000  gui=bold
hi    Exception       guifg=#990000  gui=bold
hi    Keyword         guifg=#000000  gui=bold
hi    Label           guifg=#000000  gui=bold
hi    Operator        guifg=#000000  gui=bold
hi    Repeat          guifg=#000000  gui=bold
hi    Statement       guifg=#000000  gui=bold

hi    Define          guifg=#000000  gui=bold
hi    Include         guifg=#999999  gui=bold
hi    Macro           guifg=#999999  gui=bold
hi    PreCondit       guifg=#999999  gui=bold
hi    PreProc         guifg=#999999  gui=bold

hi    StorageClass    guifg=#000000  gui=bold
hi    Structure       guifg=#000000  gui=bold
hi    Type            guifg=#445588  gui=bold
hi    Typedef         guifg=#000000  gui=bold

hi    Debug           guifg=#aa0000
hi    Delimiter       guifg=#dd1144
hi    Special         guifg=#dd1144
hi    SpecialChar     guifg=#dd1144
hi    SpecialComment  guifg=#999999  gui=bold,italic
hi    Tag             guifg=#000080

hi    Error           guifg=#a61717  guibg=#e3d2d2
hi    Ignore          guifg=bg
hi    Todo            guifg=#999988  gui=italic
hi    Underlined      gui=underline

hi    CursorLine      guifg=NONE     guibg=#f8f8f8
hi    DiffAdd         guifg=#000000  guibg=#ddffdd
"hi   DiffChange      guibg=#ffffe6  gui=none
hi    DiffDelete      guifg=#000000  guibg=#ffdddd
hi    DiffText        guibg=#666666
hi    Directory       guifg=#4183c4
hi    ErrorMsg        guifg=#a61717  guibg=#e3d2d2  gui=bold
hi    LineNr          guifg=#666666  guibg=#eaeaea
hi    MatchParen      term=reverse   ctermbg=11     guibg=#CCCCCC
hi    ModeMsg         gui=bold
hi    Normal          guifg=#000000  guibg=#ffffff
hi    Pmenu           guibg=#babdb6  guifg=#555753
hi    Visual          guifg=NONE     guibg=#ffffcc

hi    Cursor          guifg=white    guibg=black
hi    iCursor         guifg=black    guibg=#ff0099

hi VertSplit          guifg=#202020  guibg=#000000  gui=NONE
hi StatusLine         guifg=#FFFFCF  guibg=#000000  gui=NONE
hi StatusLineNC       guifg=#C0C0A0  guibg=#202020  gui=NONE

set   guicursor=n-v-c:block-Cursor
set   guicursor+=i:ver100-iCursor
set   guicursor+=n-v-c:blinkon0


hi   link   Boolean                   Constant
hi   link   Character                 Constant
hi   link   Conditional               Statement
hi   link   Debug                     Special
hi   link   Define                    PreProc
hi   link   Delimiter                 Special
hi   link   Exception                 Statement
hi   link   Float                     Number
hi   link   Function                  Normal
hi   link   Include                   PreProc
hi   link   Keyword                   Statement
hi   link   Label                     Statement
hi   link   Macro                     PreProc
hi   link   Number                    Constant
hi   link   PreCondit                 PreProc
hi   link   Repeat                    Statement
hi   link   SpecialChar               Special
hi   link   SpecialComment            Special
hi   link   StorageClass              Type
hi   link   String                    Constant
hi   link   Structure                 Type
hi   link   Tag                       Special
hi   link   Typedef                   Type
hi   link   csXmlTag                  Keyword
hi   link   cssColorProp              cssBoxProp
hi   link   cssFontProp               cssBoxProp
hi   link   cssGeneratedContentProp   cssBoxProp
hi   link   cssRenderProp             cssBoxProp
hi   link   cssTableProp              cssBoxProp
hi   link   cssTextProp               cssBoxProp
hi   link   djangoTagBlock            djangoVarBlock
hi   link   htmlCommentPart           htmlComment
hi   link   htmlEndTag                Identifier
hi   link   htmlTag                   Keyword
hi   link   htmlTagN                  htmlTag
"hi   link   htmlTagName               Conditional
hi   link   htmlTagName               htmlTag
hi   link   javaFold                  Special
hi   link   javaScriptIdentifier      Statement
hi   link   javaScriptNumber          Number
hi   link   pythonEscape              Keyword
hi   link   xmlEndTag                 Identifier
hi   link   xmlTag                    Keyword
hi   link   xmlTagName                Conditional
