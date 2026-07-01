--[[
Claude colorscheme for Neovim (dark version)
Palette source: claude-colorscheme-final.txt (M3 tokens, dark)
--]]
local M = {}

local colors = {
  bg               = "#121212", -- surface
  bgDim            = "#000000", -- surfaceDim
  bgContainer      = "#1F1F1F", -- surfaceContainer (CursorLine)
  bgContainerHigh  = "#292929", -- surfaceContainerHigh (selection/status)
  bgContainerHighest = "#333333",

  fg               = "#EDEDED", -- onSurface
  fgMuted          = "#BFBFBF", -- onSurfaceVariant

  outline          = "#8F8A8A",
  outlineVariant   = "#4C4C4C",

  primary          = "#DF8D72",
  primaryBright    = "#EBA88F",

  secondary        = "#B5A29B",
  secondaryBright  = "#C9BAB5",

  blue             = "#7FADE6", -- tertiary
  blueBright       = "#99C1EC",

  cyan             = "#6FBCD6",
  cyanBright       = "#8ECEE3",

  green            = "#7FB88A",
  greenBright      = "#97CBA1",

  red              = "#D47C92", -- error
  redBright        = "#E098AB",
}

function M.setup(opts)
  opts = opts or {}
  vim.o.background = "dark"
  if opts.transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end
  if opts.term_colors then
    vim.g.terminal_color_0  = colors.bgContainer
    vim.g.terminal_color_1  = colors.red
    vim.g.terminal_color_2  = colors.green
    vim.g.terminal_color_3  = colors.primary
    vim.g.terminal_color_4  = colors.blue
    vim.g.terminal_color_5  = colors.secondary
    vim.g.terminal_color_6  = colors.cyan
    vim.g.terminal_color_7  = colors.fgMuted
    vim.g.terminal_color_8  = colors.outline
    vim.g.terminal_color_9  = colors.redBright
    vim.g.terminal_color_10 = colors.greenBright
    vim.g.terminal_color_11 = colors.primaryBright
    vim.g.terminal_color_12 = colors.blueBright
    vim.g.terminal_color_13 = colors.secondaryBright
    vim.g.terminal_color_14 = colors.cyanBright
    vim.g.terminal_color_15 = "#FFFFFF"
  end
  local highlights = {
    -- Editor basics
    Normal       = { fg = colors.fg,     bg = colors.bg },
    CursorLine   = { bg = colors.bgContainer },
    CursorLineNr = { fg = colors.primary, bold = true },
    Visual       = { bg = colors.bgContainerHigh },
    Search       = { bg = colors.bgContainerHigh, fg = colors.fg },
    IncSearch    = { bg = colors.primary, fg = colors.bg },
    LineNr       = { fg = colors.outline },
    SignColumn   = { bg = colors.bg },
    VertSplit    = { fg = colors.outlineVariant },
    VertSplitNC  = { fg = colors.outlineVariant },
    StatusLine   = { fg = colors.fg,     bg = colors.bgContainerHigh, bold = true },
    StatusLineNC = { fg = colors.outline, bg = colors.bgContainer },
    TermCursor   = { bg = colors.fg,     fg = colors.bg },
    Title        = { fg = colors.green, bold = true },
    VisualNOS    = { bg = colors.bgContainerHigh },
    WarningMsg   = { fg = colors.primary },
    -- Syntax
    Statement    = { fg = colors.primary },
    Conditional  = { fg = colors.primary },
    Repeat       = { fg = colors.primary },
    Label        = { fg = colors.primary },
    Operator     = { fg = colors.fg },
    Keyword      = { fg = colors.primary },
    Exception    = { fg = colors.primary },
    PreProc      = { fg = colors.blue },
    Include      = { fg = colors.blue },
    Define       = { fg = colors.blue },
    Macro        = { fg = colors.blue },
    PreCondit    = { fg = colors.blue },
    Constant     = { fg = colors.primaryBright },
    String       = { fg = colors.green },
    Character    = { fg = colors.green },
    Number       = { fg = colors.primaryBright },
    Boolean      = { fg = colors.primaryBright },
    Float        = { fg = colors.primaryBright },
    Identifier   = { fg = colors.fg },
    Function     = { fg = colors.blue },
    Underlined   = { fg = colors.blue, underline = true },
    Todo         = { bg = colors.primary, fg = colors.bg, bold = true },
    Comment      = { fg = colors.outline, italic = true },
    Type         = { fg = colors.secondary },
    StorageClass = { fg = colors.secondary },
    Structure    = { fg = colors.secondary },
    Typedef      = { fg = colors.secondary },
    Special      = { fg = colors.primary },
    SpecialChar  = { fg = colors.primary },
    Tag          = { fg = colors.primary },
    Delimiter    = { fg = colors.outline },
    SpecialComment = { fg = colors.outlineVariant, italic = true },
    Debug        = { fg = colors.primary },
    dir          = { fg = colors.fg },
    link         = { fg = colors.blue, underline = true },
    -- Diagnostics
    DiagnosticError   = { fg = colors.red },
    DiagnosticWarn    = { fg = colors.primary },
    DiagnosticInfo    = { fg = colors.blue },
    DiagnosticHint    = { fg = colors.fgMuted },
    DiagnosticOk      = { fg = colors.green },
    -- Treesitter
    ["@variable"]              = { fg = colors.fg },
    ["@variable.builtin"]      = { fg = colors.primary },
    ["@parameter"]             = { fg = colors.fg },
    ["@parameter.reference"]   = { fg = colors.fg },
    ["@function"]              = { fg = colors.blue },
    ["@function.builtin"]      = { fg = colors.primary },
    ["@function.call"]         = { fg = colors.blue },
    ["@method"]                = { fg = colors.blue },
    ["@method.call"]           = { fg = colors.blue },
    ["@constructor"]           = { fg = colors.secondary },
    ["@constant"]              = { fg = colors.primaryBright },
    ["@constant.builtin"]      = { fg = colors.primaryBright },
    ["@constant.macro"]        = { fg = colors.primaryBright },
    ["@module"]                = { fg = colors.fg },
    ["@module.builtin"]        = { fg = colors.primary },
    ["@label"]                 = { fg = colors.primary },
    ["@attribute"]             = { fg = colors.secondary },
    ["@attribute.builtin"]     = { fg = colors.primary },
    ["@property"]              = { fg = colors.fg },
    ["@punctuation.delimiter"] = { fg = colors.outline },
    ["@punctuation.bracket"]   = { fg = colors.outline },
    ["@punctuation.special"]   = { fg = colors.primary },
    ["@string"]                = { fg = colors.green },
    ["@string.regexp"]         = { fg = colors.primary },
    ["@string.escape"]         = { fg = colors.primary },
    ["@string.special"]        = { fg = colors.primary },
    ["@character"]             = { fg = colors.green },
    ["@character.special"]     = { fg = colors.primary },
    ["@boolean"]               = { fg = colors.primaryBright },
    ["@number"]                = { fg = colors.primaryBright },
    ["@float"]                 = { fg = colors.primaryBright },
    ["@type"]                  = { fg = colors.secondary },
    ["@type.builtin"]          = { fg = colors.secondary },
    ["@variable.member"]       = { fg = colors.fg },
    ["@variable.parameter"]    = { fg = colors.fg },
    ["@conditional"]           = { fg = colors.primary },
    ["@repeat"]                = { fg = colors.primary },
    ["@operator"]              = { fg = colors.fg },
    ["@keyword"]               = { fg = colors.primary },
    ["@keyword.function"]      = { fg = colors.primary },
    ["@keyword.operator"]      = { fg = colors.primary },
    ["@keyword.return"]        = { fg = colors.primary },
    ["@conditional.ternary"]   = { fg = colors.primary },
    ["@punctuation"]           = { fg = colors.outline },
    ["@comment"]               = { fg = colors.outline, italic = true },
    ["@comment.todo"]          = { bg = colors.primary, fg = colors.bg, bold = true },
    ["@comment.error"]         = { fg = colors.red },
    ["@comment.warning"]       = { fg = colors.primary },
    ["@comment.hint"]          = { fg = colors.cyan },
    ["@comment.info"]          = { fg = colors.blue },
  }

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
