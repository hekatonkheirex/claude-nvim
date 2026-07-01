--[[
Claude colorscheme for Neovim (light version)
Palette source: claude-colorscheme-final.txt (M3 tokens, light, readability-corrected)
--]]
local M = {}

local colors = {
  bg               = "#EFEEEB", -- bg
  surface          = "#F7F7F5", -- surfaceBright
  surfaceDim       = "#E1E0DB",
  surfaceContainer = "#EFEFEB",
  surfaceContainerHigh = "#E3E3E2",
  surfaceContainerHighest = "#CDCDCD",

  fg               = "#121212", -- onSurface
  fgMuted          = "#615D52", -- onSurfaceVariant

  outline          = "#898781",
  outlineVariant   = "#C3C1BB",

  -- Readability-corrected terminal-safe variants (darkened for light bg)
  primary          = "#9C553E",
  primaryBright    = "#935E47",
  secondary        = "#78645D",
  secondaryBright  = "#76655F",
  blue             = "#256BBF",
  blueBright       = "#436CA5",
  cyan             = "#367288",
  cyanBright       = "#427080",
  green            = "#42734C",
  greenBright      = "#487250",
  red              = "#8D2E45",
  redBright        = "#B23A56",
}

function M.setup(opts)
  opts = opts or {}
  vim.o.background = "light"
  if opts.transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end
  if opts.term_colors then
    vim.g.terminal_color_0  = colors.surfaceDim
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
    vim.g.terminal_color_15 = colors.fg
  end
  local highlights = {
    -- Editor basics
    Normal                     = { fg = colors.fg, bg = colors.bg },
    CursorLine                 = { bg = colors.surfaceContainer },
    CursorLineNr               = { fg = colors.primary, bold = true },
    Visual                     = { bg = colors.surfaceContainerHigh },
    Search                     = { bg = colors.surfaceContainerHigh, fg = colors.fg },
    IncSearch                  = { bg = colors.primary, fg = colors.surface },
    LineNr                     = { fg = colors.outline },
    SignColumn                 = { bg = colors.bg },
    VertSplit                  = { fg = colors.outlineVariant },
    VertSplitNC                = { fg = colors.outlineVariant },
    StatusLine                 = { fg = colors.fg, bg = colors.surfaceContainerHigh, bold = true },
    StatusLineNC               = { fg = colors.outline, bg = colors.surfaceContainer },
    Title                      = { fg = colors.green, bold = true },
    Statement                  = { fg = colors.primary },
    Conditional                = { fg = colors.primary },
    Repeat                     = { fg = colors.primary },
    Label                      = { fg = colors.primary },
    Operator                   = { fg = colors.fg },
    Keyword                    = { fg = colors.primary },
    Exception                  = { fg = colors.primary },
    PreProc                    = { fg = colors.blue },
    Include                    = { fg = colors.blue },
    Define                     = { fg = colors.blue },
    Macro                      = { fg = colors.blue },
    PreCondit                  = { fg = colors.blue },
    Constant                   = { fg = colors.primaryBright },
    String                     = { fg = colors.green },
    Character                  = { fg = colors.green },
    Number                     = { fg = colors.primaryBright },
    Boolean                    = { fg = colors.primaryBright },
    Float                      = { fg = colors.primaryBright },
    Identifier                 = { fg = colors.fg },
    Function                   = { fg = colors.blue },
    Underlined                 = { fg = colors.blue, underline = true },
    Todo                       = { bg = colors.primary, fg = colors.surface, bold = true },
    Comment                    = { fg = colors.outline, italic = true },
    Type                       = { fg = colors.secondary },
    StorageClass                = { fg = colors.secondary },
    Structure                  = { fg = colors.secondary },
    Typedef                    = { fg = colors.secondary },
    Special                    = { fg = colors.primary },
    SpecialChar                = { fg = colors.primary },
    Tag                        = { fg = colors.primary },
    Delimiter                  = { fg = colors.outline },
    SpecialComment             = { fg = colors.outlineVariant, italic = true },
    Debug                      = { fg = colors.primary },
    dir                        = { fg = colors.fg },
    link                       = { fg = colors.blue, underline = true },
    -- Diagnostics
    DiagnosticError            = { fg = colors.red },
    DiagnosticWarn             = { fg = colors.primary },
    DiagnosticInfo             = { fg = colors.blue },
    DiagnosticHint             = { fg = colors.fgMuted },
    DiagnosticOk               = { fg = colors.green },
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
    ["@comment.todo"]          = { bg = colors.primary, fg = colors.surface, bold = true },
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
