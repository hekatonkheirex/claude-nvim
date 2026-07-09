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

  local user_flavour = flavour or M.options.flavour
  if user_flavour == "auto" then
    user_flavour = vim.o.background
  end

  -- Determine which variant to load
  local use_flavour
  if user_flavour == "dark" then
    use_flavour = "dark"
  elseif user_flavour == "light" then
    use_flavour = "light"
  else
    -- fallback to dark if unknown
    vim.notify(
      string.format("[claude] Invalid flavour '%s'. Must be 'dark', 'light', or 'auto'. Falling back to 'dark'.", user_flavour),
      vim.log.levels.WARN
    )
    use_flavour = "dark"
  end

  -- Load the appropriate variant. Set colors_name + fire ColorScheme
  -- directly instead of calling vim.cmd.colorscheme: this function is
  -- itself invoked from colors/claude.vim (sourced by :colorscheme), so
  -- calling vim.cmd.colorscheme here would re-enter that same command
  -- while it's still running. Neovim's reentrancy guard silently no-ops
  -- the inner call, which means colors_name never actually gets set.
  local name
  if use_flavour == "dark" then
    require("claude.dark").setup(M.options)
    name = "claude"
  else
    require("claude.light").setup(M.options)
    name = "claude-light"
  end
  vim.g.colors_name = name
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = name })
end

-- Automatically reload colorscheme when 'background' option changes (for auto mode)
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if M.options.flavour == "auto" then
      M.load()
    end
  end
})

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