return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.defaults.fallback.terminal_launcher = { "alacritty", "-e" }
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.after.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.after.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      -- Optional: Default configurations for launching Python files
      dap.configurations.python = {
        {
          name = "Pytest in External Terminal", -- You can rename it for clarity
          type = "python",
          request = "launch",
          program = "${file}",
          console = "externalTerminal", -- The magic happens here!
        },
        {
          name = "Pytest",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal", -- Can be "externalTerminal" or "none"
        },
        {
          name = "Fastapi",
          type = "python",
          request = "launch",
          module = "uvicorn",
          args = {
            "cr_scraper.api.main:app",
            "--host=0.0.0.0",
            "--port=8000",
          },
          console = "integratedTerminal", -- Can be "externalTerminal" or "none"
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  vim.keymap.set("n", "<leader>dq", function()
    require("dapui").close()
  end, { desc = "DAP UI: Quit/Close" }),
}
