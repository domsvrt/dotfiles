return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      color_icons = false,
      default = true,
      strict = true,
      override = {
        default_icon = { icon = "󰈚", color = "#fab387", name = "Default" },
        zsh = { icon = "", color = "#fab387", name = "Zsh" },
        bash = { icon = "", color = "#fab387", name = "Bash" },
        lua = { icon = "", color = "#fab387", name = "Lua" },
        js = { icon = "󰌞", color = "#fab387", name = "Js" },
        ts = { icon = "󰛦", color = "#fab387", name = "Ts" },
        tsx = { icon = "", color = "#fab387", name = "Tsx" },
        json = { icon = "", color = "#fab387", name = "Json" },
        toml = { icon = "", color = "#fab387", name = "Toml" },
        yaml = { icon = "", color = "#fab387", name = "Yaml" },
        md = { icon = "", color = "#fab387", name = "Md" },
        py = { icon = "", color = "#fab387", name = "Py" },
        rs = { icon = "", color = "#fab387", name = "Rs" },
        go = { icon = "", color = "#fab387", name = "Go" },
        Dockerfile = { icon = "󰡨", color = "#fab387", name = "Dockerfile" },
      },
      override_by_filename = {
        [".gitignore"] = { icon = "", color = "#fab387", name = "Gitignore" },
        [".env"] = { icon = "", color = "#fab387", name = "Env" },
        ["README.md"] = { icon = "󰍔", color = "#fab387", name = "Readme" },
      },
    },
  },
}
