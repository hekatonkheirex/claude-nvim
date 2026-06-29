-- Claude colorscheme for Neovim
-- Provides both dark and light variants with an API similar to catppuccin.
local M = {}

-- Default options
M.default_options = {
  flavour = "auto", -- "dark" | "light" | "auto"
  background = {
    light = "light",
    dark = "dark",
  },
  transparent_background = false,
  term_colors = false,
  -- styles can be a table with keys like comments, conditionals, etc.
  -- each value is a list of style strings: "italic", "bold", "underline"
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  highlight_overrides = {},
}

M.options = {}

--- Setup user configuration.
-- @param user_opts (table) Optional configuration overrides.
function M.setup(user_opts)
  user_opts = user_opts or {}
  M.options = vim.tbl_deep_extend("force", M.default_options, user_opts or {})
end

--- Load the colorscheme.
-- @param flavour (string|nil) Override flavour: "dark", "light", or nil to use options.flavour.
function M.load(flavour)
  if not M.options or vim.tbl_isempty(M.options) then
    M.setup() -- initialize with defaults if not yet called
  end

  local use_flavour = flavour or M.options.flavour
  if use_flavour == "auto" then
    use_flavour = (vim.o.background == "light") and "light" or "dark"
  end

  -- Normalize to our internal names
  if use_flavour ~= "dark" and use_flavour ~= "light" then
    vim.notify(
      string.format("[claude] Invalid flavour '%s'. Must be 'dark', 'light', or 'auto'.", use_flavour),
      vim.log.levels.ERROR
    )
    return
  end

  -- Load the appropriate variant
  if use_flavour == "dark" then
    require("claude.dark").setup(M.options)
    vim.cmd.colorscheme "claude"
  else
    require("claude.light").setup(M.options)
    vim.cmd.colorscheme "claude-light"
  end
end

-- User command to load the colorscheme with optional flavour argument
vim.api.nvim_create_user_command(
  "Claude",
  function(opts)
    M.load(opts.args ~= "" and opts.args or nil)
  end,
  {
    nargs = "?",
    complete = function(lead)
      return vim.tbl_filter(function(val) return vim.startswith(val, lead) end, { "dark", "light" })
    end
  }
)

-- Helper to allow calling the module directly (e.g., require('claude').setup(...))
return M