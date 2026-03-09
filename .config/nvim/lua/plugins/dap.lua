return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue",
      },
      {
        "<F6>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
        ft = "python",
      },
      {
        "<F7>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
        ft = "python",
      },
      {
        "<F8>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
        ft = "python",
      },
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
        ft = "python",
      },
      {
        "<Leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Set Conditional Breakpoint",
        ft = "python",
      },
      {
        "<Leader>de",
        function()
          require("dap").terminate()
        end,
        desc = "Debugger terminate",
        ft = "python",
      },
      {
        "<Leader>dr",
        function()
          require("dap").run_last()
        end,
        desc = "Debugger run last",
        ft = "python",
      },
    },
    config = function()
      require("dap-python").setup("debugpy-adapter")
      local dap = require("dap")
      local dapui = require("dapui")
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.configurations.python = {
        {
          name = "Active File",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
        },
        {
          name = "FastAPI (CR SCRAPER)",
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
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   --   optional = true,
  --   --   -- OPTIMIZATION: Explicitly list dependency used in config
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     "mfussenegger/nvim-dap-python",
  --   },
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --
  --     dap.defaults.fallback.terminal_launcher = { "alacritty", "-e" }
  --
  --     -- OPTIMIZATION: Only open dapui for integrated consoles
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.configurations.python = {
  --       {
  --         name = "Active File",
  --         type = "python",
  --         request = "launch",
  --         program = "${file}",
  --         console = "integratedTerminal",
  --       },
  --       {
  --         name = "FastAPI (CR SCRAPER)",
  --         type = "python",
  --         request = "launch",
  --         module = "uvicorn",
  --         args = {
  --           -- OPTIMIZATION: Use workspaceFolder to make it portable
  --           "cr_scraper.api.main:app",
  --           "--host=0.0.0.0",
  --           "--port=8000",
  --         },
  --         console = "integratedTerminal",
  --       },
  --     }
  --     --
  --     -- ENHANCEMENT: Add useful keymaps for a better debugging experience
  --     vim.keymap.set("n", "<F5>", function()
  --       require("dap").continue()
  --     end, { desc = "DAP: Continue" })
  --     vim.keymap.set("n", "<F10>", function()
  --       require("dap").step_over()
  --     end, { desc = "DAP: Step Over" })
  --     vim.keymap.set("n", "<F11>", function()
  --       require("dap").step_into()
  --     end, { desc = "DAP: Step Into" })
  --     vim.keymap.set("n", "<F12>", function()
  --       require("dap").step_out()
  --     end, { desc = "DAP: Step Out" })
  --     vim.keymap.set("n", "<Leader>db", function()
  --       require("dap").toggle_breakpoint()
  --     end, { desc = "DAP: Toggle Breakpoint" })
  --     vim.keymap.set("n", "<Leader>dB", function()
  --       require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  --     end, { desc = "DAP: Set Conditional Breakpoint" })
  --     vim.keymap.set("n", "<Leader>de", function()
  --       require("dap").terminate()
  --     end, { desc = "Debugger reset" })
  --     vim.keymap.set("n", "<Leader>dr", function()
  --       require("dap").run_last()
  --     end, { desc = "Debugger run last" })
  --   end,
  -- },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dapui = require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = { "scopes", "stacks", "watches", "breakpoints" },
            size = 40,
            position = "left",
          },
          {
            elements = { "repl", "console" },
            size = 10,
            position = "bottom",
          },
        },
      })

      vim.keymap.set("n", "<leader>dq", function()
        dapui.close()
      end, { desc = "Quit/Close" })
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, { desc = "Toggle" })
    end,
  },
}
