return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local devicons = require("nvim-web-devicons")

    require("lualine").setup({
      options = {
        globalstatus = true,
        theme = require('my_colorscheme').lualine_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
        -- Mode with icon and single-letter abbreviation
        lualine_a = {
          {
            "mode",
            fmt = function(str) return str:sub(1, 1) end,
            color = { gui = "bold" },
          }
        },
        -- Git branch with an icon
        lualine_b = {
          { "branch", icon = "" },
          { "diagnostics" },
        },
        -- File path + file icon
        lualine_c = {
          {
            function()
              local filename = vim.fn.expand("%:t")                                      -- Get file name
              local ext = vim.fn.expand("%:e")                                           -- Get file extension
              local icon, icon_hl = devicons.get_icon(filename, ext, { default = true }) -- Get file icon

              if filename == "" then
                return "[No Name]"
              end

              return "%#" .. icon_hl .. "#" .. icon .. " %*" .. filename -- Apply icon highlight
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end
}
