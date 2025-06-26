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
    config = function()
      require("render-markdown").setup({
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
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    config = function()
      require("which-key").add({

        { "<leader>m", group = "markdown", icon = { icon = "", color = "blue" } },
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "markdown preview" },
      })
    end,
  },
}
