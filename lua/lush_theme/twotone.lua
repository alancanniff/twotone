--                         Normal

-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require 'lush'
local hsl = lush.hsl

local text_white = hsl(0, 5, 80) -- #d2cfcf
local string_grey = hsl(8, 5, 65) -- #d2cfcf
local comment_gray = hsl(8, 5, 35) -- 787271

local bg_black = hsl(0, 5, 5) -- #121111

local diff_add = hsl(100, 45, 60)
local diff_change = diff_add.rotate(120)
local diff_delete = diff_add.rotate(240)

local divide_dark_gray = hsl(0, 0, 15) -- #303030
local divide_light_gray = hsl(8, 3, 60) -- #9c9695
local red = hsl(0, 90, 60)
local orange = hsl(30, 90, 60) -- #f5ac46
local yellow = hsl(60, 60, 60)

local todo = hsl(60, 100, 19) -- #f5ac46
local blue = hsl(180, 60, 60)
local blue_soft = blue.darken(50)
local tabline_gray = comment_gray
-- local ldarkgrey = hsl(0, 3, 12) -- #222020
-- local lmoremsg = hsl(199, 90, 61) -- 46bbf5
-- local lnontext = hsl(9, 45, 41) -- 9b4a3a
-- local ltabgray = hsl(0, 2, 35) -- 535959
-- local ltabsel = lstatuslinefg
-- local llinenumber = hsl(0, 2, 35) -- #5e5959

-- StatusLine { fg = divide_light_gray, bg = divide_dark_gray }, -- status line of current window
-- StatusLineNC { fg = comment_gray, bg = divide_dark_gray }, -- status line of current window

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Normal { bg = bg_black, fg = text_white }, -- normal text
    Comment { fg = comment_gray, gui = 'italic' }, -- Comment        xxx cterm=italic ctermfg=243 gui=italic guifg=#787271
    Italic { gui = 'italic' },
    CursorLine { bg = Normal.bg.lighten(10) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { bg = CursorLine.bg }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Conceal { Normal }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { Normal }, -- character under the cursor
    lCursor { Normal }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Normal }, -- like Cursor, but used when in IME mode |CursorIM|
    Directory { fg = Normal.fg }, -- directory names (and other special names in listings)
    DiffAdd { fg = diff_add }, -- diff mode: Added line |diff.txt|
    DiffChange { fg = diff_change }, -- diff mode: Changed line |diff.txt|
    DiffDelete { fg = diff_delete }, -- diff mode: Deleted line |diff.txt|
    DiffText { gui = 'underline', fg = DiffChange.fg }, -- DiffText       xxx cterm=underline ctermfg=67 gui=underline guifg=#7788aa
    NonText { Comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    EndOfBuffer { Comment }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    Folded { Comment }, -- line used for closed folds

    TermCursor { gui = 'reverse' }, -- cursor in a focused terminal
    TermCursorNC { TermCursor }, -- cursor in an unfocused terminal

    VertSplit { fg = divide_dark_gray }, -- the column separating vertically split windows
    StatusLine { fg = divide_light_gray, bg = divide_dark_gray }, -- status line of current window
    StatusLineNC { fg = comment_gray, bg = divide_dark_gray }, -- status line of current window

    ErrorMsg { gui = 'bold', fg = red }, -- error messages on the command line
    WarningMsg { gui = 'bold', fg = orange }, -- warning messages
    FoldColumn { Normal }, -- 'foldcolumn'
    SignColumn { Normal }, -- column where |signs| are displayed

    IncSearch { fg = Normal.bg, bg = blue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Search { fg = Normal.bg, bg = blue_soft }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    Substitute { IncSearch }, -- |:substitute| replacement text highlighting
    LineNr { Comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { CursorLine }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { fg = yellow }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- MatchParen { fg = Normal.fg.saturate(100) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg { Normal }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { Normal }, -- Area for messages and cmdline
    MsgSeparator { Normal }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { Normal }, -- |more-prompt|
    NormalNC { Normal }, -- normal text in non-current windows
    Pmenu { bg = Normal.bg.lighten(10) }, -- Popup menu: normal item.
    PmenuSel { bg = Pmenu.bg.lighten(25) }, -- Popup menu: selected item.prompt preferred Punctuation
    PmenuSbar { bg = Pmenu.bg.lighten(15) }, -- Popup menu: scrollbar.
    PmenuThumb { bg = Pmenu.bg.lighten(25) }, -- Popup menu: Thumb of the scrollbar.
    WildMenu { Pmenu }, -- current match in 'wildmenu' completion
    NormalFloat { Pmenu }, -- Normal text in floating windows.
    Question { Normal }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { Normal }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey { fg = Normal.fg }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad { gui = 'underline' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal { SpellBad }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare { SpellBad }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    TabLine { bg = tabline_gray }, -- tab pages line, not active tab page label
    TabLineFill { gui = 'reverse' }, -- tab pages line, where there are no labels
    TabLineSel { Normal }, -- tab pages line, active tab page label
    Title { Normal }, -- titles for output from ":set all", ":autocmd" etc.
    Visual { gui = 'reverse' }, -- Visual mode selection
    VisualNOS { fg = hsl '#ff0000', bg = hsl '#00ff00' }, -- Visual mode selection when vim is "Not Owning the Selection".
    Whitespace { NonText }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant { fg = Normal.fg }, -- (preferred) any constant
    String { fg = string_grey }, --   a string constant: "this is a string"
    Character { fg = Normal.fg }, --  a character constant: 'c', '\n'
    Number { fg = Normal.fg }, --   a number constant: 234, 0xff
    Boolean { fg = Normal.fg }, --  a boolean constant: TRUE, false
    Float { fg = Normal.fg }, --    a floating point constant: 2.3e10

    Identifier { fg = Normal.fg, gui = 'bold' }, -- (preferred) any variable name
    Function { fg = Normal.fg }, -- function name (also: methods for classes)

    Statement { fg = Normal.fg }, -- (preferred) any statement
    Conditional { fg = Normal.fg }, --  if, then, else, endif, switch, etc.
    Repeat { fg = Normal.fg }, --   for, do, while, etc.
    Label { fg = Normal.fg }, --    case, default, etc.
    Operator { fg = Normal.fg }, -- "sizeof", "+", "*", etc.
    Keyword { fg = Normal.fg }, --  any other keyword
    Exception { fg = Normal.fg }, --  try, catch, throw

    PreProc { fg = Normal.fg }, -- (preferred) generic Preprocessor
    Include { fg = Normal.fg }, --  preprocessor #include
    Define { fg = Normal.fg }, --   preprocessor #define
    Macro { fg = Normal.fg }, --    same as Define
    PreCondit { fg = Normal.fg }, --  preprocessor #if, #else, #endif, etc.

    Type { fg = Normal.fg }, -- (preferred) int, long, char, etc.
    StorageClass { fg = Normal.fg }, -- static, register, volatile, etc.
    Structure { fg = Normal.fg }, --  struct, union, enum, etc.
    Typedef { fg = Normal.fg }, --  A typedef

    Special { fg = Normal.fg }, -- (preferred) any special symbol
    SpecialChar { fg = Normal.fg }, --  special character in a constant
    Tag { fg = Normal.fg }, --    you can use CTRL-] on this
    Delimiter { fg = Normal.fg }, --  character that needs attention
    SpecialComment { fg = Normal.fg }, -- special things inside a comment
    Debug { fg = Normal.fg }, --    debugging statements

    Underlined { gui = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold { gui = 'bold' },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error { ErrorMsg }, -- (preferred) any erroneous construct
    Todo { fg = todo }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    markdownError { fg = Normal.fg }, -- remove error on '_' in markdown, which shows in lsp

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    -- TSKeyword            { } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
