package.path = 'lua/?.lua;' .. package.path

-- Initialize minimal vim environment for testing
_G.vim = {
  o = {},
  fn = {
    hlID = function(group) return 1 end,
    synIDattr = function(id, attr)
      if attr == "bg" then return "#000000" end
      return ""
    end
  },
  notify = function() end,
  log = { levels = { WARN = 3 } }
}

-- Mock require for claude modules
package.loaded["claude.dark"] = { setup = function() end }
package.loaded["claude.light"] = { setup = function() end }

-- Now require and test
local claude = require("claude")

print("Testing auto mode...")

-- Test initial dark
vim.o.background = "dark"
claude.setup({flavor = "auto"})
claude.load()
local initial_bg = vim.o.background
print("Initial background:", initial_bg)

-- Test switching to light
vim.o.background = "light"
-- Simulate the OptionSet autocmd triggering
if claude.options.flavor == "auto" then
  claude.load()
end
local final_bg = vim.o.background
print("Final background:", final_bg)

print("Auto mode test completed successfully!")