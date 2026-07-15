local function catppuccin_opts(opts)
  opts = opts or {}
  opts.flavour = "mocha"
  opts.term_colors = true
  opts.transparent_background = true
  opts.float = vim.tbl_deep_extend("force", opts.float or {}, {
    transparent = true,
  })
  opts.integrations = vim.tbl_deep_extend("force", opts.integrations or {}, {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    telescope = { enabled = true },
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
  })
  opts.color_overrides = vim.tbl_deep_extend("force", opts.color_overrides or {}, {
    mocha = {
      rosewater = "#fab387",
      flamingo = "#fab387",
      peach = "#fab387",
    },
  })
  opts.custom_highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.peach, bold = true },
      Identifier = { fg = colors.peach },
      Function = { fg = colors.peach, bold = true },
      Keyword = { fg = colors.mauve, italic = true },
      Type = { fg = colors.yellow },
      Operator = { fg = colors.peach },
      Constant = { fg = colors.maroon },
      Visual = { bg = colors.surface1 },
      Search = { fg = colors.base, bg = colors.peach, bold = true },
      IncSearch = { fg = colors.base, bg = colors.red, bold = true },
      WinSeparator = { fg = colors.surface2 },
      Normal = { bg = "NONE" },
      NormalNC = { bg = "NONE" },
      NormalFloat = { bg = "NONE" },
      FloatBorder = { bg = "NONE" },
      SignColumn = { bg = "NONE" },
      StatusLine = { bg = "NONE" },
      StatusLineNC = { bg = "NONE" },
      TabLine = { bg = "NONE" },
      TabLineFill = { bg = "NONE" },
      NeoTreeNormal = { bg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE" },
      TelescopeNormal = { bg = "NONE" },
      TelescopeBorder = { bg = "NONE" },
      Directory = { fg = "#fab387", bold = false },
      NeoTreeFileIcon = { fg = "#fab387" },
      NeoTreeDirectoryIcon = { fg = "#fab387", bold = false },
      NeoTreeFileName = { fg = colors.text, bold = false },
      NeoTreeDirectoryName = { fg = colors.text, bold = false },
      NeoTreeRootName = { fg = colors.text, bold = false },
      DevIconDefault = { fg = "#fab387" },
    }
  end
  return opts
end

local function apply_transparency()
  for _, group in ipairs({
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "WinBar",
    "WinBarNC",
    "Pmenu",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "TelescopeNormal",
    "TelescopeBorder",
    "SnacksNormal",
    "SnacksNormalNC",
    "SnacksDashboardNormal",
  }) do
    local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok then
      highlight.bg = nil
      highlight.ctermbg = nil
      vim.api.nvim_set_hl(0, group, highlight)
    end
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "catppuccin*",
        callback = function()
          apply_transparency()
          vim.schedule(apply_transparency)
        end,
      })
    end,
    opts = function(_, opts)
      return catppuccin_opts(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").setup(catppuccin_opts())
        require("catppuccin").load()
        apply_transparency()
      end,
    },
  },
}
