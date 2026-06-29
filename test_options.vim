set rtp+=$HOME/Projects/claude-nvim
lua require('claude').setup{flavor = "dark", transparent = true, term_colors = true}
colorscheme claude
echo "dark transparent with term colors applied"