-- Claude colorscheme for Neovim
-- Provides both dark and light variants.
local M = {}

local dark = require("claude.dark")
local light = require("claude.light")

function M.setup(opts)
  opts = opts or {}
  local flavor = opts.flavor or "dark" -- default dark
  if flavor == "light" then
    light.setup(opts)
  else
    dark.setup(opts)
  end
end

return M
