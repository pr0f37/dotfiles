return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
    },
    formatters = {
      priettier = {
        args = { "--prose-wrap", "always" },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite

    ft = "markdown",
    opts = {
      completions = { blink = { enabled = true } },
      bullet = {
        icons = { "", "○", "◆", "◇" },
      },
      checkbox = {
        bullet = false,
        right_pad = 1,
        unchecked = {
          icon = " 󱓼 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "  ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },
        custom = {
          todo = {
            raw = "[-]",
            rendered = "󰥔 ",
            highlight = "RenderMarkdownTodo",
            scope_highlight = nil,
          },
        },
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    ft = { "markdown" },
  },
}
