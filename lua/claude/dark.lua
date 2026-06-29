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
    StatusLine  

Actually we need to   We'll
     need to generate the full highlights list with the new names. Let's write a quick Python script to produce the highlights from the original mapping, but given time constraints, maybe easier to manually write the highlights using the earlier mapping we derived. Let's do that manually but carefully.

We need to list all highlight groups from the original and replace the color references.

Instead of doing manual error-prone, we can produce the new file by taking the original highlights and doing string replacements using sed for each color variable.

We can do stepwise: replace all occurrences of `colors\.crust` with `colors.bg0`, `colors\.mantle` -> `colors.bg1`, etc.

Let's do that on the original file.

We'll start with the original file, then apply sed substitutions for each color name.

We'll also need to change the function signature and add the prelue lines before the `local highlights = {`.

Let's do step by step using a script.

First, copy original to a temp file.


<tool_call>
<function=exec_command>
<parameter=cmd>
cd /home/mura/Projects/claude-nvim && cp /tmp/orig_dark.lua /tmp/dark_tmp.lua