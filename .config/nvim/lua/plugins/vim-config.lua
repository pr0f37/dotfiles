vim.opt.termguicolors = true
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "catppuccin",
    opts = {
      integrations = {
        blink_cmp = true,
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    setup = {
      render = "virtual",
      virtual_symbol = "■",
      virtual_symbol_prefix = "",

      ---Set virtual symbol suffix (defaults to ' ')
      virtual_symbol_suffix = " ",

      ---Set virtual symbol position()
      ---@usage 'inline'|'eol'|'eow'
      virtual_symbol_position = "eow",

      enable_hex = true,
    },
  },
}
