-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 2048, lines = 32000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = true,
        spelllang = { "en_us", "fr" },
        signcolumn = "yes",
        wrap = false,
        grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]],
        grepformat = "%f:%l:%c:%m",
      },
      g = {},
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<esc>"] = { "<cmd>noh<return>", desc = "No highlight" },

        ["<leader><F5>"] = { "<cmd>UndotreeToggle<cr>", desc = "UndotreeToggle" },

        ["²w"] = { function() require("hop").hint_words { multi_windows = true } end, desc = "HopWordMW" },
        ["²c"] = { function() require("hop").hint_char1 { multi_windows = true } end, desc = "HopChar1MW" },
        ["²l"] = { function() require("hop").hint_lines { multi_windows = true } end, desc = "HopLineMW" },
        ["²p"] = { function() require("hop").hint_patterns { multi_windows = true } end, desc = "HopPatternMW" },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<leader>r"] = { name = "Refactor" },
      },

      v = {
        ["²w"] = { function() require("hop").hint_words {} end, desc = "HopWord" },
        ["²c"] = { function() require("hop").hint_char1 {} end, desc = "HopChar1" },
        ["²l"] = { function() require("hop").hint_lines {} end, desc = "HopLine" },
        ["²p"] = { function() require("hop").hint_patterns {} end, desc = "HopPattern" },

        ["<leader>lb"] = { ":!black-macchiato -l 79<CR><CR>", desc = "Black macchiato" },
      },

      t = {},
    },
  },
}
