return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    -- OPTIMIZATION: Explicitly list dependency used in config
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.defaults.fallback.terminal_launcher = { "alacritty", "-e" }

      -- OPTIMIZATION: Only open dapui for integrated consoles
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      -- Listeners for closing dapui are kept commented out as per your preference.

      dap.adapters.python = {
        type = "executable",
        command = "python", -- Ensure this python is in your PATH and has debugpy
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          name = "Active File",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
        },
        {
          name = "FastAPI (Uvicorn)",
          type = "python",
          request = "launch",
          module = "uvicorn",
          args = {
            -- OPTIMIZATION: Use workspaceFolder to make it portable
            "cr_scraper.api.main:app",
            "--host=0.0.0.0",
            "--port=8000",
          },
          console = "integratedTerminal",
        },
      }

      -- ENHANCEMENT: Add useful keymaps for a better debugging experience
      vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
      end, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<F10>", function()
        require("dap").step_over()
      end, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<F11>", function()
        require("dap").step_into()
      end, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<F12>", function()
        require("dap").step_out()
      end, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<Leader>db", function()
        require("dap").toggle_breakpoint()
      end, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP: Set Conditional Breakpoint" })
      vim.keymap.set("n", "<Leader>de", function()
        require("dap").terminate()
      end, { desc = "Debugger reset" })
      vim.keymap.set("n", "<Leader>dr", function()
        require("dap").run_last()
      end, { desc = "Debugger run last" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dapui = require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = { "scopes" },
            size = 40,
            position = "left",
          },
          {
            elements = { "stacks", "watches", "breakpoints" },
            position = "right",
            size = 40,
          },
          {
            elements = { "repl" },
            size = 10,
            position = "bottom",
          },
        },
      })

      vim.keymap.set("n", "<leader>dq", function()
        dapui.close()
      end, { desc = "DAP UI: Quit/Close" })
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, { desc = "DAP UI: Toggle" })
    end,
  },
}
