return {
  {
    "nvim-neotest/neotest",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = {
            justMyCode = true, -- Set to true to only debug your code, not dependencies
            -- type = "Active File",
          },
          runner = "pytest",
          pytest_discover_instances = false,
        },
      },
    },
  },
}
