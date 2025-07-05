local excluded_files = {
  "node_modules",
  ".devcontainer",
  ".vscode",
  "vendor",
  "dist",
  "build",
  "coverage",
  ".git",
  ".pytest_cache",
  ".ruff_cache",
  ".venv",
  ".mypy_cache",
  "__pycache__",
  ".DS_Store",
}
local hidden_files_config = {
  ignored = true,
  hidden = true,
  exclude = excluded_files,
}
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = hidden_files_config,
        grep = hidden_files_config,
        grep_word = hidden_files_config,
        grep_buffers = hidden_files_config,
        explorer = {
          -- auto_close = true,
          enabled = true,
          ignored = true,
          layout = { layout = { position = "right" } },
          exclude = excluded_files,
        },
      },
    },
  },
}
