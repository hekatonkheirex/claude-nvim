--[[
Claude colorscheme for Neovim (dark version)
--]]
local M = {}

local colors = {
  -- Background layers
  bg0 = "#5e5d59",
  bg1 = "#3d3d3a",
  bg2 = "#141413",
  bg3 = "#87867f",
  bg4 = "#b0aea5",
  bg5 = "#d1cfc5",
  bg6 = "#cbcadb",
  bg7 = "#f0eee6",
  bg8 = "#faf9f5",
  fg   = "#e8e6dc",

  -- Accent colors from Claude brand
  blue     = "#6a9bcc",
  teal     = "#bcd1ca",
  green    = "#788c5d",
  yellow   = "#ebdbbc",
  orange   = "#d97757",
  orangeRed= "#c6613f",
  purple   = "#c46686",
  pink     = "#ebcece",
  grey     = "#cbcadb",
}

function M.setup(opts)
  opts = opts or {}
  vim.g.colors_name = "claude"
  vim.o.background = "dark"
  if opts.transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end
  local highlights = {
    -- Editor basics
    Normal       = { fg = colors.fg,   bg = colors.bg2 },
    CursorLine   = { bg = colors.bg1 },
    CursorLineNr = { fg = colors.fg,   style = "bold" },
    Visual       = { bg = colors.bg3 },
    Search       = { bg = colors.blue,    fg = colors.bg2 },
    IncSearch    = { bg = colors.orange,  fg = colors.bg2 },
    LineNr       = { fg = colors.bg4 },
    SignColumn   = { bg = colors.bg2 },
    VertSplit    = { fg = colors.bg3 },
    VertSplitNC  = { fg = colors.bg3 },
    StatusLine   = { fg = colors.bg2,   bg = colors.bg3, style = "bold" },
    StatusLineNC = { fg = colors.bg4,   bg = colors.bg2 },
    TermCursor   = { bg = colors.fg, fg = colors.bg2 },
    Title        = { fg = colors.green, style = "bold"},
    VisualNOS    = { bg = colors.bg3 },
    WarningMsg   = { fg = colors.orange },
    -- Syntax
    Statement    = { fg = colors.orange },
    Conditional  = { fg = colors.orange },
    Repeat       = { fg = colors.orange },
    Label        = { fg = colors.orange },
    Operator     = { fg = colors.fg },
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
    Identifier   = { fg = colors.fg },
    Function     = { fg = colors.pink },
    Underlined   = { fg = colors.blue, style = "underline" },
    Todo         = { bg = colors.yellow, fg = colors.bg2, style = "bold" },
    Comment      = { fg = colors.bg4, style = "italic" },
    Type         = { fg = colors.purple },
    StorageClass = { fg = colors.purple },
    Structure    = { fg = colors.purple },
    Typedef      = { fg = colors.purple },
    Special      = { fg = colors.orange },
    SpecialChar  = { fg = colors.orange },
    Tag          = { fg = colors.orange },
    Delimiter    = { fg = colors.bg5 },
    SpecialComment = { fg = colors.bg4, style = "italic" },
    Debug        = { fg = colors.orange },
    dir          = { fg = colors.fg },
    link         = { fg = colors.blue, style = "underline" },
    -- Diagnostics
    DiagnosticError   = { fg = colors.orange },
    DiagnosticWarn    = { fg = colors.yellow },
    DiagnosticInfo    = { fg = colors.blue },
    DiagnosticHint    = { fg = colors.teal },
    DiagnosticOk      = { fg = colors.green },
    -- Treesitter
    ["@variable"]              = { fg = colors.fg },
    ["@variable.builtin"]      = { fg = colors.orange },
    ["@parameter"]             = { fg = colors.fg },
    ["@parameter.reference"]   = { fg = colors.fg },
    ["@function"]              = { fg = colors.pink },
    ["@function.builtin"]      = { fg = colors.orange },
    ["@function.call"]         = { fg = colors.pink },
    ["@method"]                = { fg = colors.pink },
    ["@method.call"]           = { fg = colors.pink },
    ["@constructor"]           = { fg = colors.purple },
    ["@constant"]              = { fg = colors.orange },
    ["@constant.builtin"]      = { fg = colors.orange },
    ["@constant.macro"]        = { fg = colors.orange },
    ["@module"]                = { fg = colors.fg },
    ["@module.builtin"]        = { fg = colors.orange },
    ["@label"]                 = { fg = colors.orange },
    ["@attribute"]             = { fg = colors.purple },
    ["@attribute.builtin"]     = { fg = colors.orange },
    ["@property"]              = { fg = colors.fg },
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
    ["@variable.member"]       = { fg = colors.fg },
    ["@variable.parameter"]    = { fg = colors.fg },
    ["@function.call"]         = { fg = colors.pink },
    ["@constructor"]           = { fg = colors.purple },
    ["@conditional"]           = { fg = colors.orange },
    ["@repeat"]                = { fg = colors.orange },
    ["@label"]                 = { fg = colors.orange },
    ["@operator"]              = { fg = colors.fg },
    ["@keyword"]               = { fg = colors.orange },
    ["@keyword.function"]      = { fg = colors.orange },
    ["@keyword.operator"]      = { fg = colors.orange },
    ["@keyword.return"]        = { fg = colors.orange },
    ["@conditional.ternary"]   = { fg = colors.orange },
    ["@punctuation"]           = { fg = colors.bg5 },
    ["@comment"]               = { fg = colors.bg4, style = "italic" },
    ["@comment.todo"]          = { bg = colors.yellow, fg = colors.bg2, style = "bold" },
    ["@comment.error"]         = { fg = colors.orange },
    ["@comment.warning"]       = { fg = colors.yellow },
    ["@comment.hint"]          = { fg = colors.teal },
    ["@comment.info"]          = { fg = colors.blue },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M