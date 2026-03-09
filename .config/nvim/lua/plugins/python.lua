return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      options = {
        notify_user_on_venv_activation = true,
        override_notify = false,
      },
    },
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {
          -- ty language server settings go here
        },
      },
    },
  },
}
