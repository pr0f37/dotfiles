return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
  require("neorg").setup({
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.qol.todo_items"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "basic",
        },
      }, -- Allows for pretty icons
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Notes/notes/",
          },
          default_workspace = "notes",
        },
      },
    },
  }),
}
