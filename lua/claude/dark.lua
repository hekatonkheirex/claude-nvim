--[[
Claude colorscheme for Neovim (dark version)
--]]
local M = {}

local colors = {
  -- Background layers
  bg0 = "#000000",
  bg1 = "#3d3929",
  bg2 = "#bd5d3a",
  bg3 = "#da7756",
  bg4 = "#8492a3",
  bg5 = "#b0bcb6",
  bg6 = "#e6e3d5",
  bg7 = "#eeece2",

  -- Accent colors from Claude brand
  blue     = "#6a9bcc",
  teal     = "#bcd1ca",
  green    = "#788c5d",
  yellow   = "#ebdcbc",
  orange   = "#da7756",
  orangeRed= "#c6613f",
  purple   = "#c46686",
  pink     = "#ebcece",
  grey     = "#cbcadb",
}

function M.setup(opts)
  opts = opts or {}
  vim.o.background = "dark"
  if opts.transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end
  if opts.term_colors then
    vim.g.terminal_color_0  = colors.bg0
    vim.g.terminal_color_1  = colors.orangeRed
    vim.g.terminal_color_2  = colors.green
    vim.g.terminal_color_3  = colors.yellow
    vim.g.terminal_color_4  = colors.blue
    vim.g.terminal_color_5  = colors.purple
    vim.g.terminal_color_6  = colors.teal
    vim.g.terminal_color_7  = colors.fg
    vim.g.terminal_color_8  = colors.bg2
    vim.g.terminal_color_9  = colors.orangeRed
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.purple
    vim.g.terminal_color_14 = colors.teal
    vim.g.terminal_color_15 = colors.fg
  end
  local highlights = {
    -- Editor basics
    Normal       = { fg = colors.bg7,   bg = colors.bg0 },
    CursorLine   = { bg = colors.bg1 },
    CursorLineNr = { fg = colors.bg7,   bold = true },
    Visual       = { bg = colors.bg4, fg = colors.bg0 },
    Search       = { bg = colors.bg2,  fg = colors.bg0 },
    IncSearch    = { bg = colors.bg3, fg = colors.bg0 },
    LineNr       = { fg = colors.bg3 },
    SignColumn   = { bg = colors.bg0 },
    VertSplit    = { fg = colors.bg2 },
    VertSplitNC  = { fg = colors.bg2 },
    StatusLine   = { fg = colors.bg0,   bg = colors.bg2, bold = true },
    StatusLineNC = { fg = colors.bg3,   bg = colors.bg0 },
    TermCursor   = { bg = colors.bg7, fg = colors.bg0 },
    Title        = { fg = colors.green, bold = true },
    VisualNOS    = { bg = colors.bg2 },
    WarningMsg   = { fg = colors.orange },
    -- Syntax
    Statement    = { fg = colors.orange },
    Conditional  = { fg = colors.orange },
    Repeat       = { fg = colors.orange },
    Label        = { fg = colors.orange },
    Operator     = { fg = colors.bg7 },
    Keyword      = { fg = colors.orange },
    Exception    = { fg = colors.orange },
    PreProc      = { fg = colors.blue },
    Include      = { fg = colors.blue },
    Define       = { fg = colors.blue },
    Macro        = { fg = colors.blue },
    PreCondit    = { fg = colors.blue },
    Constant     = { fg = colors.orange },
    String       = { fg = colors.green },
    Character    = { fg = colors.green },
    Number       = { fg = colors.orange },
    Boolean      = { fg = colors.orange },
    Float        = { fg = colors.orange },
    Identifier   = { fg = colors.bg7 },
    Function     = { fg = colors.pink },
    Underlined   = { fg = colors.blue, underline = true },
    Todo         = { bg = colors.orange, fg = colors.bg0, bold = true },
    Comment      = { fg = colors.bg2, italic = true },
    Type         = { fg = colors.purple },
    StorageClass = { fg = colors.purple },
    Structure    = { fg = colors.purple },
    Typedef      = { fg = colors.purple },
    Special      = { fg = colors.orange },
    SpecialChar  = { fg = colors.orange },
    Tag          = { fg = colors.orange },
    Delimiter    = { fg = colors.bg5 },
    SpecialComment = { fg = colors.bg3, italic = true },
    Debug        = { fg = colors.orange },
    dir          = { fg = colors.bg7 },
    link         = { fg = colors.blue, underline = true },
    -- Diagnostics
    DiagnosticError   = { fg = colors.orange },
    DiagnosticWarn    = { fg = colors.orange },
    DiagnosticInfo    = { fg = colors.blue },
    DiagnosticHint    = { fg = colors.teal },
    DiagnosticOk      = { fg = colors.green },
    -- Treesitter
    ["@variable"]              = { fg = colors.bg7 },
    ["@variable.builtin"]      = { fg = colors.orange },
    ["@parameter"]             = { fg = colors.bg7 },
    ["@parameter.reference"]   = { fg = colors.bg7 },
    ["@function"]              = { fg = colors.pink },
    ["@function.builtin"]      = { fg = colors.orange },
    ["@function.call"]         = { fg = colors.pink },
    ["@method"]                = { fg = colors.pink },
    ["@method.call"]           = { fg = colors.pink },
    ["@constructor"]           = { fg = colors.purple },
    ["@constant"]              = { fg = colors.orange },
    ["@constant.builtin"]      = { fg = colors.orange },
    ["@constant.macro"]        = { fg = colors.orange },
    ["@module"]                = { fg = colors.bg7 },
    ["@module.builtin"]        = { fg = colors.orange },
    ["@label"]                 = { fg = colors.orange },
    ["@attribute"]             = { fg = colors.purple },
    ["@attribute.builtin"]     = { fg = colors.orange },
    ["@property"]              = { fg = colors.bg7 },
    ["@punctuation.delimiter"] = { fg = colors.bg5 },
    ["@punctuation.bracket"]   = { fg = colors.bg5 },
    ["@punctuation.special"]   = { fg = colors.orange },
    ["@string"]                = { fg = colors.green },
    ["@string.regexp"]         = { fg = colors.orange },
    ["@string.escape"]         = { fg = colors.orange },
    ["@string.special"]        = { fg = colors.orange },
    ["@character"]             = { fg = colors.green },
    ["@character.special"]     = { fg = colors.orange },
    ["@boolean"]               = { fg = colors.orange },
    ["@number"]                = { fg = colors.orange },
    ["@float"]                 = { fg = colors.orange },
    ["@type"]                  = { fg = colors.purple },
    ["@type.builtin"]          = { fg = colors.purple },
    ["@variable.member"]       = { fg = colors.bg7 },
    ["@variable.parameter"]    = { fg = colors.bg7 },
    ["@function.call"]         = { fg = colors.pink },
    ["@constructor"]           = { fg = colors.purple },
    ["@conditional"]           = { fg = colors.orange },
    ["@repeat"]                = { fg = colors.orange },
    ["@label"]                 = { fg = colors.orange },
    ["@operator"]              = { fg = colors.bg7 },
    ["@keyword"]               = { fg = colors.orange },
    ["@keyword.function"]      = { fg = colors.orange },
    ["@keyword.operator"]      = { fg = colors.orange },
    ["@keyword.return"]        = { fg = colors.orange },
    ["@conditional.ternary"]   = { fg = colors.orange },
    ["@punctuation"]           = { fg = colors.bg5 },
    ["@comment"]               = { fg = colors.bg2, italic = true },
    ["@comment.todo"]          = { bg = colors.orange, fg = colors.bg0, bold = true },
    ["@comment.error"]         = { fg = colors.orange },
    ["@comment.warning"]       = { fg = colors.orange },
    ["@comment.hint"]          = { fg = colors.teal },
    ["@comment.info"]          = { fg = colors.blue },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M