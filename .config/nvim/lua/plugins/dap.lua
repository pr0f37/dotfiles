return {
  {
    "mfussenegger/nvim-dap",
    opional = true,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy", "--listen", "{host}:{port}" },
      }

      -- Optional: Default configurations for launching Python files
      dap.configurations.python = {
        {
          name = "Launch current file",
          type = "debugpy",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal", -- Can be "externalTerminal" or "none"
        },
        {
          name = "Fastapi",
          type = "debugpy",
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
  require("dap-python").setup("uv"),
}
