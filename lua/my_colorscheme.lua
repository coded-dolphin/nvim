-- Define colors
local colors = {
  bg = "#0d0e0f",
  fg = "#b3b1ad",

  black = "#1c1d1e",
  red = "#b79c9c",
  green = "#98a88a",
  yellow = "#bfb3a0",
  blue = "#7a9d9a",
  magenta = "#c6a3b4",
  cyan = "#a6bdb8",
  white = "#b3b3a8",
  
  bright_black = "#2e2e2e",
  bright_red = "#c0a9a0",
  bright_green = "#a2b29f",
  bright_yellow = "#d1c8a2",
  bright_blue = "#8fa8a3",
  bright_magenta = "#d0c4d1",
  bright_cyan = "#9ab2a6",
  bright_white = "#e1e1d9",
  
  orange = "#d5a58b",
  error = "#d55a5a",
  
  -- Additional colors for more variety
  background_alt = "#101517",
  selection = "#253239",
  cursor = "#c5c8c6",
  border = "#404850",
  link = "#77aadd",
  purple = "#a187a6",
  teal = "#8fb1a5",
  gold = "#d4b574",
  rose = "#e28a8a",
  linenumber = "#121314",
  linenumbersel = "#272a2d",
  cursorline = "#131313",
}

-- Define highlights
local theme = {
  Normal = { fg = colors.fg, bg = colors.bg },
  CursorLine = { bg = colors.cursorline},
  Comment = { fg = colors.bright_black, italic = true },
  String = { fg = colors.green },
  Number = { fg = colors.orange },
  Boolean = { fg = colors.orange },
  Function = { fg = colors.blue },
  Keyword = { fg = colors.red, bold = true },
  Type = { fg = colors.magenta },
  Identifier = { fg = colors.yellow },
  Statement = { fg = colors.red, bold = true },
  Constant = { fg = colors.cyan },
  Error = { fg = colors.error, bold = true },
  Todo = { fg = colors.yellow, bold = true, italic = true },
  
  -- UI Elements
  StatusLine = { fg = colors.fg, bg = colors.background_alt},
  StatusLineNC = { fg = colors.bright_black, bg = colors.bg },
  VertSplit = { fg = colors.border },
  TabLine = { fg = colors.fg, bg = colors.black },
  TabLineSel = { fg = colors.bg, bg = colors.orange, bold = true },
  Pmenu = { fg = colors.fg, bg = colors.black },
  PmenuSel = { fg = colors.bg, bg = colors.bright_blue },
  LineNr = { fg = colors.bright_black, bg = colors.linenumber},
  CursorLineNr = { fg = colors.bright_cyan, bg = colors.linenumbersel, bold = true },

  
  -- LSP & Diagnostics
  DiagnosticError = { fg = colors.error },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.blue },
  DiagnosticHint = { fg = colors.cyan },
}

-- Treesitter Highlights
local treesitter_hl = {
  ['@comment'] = { fg = colors.bright_black, italic = true },
  ['@string'] = { fg = colors.green },
  ['@string.regex'] = { fg = colors.orange },
  ['@string.escape'] = { fg = colors.bright_blue },
  ['@number'] = { fg = colors.orange },
  ['@boolean'] = { fg = colors.orange },
  ['@float'] = { fg = colors.orange },
  
  -- Functions & Methods
  ['@function'] = { fg = colors.blue },
  ['@function.builtin'] = { fg = colors.bright_blue },
  ['@function.call'] = { fg = colors.blue },
  ['@method'] = { fg = colors.teal },
  
  -- Keywords & Operators
  ['@keyword'] = { fg = colors.red, bold = true },
  ['@keyword.function'] = { fg = colors.red, bold = true },
  ['@keyword.operator'] = { fg = colors.magenta },
  ['@operator'] = { fg = colors.gold },
  
  -- Variables & Identifiers
  ['@variable'] = { fg = colors.fg },
  ['@variable.builtin'] = { fg = colors.bright_magenta },
  ['@constant'] = { fg = colors.cyan },
  ['@constant.builtin'] = { fg = colors.bright_cyan },
  
  -- Types & Classes
  ['@type'] = { fg = colors.magenta },
  ['@type.builtin'] = { fg = colors.bright_magenta },
  ['@namespace'] = { fg = colors.yellow },
  ['@class'] = { fg = colors.purple },
  ['@struct'] = { fg = colors.teal },
  
  -- Misc
  ['@tag'] = { fg = colors.orange },
  ['@attribute'] = { fg = colors.yellow },
  ['@link'] = { fg = colors.link, underline = true },
  ['@property'] = { fg = colors.rose },
}

-- Merge Treesitter highlights into theme
theme = vim.tbl_extend('force', theme, treesitter_hl)

-- Function to apply the theme
local function apply_theme()
  for group, opts in pairs(theme) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Define the custom lualine theme using the same colors
local lualine_theme = {
  normal = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" }, b = { fg = colors.fg, bg = colors.black }, c = { fg = colors.fg, bg = colors.bg } },
  insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" }, b = { fg = colors.fg, bg = colors.black }, c = { fg = colors.fg, bg = colors.bg } },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" }, b = { fg = colors.fg, bg = colors.black }, c = { fg = colors.fg, bg = colors.bg } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" }, b = { fg = colors.fg, bg = colors.black }, c = { fg = colors.fg, bg = colors.bg } },
}

-- Return the colors and the theme for lualine
return {
  colors = colors,
  apply = apply_theme,
  lualine_theme = lualine_theme,
}
