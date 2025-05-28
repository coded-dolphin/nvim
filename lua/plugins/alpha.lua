return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 🖼️ ASCII Art (with no color)
    dashboard.section.header.val = {
      [[                                                   ]],
      [[                                              ___  ]],
      [[                                           ,o88888 ]],
      [[                                        ,o8888888' ]],
      [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
      [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
      [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
      [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
      [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
      [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
      [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
      [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
      [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
      [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
      [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
      [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
      [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
      [[     ...:.'.:.::::"'    . . . . .'                 ]],
      [[    .. . ....:."' `   .  . . ''                    ]],
      [[  . . . ...."'                                     ]],
      [[  .. . ."'                                         ]],
      [[ .                                                 ]],
      [[                                                   ]],
    }

    -- ❌ Remove highlight from ASCII art
    dashboard.section.header.opts = {
      position = "center",
      hl = "", -- No highlight group!
    }

    -- 🧩 Menu Buttons
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("i", "  Open notes", ":e ~/notes/index.md<CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("u", "  Update", ":Lazy update<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- 📅 Footer with today's date
    local date = os.date("📅  %A, %d %B %Y")
    dashboard.section.footer.val = date
    dashboard.section.footer.opts = { position = "center", hl = "Comment" }

    -- Final layout structure
    dashboard.config.layout = {
      -- { type = "padding", val = 2 },
      dashboard.section.header,
      -- { type = "padding", val = 1 },
      dashboard.section.top_header,
      -- { type = "padding", val = 2 },
      dashboard.section.buttons,
      -- { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    -- Setup Alpha
    alpha.setup(dashboard.opts)

    -- UI tweaks for dashboard only
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      pattern = "*",
      callback = function(args)
        if vim.bo[args.buf].filetype == "alpha" then
          vim.opt.showtabline = 2
          vim.opt.laststatus = 2
        end
      end,
    })
  end,
}
