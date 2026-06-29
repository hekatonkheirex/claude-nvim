# Claude Colorscheme for Neovim

A warm, earthy Neovim colorscheme inspired by the Claude AI website (Anthropic).  
Provides both **dark** and **light** variants, fully compatible with popular plugins (lualine, nvim-tree, telescope, nvim-cmp, gitsigns, treesitter, LSP, etc.).

## Features

- Soft, clay‑toned background (`#000000` dark / `#eeece2` light) with text color `#3d3929` that reduces eye strain.
- Accent colors taken directly from Anthropic’s Claude branding:
  - Blue: `#6a9bcc`
  - Teal: `#bcd1ca`
  - Green: `#788c5d`
  - Orange: `#da7756`
  - Orange‑Red: `#c6613f`
  - Purple: `#c46686`
  - Pink: `#ebcece`
  - Grey: `#cbcadb`
- Improved contrast for Visual, Search, and IncSearch highlighting.
- Full support for:
  - Syntax highlighting (treesitter)
  - LSP diagnostics & inlay hints
  - Status line (lualine, lualine‑nvim)
  - File tree (nvim‑tree, neo‑tree)
  - Telescope, cmp, which‑key, indent‑blankline, etc.
- Easy toggle between dark and light.

## Installation

### Using a plugin manager

**Packer.nvim**

```lua
use {
  "hekatonkheirex/claude-nvim", -- or local path
  config = function()
    require("claude").setup{
      flavor = "dark" -- or "light"
    }
  end
}
```

**Lazy.nvim**

```lua
{
  "hekatonkheirex/claude-nvim",
  opts = {
    flavor = "dark", -- default
  },
  config = function(_, opts)
    require("claude").setup(opts)
  end
}
```

### Manual installation

Copy the `lua/claude` directory into your runtime path, e.g. `~/.config/nvim/lua/`:

```lua
require("claude").setup{
  flavor = "dark"   -- or "light"
}
```

## Usage

After installing, add the following to your `init.lua` (or `init.vim` via lua):

```lua
-- Default dark variant
require("claude").setup()

-- Or explicitly choose light
require("claude").setup{ flavor = "light" }

-- Toggle at runtime (example command)
vim.api.nvim_create_user_command("ClaudeToggle", function()
  if vim.g.claude_background == "dark" then
    vim.g.claude_background = "light"
    require("claude").setup{ flavor = "light" }
  else
    vim.g.claude_background = "dark"
    require("claude").setup{ flavor = "dark" }
  end
end, {})
```

## Customization

The module accepts an optional table with the following keys (all optional):

| Key          | Type   | Description                                      |
|--------------|--------|--------------------------------------------------|
| `flavor`     | `"dark"` \| `"light"` \| `"auto"` | Choose variant (default: `"dark"`). `"auto"` automatically switches based on `vim.o.background` and updates when the background option changes. |
| `transparent`| boolean| If true, sets `Normal` background to `NONE` (requires a transparent terminal). |
| `styles`     | table  | Override specific highlight styles (see source). |

Example:

```lua
require("claude").setup{
  flavor = "light",
  transparent = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
  }
}
```

## Development

The colors are defined in `lua/claude/dark.lua` and `lua/claude/light.lua`.  
To tweak a color, edit the corresponding `colors` table and reload Neovim (`:source $MYVIMRC` or restart).

## License

GPLv3

Enjoy coding with the calm, earthy tones of Claude!
