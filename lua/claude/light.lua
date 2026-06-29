--[[
Claude colorscheme for Neovim (light version)
--]]
local M = {}

local colors = {
  -- Base neutrals (light)
  crust   = "#e8e6dc", -- ivory-dark
  mantle  = "#f0eee6", -- ivory-medium
  base    = "#faf9f5", -- ivory-light (background)

  -- Surface / overlay
  surface0 = "#d1cfc5", -- cloud-light
  surface1 = "#b0aea5", -- cloud-medium
  surface2 = "#87867f", -- cloud-dark
  overlay0 = "#cbcadb", -- heather
  overlay1 = "#788c5d", -- olive (as a mid-tone)
  overlay2 = "#d97757", -- clay (accent, still visible on light bg)

  -- Text (dark on light background)
  text   = "#141413",   -- very dark (almost black)

  -- Accent colors from Claude brand (same hues)
  sky     = "#6a9bcc",   -- blue family
  sky2    = "#6a9bcc",   -- sapphire alias
  teal    = "#bcd1ca",
  green   = "#788c5d",
  yellow  = "#ebdbbc",
  peach   = "#d97757",
  maroon  = "#c6613f",
  red     = "#d97757",   -- same as peach for warmth
  mauve   = "#c46686",
  pink    = "#ebcece",
  flamingo= "#ebcece",   -- light pink
  heather = "#cbcadb",   -- overlay0 also used as heather
  olive   = "#788c5d",   -- same as green
  manilla = "#ebdbbc",   -- same as yellow
  clay    = "#d97757",   -- same as peach/red
  fig     = "#c46686",   -- same as mauve
  coral   = "#ebcece",   -- same as pink/flamingo
}

function M.setup()
  local highlights = {
    -- Editor basics
    Normal       = { fg = colors.text,   bg = colors.base },
    CursorLine   = { bg = colors.mantle },
    CursorLineNr = { fg = colors.text,   style = "bold" },
    Visual       = { bg = colors.surface0 },
    Search       = { bg = colors.sky,    fg = colors.base },
    IncSearch    = { bg = colors.peach,  fg = colors.base },
    LineNr       = { fg = colors.surface1 },
    SignColumn   = { bg = colors.base },
    VertSplit    = { fg = colors.surface0 },
    VertSplitNC  = { fg = colors.surface0 },
    StatusLine   = { fg = colors.text,   bg = colors.mantle, style = "bold" },
    StatusLineNC = { fg = colors.surface1, bg = colors.mantle },
    Title        = { fg = colors.peach, style = "bold" },
    Statement    = { fg = colors.peach },
    Conditional  = { fg = colors.peach },
    Repeat       = { fg = colors.peach },
    Label        = { fg = colors.peach },
    Operator     = { fg = colors.text },
    Keyword      = { fg = colors.peach },
    Exception    = { fg = colors.peach },
    PreProc      = { fg = colors.sky },
    Include      = { fg = colors.sky },
    Define       = { fg = colors.sky },
    Macro        = { fg = colors.sky },
    PreCondit    = { fg = colors.sky },
    Constant     = { fg = colors.peach },
    String       = { fg = colors.green },
    Character    = { fg = colors.green },
    Number       = { fg = colors.peach },
    Boolean      = { fg = colors.peach },
    Float        = { fg = colors.peach },
    Identifier   = { fg = colors.text },
    Function     = { fg = colors.flamingo },
    Underlined   = { fg = colors.sky, style = "underline" },
    Todo         = { bg = colors.yellow, fg = colors.base, style = "bold" },
    Comment      = { fg = colors.surface1, style = "italic" },
    Type         = { fg = colors.mauve },
    StorageClass = { fg = colors.mauve },
    Structure    = { fg = colors.mauve },
    Typedef      = { fg = colors.mauve },
    Special      = { fg = colors.peach },
    SpecialChar  = { fg = colors.peach },
    Tag          = { fg = colors.peach },
    Delimiter    = { fg = colors.surface2 },
    SpecialComment = { fg = colors.surface1, style = "italic" },
    Debug        = { fg = colors.peach },
    dir          = { fg = colors.text },
    link         = { fg = colors.sky, style = "underline" },
    -- Diagnostics
    DiagnosticError   = { fg = colors.peach },
    DiagnosticWarn    = { fg = colors.yellow },
    DiagnosticInfo    = { fg = colors.sky },
    DiagnosticHint    = { fg = colors.teal },
    DiagnosticOk      = { fg = colors.green },
    -- Treesitter
    ["@variable"]              = { fg = colors.text },
    ["@variable.builtin"]      = { fg = colors.peach },
    ["@parameter"]             = { fg = colors.text },
    ["@parameter.reference"]   = { fg = colors.text },
    ["@function"]              = { fg = colors.flamingo },
    ["@function.builtin"]      = { fg = colors.peach },
    ["@function.call"]         = { fg = colors.flamingo },
    ["@method"]                = { fg = colors.flamingo },
    ["@method.call"]           = { fg = colors.flamingo },
    ["@constructor"]           = { fg = colors.mauve },
    ["@constant"]              = { fg = colors.peach },
    ["@constant.builtin"]      = { fg = colors.peach },
    ["@constant.macro"]        = { fg = colors.peach },
    ["@module"]                = { fg = colors.text },
    ["@module.builtin"]        = { fg = colors.peach },
    ["@label"]                 = { fg = colors.peach },
    ["@attribute"]             = { fg = colors.mauve },
    ["@attribute.builtin"]     = { fg = colors.peach },
    ["@property"]              = { fg = colors.text },
    ["@punctuation.delimiter"] = { fg = colors.surface2 },
    ["@punctuation.bracket"]   = { fg = colors.surface2 },
    ["@punctuation.special"]   = { fg = colors.peach },
    ["@string"]                = { fg = colors.green },
    ["@string.regexp"]         = { fg = colors.peach },
    ["@string.escape"]         = { fg = colors.peach },
    ["@string.special"]        = { fg = colors.peach },
    ["@character"]             = { fg = colors.green },
    ["@character.special"]     = { fg = colors.peach },
    ["@boolean"]               = { fg = colors.peach },
    ["@number"]                = { fg = colors.peach },
    ["@float"]                 = { fg = colors.peach },
    ["@type"]                  = { fg = colors.mauve },
    ["@type.builtin"]          = { fg = colors.mauve },
    ["@variable.member"]       = { fg = colors.text },
    ["@variable.parameter"]    = { fg = colors.text },
    ["@function.call"]         = { fg = colors.flamingo },
    ["@constructor"]           = { fg = colors.mauve },
    ["@conditional"]           = { fg = colors.peach },
    ["@repeat"]                = { fg = colors.peach },
    ["@label"]                 = { fg = colors.peach },
    ["@operator"]              = { fg = colors.text },
    ["@keyword"]               = { fg = colors.peach },
    ["@keyword.function"]      = { fg = colors.peach },
    ["@keyword.operator"]      = { fg = colors.peach },
    ["@keyword.return"]        = { fg = colors.peach },
    ["@conditional.ternary"]   = { fg = colors.peach },
    ["@punctuation"]           = { fg = colors.surface2 },
    ["@comment"]               = { fg = colors.surface1, style = "italic" },
    ["@comment.todo"]          = { bg = colors.yellow, fg = colors.base, style = "bold" },
    ["@comment.error"]         = { fg = colors.peach },
    ["@comment.warning"]       = { fg = colors.yellow },
    ["@comment.hint"]          = { fg = colors.teal },
    ["@comment.info"]          = { fg = colors.sky },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
