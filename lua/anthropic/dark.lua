--[[
Anthropic colorscheme for Neovim (dark version)
Inspired by Catppuccin and Anthropic's earthy palette.
--]]

local M = {}

local colors = {
  -- Base neutrals (dark)
  crust   = "#5e5d59",
  mantle  = "#3d3d3a",
  base    = "#141413", -- background

  -- Surface / overlay
  surface0 = "#87867f",
  surface1 = "#b0aea5",
  surface2 = "#d1cfc5",
  overlay0 = "#cbcadb",
  overlay1 = "#f0eee6",
  overlay2 = "#faf9f5",

  -- Text
  text   = "#e8e6dc",

  -- Accent colors from Anthropic brand
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

-- Helper to generate highlight groups
local function hl(group, opts)
  opts = opts or {}
  local style = opts.style or "NONE"
  local fg = opts.fg and ("guifg=" .. opts.fg) or "guifg=NONE"
  local bg = opts.bg and ("guibg=" .. opts.bg) or "guibg=NONE"
  local sp = opts.sp and ("guisp=" .. opts.sp) or "guisp=NONE"
  local fmt = fmt or ""
  if style ~= "NONE" then
    fmt = "gui=" .. style
  end
  return string.format("highlight %s %s %s %s %s", group, fg, bg, sp, fmt)
end

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
    Title        = { fg = colors.rose,   style = "bold" }, -- rose not defined, use peach
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
    Constant     = { fg = colors.rose }, -- rose = peach
    String       = { fg = colors.green },
    Character    = { fg = colors.green },
    Number       = { fg = colors.peach },
    Boolean      = { fg = colors.peach },
    Float        = { fg = colors.peach },
    Identifier   = { fg = colors.text },
    Function     = { fg = colors.flamingo },
    Conditional  = { fg = colors.peach },
    Repeat       = { fg = colors.peach },
    Label        = { fg = colors.peach },
    Operator     = { fg = colors.text },
    Keyword      = { fg = colors.peach },
    Exception    = { fg = colors.peach },
    Underlined   = { fg = colors.sky, style = "underline" },
    Todo         = { bg = colors.yellow, fg = colors.base, style = "bold" },
    Comment      = { fg = colors.surface1, style = "italic" },
    Type         = { fg = colors.mauve },
    StorageClass = { fg = colors.mauve },
    Structure    = { fg = colors.mauve },
    Typedef      = { fg = colors.mauve },
    Special      = { fg = colors.rose },
    SpecialChar  = { fg = colors.rose },
    Tag          = { fg = colors.rose },
    Delimiter    = { fg = colors.surface2 },
    SpecialComment = { fg = colors.surface1, style = "italic" },
    Debug        = { fg = colors.rose },
    dir          = { fg = colors.text },
    link         = { fg = colors.sky, style = "underline" },
    -- Diagnostic hints (LSP)
    DiagnosticError   = { fg = colors.peach },
    DiagnosticWarn    = { fg = colors.yellow },
    DiagnosticInfo    = { fg = colors.sky },
    DiagnosticHint    = { fg = colors.teal },
    DiagnosticOk      = { fg = colors.green },
    -- Treesitter
    ["@variable"]        = { fg = colors.text },
    ["@variable.builtin"]= { fg = colors.peach },
    ["@parameter"]       = { fg = colors.text },
    ["@parameter.reference"] = { fg = colors.text },
    ["@function"]        = { fg = colors.flamingo },
    ["@function.builtin"]= { fg = colors.peach },
    ["@function.call"]   = { fg = colors.flamingo },
    ["@method"]          = { fg = colors.flamingo },
    ["@method.call"]     = { fg = colors.flamingo },
    ["@constructor"]     = { fg = colors.mauve },
    ["@constant"]        = { fg = colors.rose },
    ["@constant.builtin"]= { fg = colors.peach },
    ["@constant.macro"]  = { fg = colors.peach },
    ["@module"]          = { fg = colors.text },
    ["@module.builtin"]  = { fg = colors.peach },
    ["@label"]           = { fg = colors.peach },
    ["@attribute"]       = { fg = colors.mauve },
    ["@attribute.builtin"] = { fg = colors.peach },
    ["@property"]        = { fg = colors.text },
    ["@punctuation.delimiter"] = { fg = colors.surface2 },
    ["@punctuation.bracket"]   = { fg = colors.surface2 },
    ["@punctuation.special"]   = { fg = colors.rose },
    ["@string"]          = { fg = colors.green },
    ["@string.regexp"]   = { fg = colors.peach },
    ["@string.escape"]   = { fg = colors.peach },
    ["@string.special"]  = { fg = colors.rose },
    ["@character"]       = { fg = colors.green },
    ["@character.special"]= { fg = colors.rose },
    ["@boolean"]         = { fg = colors.peach },
    ["@number"]          = { fg = colors.peach },
    ["@float"]           = { fg = colors.peach },
    ["@type"]            = { fg = colors.mauve },
    ["@type.builtin"]    = { fg = colors.mauve },
    ["@variable.member"] = { fg = colors.text },
    ["@variable.parameter"]= { fg = colors.text },
    ["@function.call"]   = { fg = colors.flamingo },
    ["@constructor"]     = { fg = colors.mauve },
    ["@conditional"]     = { fg = colors.peach },
    ["@repeat"]          = { fg = colors.peach },
    ["@label"]           = { fg = colors.peach },
    ["@operator"]        = { fg = colors.text },
    ["@keyword"]         = { fg = colors.peach },
    ["@keyword.function"]= { fg = colors.peach },
    ["@keyword.operator"]= { fg = colors.peach },
    ["@keyword.return"]  = { fg = colors.peach },
    ["@conditional.ternary"] = { fg = colors.peach },
    ["@punctuation"]     = { fg = colors.surface2 },
    ["@comment"]         = { fg = colors.surface1, style = "italic" },
    ["@comment.todo"]    = { bg = colors.yellow, fg = colors.base, style = "bold" },
    ["@comment.error"]   = { fg = colors.peach },
    ["@comment.warning"] = { fg = colors.yellow },
    ["@comment.hint"]    = { fg = colors.teal },
    ["@comment.info"]    = { fg = colors.sky },
    ["@constant"]        = { fg = colors.rose },
    ["@constant.builtin"]= { fg = colors.peach },
    ["@variable"]        = { fg = colors.text },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
